from datetime import datetime
from multiprocessing import context
import os
from django.http import FileResponse, HttpResponse, HttpResponseRedirect
from django.utils.http import urlquote
from django.db.models import Q  # 用于复合拆查询
from django.shortcuts import render
from file_manage.models import ApproveLog, File
from admin_manage.models import UserOperateLog
from django.urls import reverse
from django.core.paginator import Paginator  # 用于分页
import hashlib
from file_manage.sm4_c import SM4

# Create your views here.
# 定义全局，用于加解密
key = "0123456789ABCDEFFEDCBA9876543210"
SM4 = SM4()
# 首页
def index(request, pIndex=1):
    '''浏览信息'''
    fmod = File.objects
    flist = fmod.filter(~Q(isapprove='2'))
    mywhere = []

    #获取并判断搜索条件
    kw = request.GET.get("keyword", None)
    if kw:
        flist = flist.filter(
            Q(filename__contains=kw) | Q(fileno__contains=kw)
            | Q(owner__contains=kw))
        mywhere.append('keyword=' + kw)  # 用作条件维持，防止分页后条件丢失

    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(flist, 5)  #以每页5条数据分页
    maxpages = page.num_pages  #获取最大页数
    #判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  #获取当前页数据
    plist = page.page_range  #获取页码列表信息
    context = {
        "filelist": list2,
        'plist': plist,
        'pIndex': pIndex,
        'maxpages': maxpages,
        'mywhere': mywhere
    }
    return render(request, 'file_manage/index/index.html', context)


# 加载文档上传表单
def upload(request):
    return render(request, 'file_manage/upload.html')


# 执行文件上传
def doupload(request):
    myfile = request.FILES.get("doc", None)
    if not myfile:
        return HttpResponse("没有上传的文件信息")
    year = str(datetime.now().year)
    month = str(datetime.now().month)
    day = str(datetime.now().day)
    username = request.session['adminuser']['username'].upper()
    upload_path = os.path.join('static/uploads', username, year, month,
                               day)  # 文件路径拼装
    # print(upload_path)
    if os.path.isfile(os.path.join(upload_path, myfile.name)):
        context = {'info': myfile.name + '已存在'+',请重新上传'}
        return render(request, 'file_manage/upload.html', context)
    if not os.path.exists(upload_path):
        os.makedirs(upload_path)

    # 文档加密存储
    # with open(os.path.join(upload_path, myfile.name), 'wb+') as f:
    #     for chunk in myfile.chunks():  #分块读取上传文件内容并写入目标文件
    #         chunk_encrypt = SM4.encryptSM4(key,str(chunk,encoding='utf-8'))
    #         f.write(bytes(chunk_encrypt.encode()))

    with open(os.path.join(upload_path, myfile.name), 'wb+') as f:
        for chunk in myfile.chunks():  #分块读取上传文件内容并写入目标文件
            chunk_encrypt = SM4.encryptSM4(key,chunk)
            f.write(chunk_encrypt)


    # 文件哈希值计算 用于后面的篡改校验
    with open(os.path.join(upload_path, myfile.name), 'rb') as f:
        file_hash = hashlib.md5(f.read()).hexdigest()

    # 将上传记录插入到文件表中
    records = File()
    records.fileno = str(
        datetime.now().strftime('%Y%m%d%H%M%S%f'))[:17]  # 时间精确到0.001s，用作文件的编号
    records.filename = myfile.name
    records.filepath = upload_path
    records.file_hash = file_hash
    records.owner = username
    records.save()

    # 日志记录
    logs = UserOperateLog()
    logs.nickname = request.session['adminuser']['nickname']
    logs.username = username
    logs.department = request.session['adminuser']['department']
    logs.do_type = '上传'
    logs.fileno = records.fileno
    logs.filename = records.filename
    logs.save()

    url = reverse('file_manage_index', kwargs={'pIndex': 1})  # 逆解析url
    return HttpResponseRedirect(url)


# 加载审批列表
def approve_list(request, pIndex=1):
    '''浏览信息'''
    fmod = File.objects
    flist = fmod.filter(~Q(isapprove='2'))  # 过滤掉已驳回
    mywhere = []

    #获取并判断搜索条件
    kw = request.GET.get("keyword", None)
    if kw:
        flist = flist.filter(
            Q(filename__contains=kw) | Q(fileno__contains=kw)
            | Q(owner__contains=kw))
        mywhere.append('keyword=' + kw)  # 用作条件维持，防止分页后条件丢失

    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(flist, 5)  #以每页5条数据分页
    maxpages = page.num_pages  #获取最大页数
    #判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  #获取当前页数据
    plist = page.page_range  #获取页码列表信息
    context = {
        "filelist": list2,
        'plist': plist,
        'pIndex': pIndex,
        'maxpages': maxpages,
        'mywhere': mywhere
    }
    return render(request, 'file_manage/approve_list.html', context)


# 文件审批
def approve(request, file_id):
    file = File.objects.get(id=file_id)
    if file.isapprove == '0':
        file.isapprove = '1'
    else:
        file.isapprove = '0' 
    file.save()
    # 插入审批日志
    logs = ApproveLog()
    logs.fileno = file.fileno
    logs.filename = file.filename
    logs.owner = file.owner
    logs.add_time = file.add_time
    logs.isapprove = file.isapprove
    logs.approve_person = request.session['adminuser']['username']
    logs.save()

    url = reverse('approvelist', kwargs={'pIndex': 1})  # 逆解析url
    return HttpResponseRedirect(url)


#  文件驳回
def reject(request, file_id):
    file = File.objects.get(id=file_id)
    file.isapprove = '2'
    file.save()

    # 插入审批日志
    logs = ApproveLog()
    logs.fileno = file.fileno
    logs.filename = file.filename
    logs.owner = file.owner
    logs.add_time = file.add_time
    logs.isapprove = file.isapprove
    logs.save()

    url = reverse('approvelist', kwargs={'pIndex': 1})  # 逆解析url
    return HttpResponseRedirect(url)


# 审批记录
def approve_log(request, pIndex=1):
    '''浏览信息'''
    fmod = ApproveLog.objects
    flist = fmod.filter()
    mywhere = []

    #获取并判断搜索条件
    kw = request.GET.get("keyword", None)
    if kw:
        flist = flist.filter(
            Q(filename__contains=kw) | Q(fileno__contains=kw)
            | Q(owner__contains=kw))
        mywhere.append('keyword=' + kw)  # 用作条件维持，防止分页后条件丢失

    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(flist, 5)  #以每页5条数据分页
    maxpages = page.num_pages  #获取最大页数
    #判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  #获取当前页数据
    plist = page.page_range  #获取页码列表信息
    context = {
        "filelist": list2,
        'plist': plist,
        'pIndex': pIndex,
        'maxpages': maxpages,
        'mywhere': mywhere
    }
    return render(request, 'file_manage/approve_log.html', context)


# 文件下载
def download(request, file_id):
    file = File.objects.get(id=file_id)
    filename = file.filename
    filepath = file.filepath
    if not os.path.isfile(os.path.join(filepath, filename)):
        return render(request, 'file_manage/file_download_error.html',
                      {'msg': '文件可能已经被删除，请联系管理员~'})
    # 哈希篡改校验
    with open(os.path.join(filepath, filename), 'rb') as f:
        file_hash = hashlib.md5(f.read()).hexdigest()
    if file.file_hash != file_hash:
        file.status = 1
        file.save()
        return render(request, 'file_manage/tamper_error.html',
                      {'msg': '文件可能已经被篡改，请联系管理员处理~'})    

    # 解密文档
    with open(os.path.join(filepath, filename), 'rb') as f:
        download_file_decrypt = SM4.decryptSM4(key,f.read())
        with open(os.path.join(filepath, 'tempfile'), 'wb') as f:
            f.write(download_file_decrypt)
    # 下载文档
    download_file = open(os.path.join(filepath, 'tempfile'), 'rb')
    
    response = FileResponse(download_file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment; filename=' + urlquote(filename)  # 设置下载名
    
    # 将下载记录插入到日志记录中
    logs = UserOperateLog()
    logs.nickname = request.session['adminuser']['nickname']
    logs.username = request.session['adminuser']['username']
    logs.department = request.session['adminuser']['department']
    logs.do_type = '下载'
    logs.fileno = file.fileno
    logs.filename = file.filename
    logs.save()

    return response

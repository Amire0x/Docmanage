from admin_manage.models import UserOperateLog
from django.shortcuts import render
from pure_pagination import Paginator
from django.db.models import Q
# 操作日志读取
def operate_log(request,pIndex=1):
    '''浏览信息'''
    fmod = UserOperateLog.objects
    flist = fmod.filter()
    mywhere=[]

    #获取并判断搜索条件
    kw = request.GET.get("keyword",None)
    if kw:
        flist = flist.filter(Q(filename__contains=kw) | Q(fileno__contains=kw)| Q(username__contains=kw)| Q(nickname__contains=kw))
        mywhere.append('keyword='+kw) # 用作条件维持，防止分页后条件丢失
    
    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(flist,5) #以每页5条数据分页
    maxpages = page.num_pages #获取最大页数
    #判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) #获取当前页数据
    plist = page.page_range #获取页码列表信息
    context = {"filelist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere}
    return render(request,'admin_manage/log/operate_log.html',context)
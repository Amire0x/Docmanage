from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse
from admin_manage.models import User
# Create your views here.
def index(request):
    return render(request,'admin_manage/index/index.html')

#管理员登录表单
def login(request):
    return render(request,'admin_manage/index/login.html')

#执行管理员登录
def dologin(request):
    try:
        #根据登录账号获取登录者信息
        user = User.objects.get(username=request.POST['username'])
        # 验证是否能登录
        if user.status == 2:
            print('当前账户被禁止登录')
            context = {"info":"当前账户被禁止登录!"}
            return render(request,"admin_manage/index/login.html",context)
        #判断登录密码是否相同
        import hashlib
        md5 = hashlib.md5()
        s = request.POST['pass']+user.password_salt #从表单中获取密码并添加干扰值
        md5.update(s.encode('utf-8')) #将要产生md5的子串放进去
        if user.password_hash == md5.hexdigest(): #获取md5值
            print('登录成功')
            #将当前登录成功的用户信息以adminuser为key写入到session中,用于登录验证
            request.session['adminuser'] = user.toDict()
            print(request.session['adminuser'])
            #重定向到后台管理首页
            return redirect(reverse("admin_manage_index"))
        else:
            context = {"info":"登录密码错误！"}
    except Exception as err:
        print(err)
        context = {"info":"登录账号不存在"}
    return render(request,"admin_manage/index/login.html",context)

#管理员退出
def logout(request):
    del request.session['adminuser']
    return redirect(reverse("admin_manage_login"))


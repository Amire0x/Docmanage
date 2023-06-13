# 自定义中间件类
from django.shortcuts import redirect
from django.urls import reverse
import re

class Middleware(object):
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.
        print("Middleware")

    def __call__(self, request): # 每一次请求都会执行
        
        path = request.path
        print("url:",path)
        #判断系统是否登录
        #定义后台不登录也可直接访问的url列表
        urllist = ['/admin_manage','/admin_manage/logout','/admin_manage/dologin']
        #判断当前请求url地址是否是以/admin_manage开头,并且不在urllist中，才做是否登录判断
        if re.match(r'^/admin_manage',path) and (path not in urllist):
            #判断是否登录(在于session中没有adminuser)
            if 'adminuser' not in request.session:
                #重定向到登录页
                return redirect(reverse("admin_manage_login"))
                #pass


        # 请求继续执行下去
        response = self.get_response(request)
        return response
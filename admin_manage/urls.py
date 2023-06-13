# 后台管理子路由
from django.contrib import admin
from django.urls import path
from admin_manage.views import index, user, operate_log

urlpatterns = [
    # 后台首页
    path('admin_manage/index', index.index,name="admin_manage_index"),
    
    #后台管理员登录、退出路由
    path('', index.login, name="admin_manage_login"), #加载登录表单
    path('dologin', index.dologin, name="admin_manage_dologin"), #执行登录
    path('logout', index.logout, name="admin_manage_logout"), #退出

    #员工账号信息管理
    path('user/<int:pIndex>', user.index, name="admin_manage_user_index"),#浏览信息
    path('user/add', user.add, name="admin_manage_user_add"),             #加载添加表单
    path('user/insert', user.insert, name="admin_manage_user_insert"),     #执行信息添加
    path('user/del/<int:uid>', user.delete, name="admin_manage_user_delete"),#删除信息
    path('user/edit/<int:uid>', user.edit, name="admin_manage_user_edit"),#准备信息编辑
    path('user/update/<int:uid>', user.update, name="admin_manage_user_update"),#执行信息编辑

    # 操作日志
    path('user/operarte_log/<int:pIndex>',operate_log.operate_log,name="operate_log")# 操作日志

]

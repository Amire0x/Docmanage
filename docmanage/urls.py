# 主路由配置
from django import urls
from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('file_manage/',include('file_manage.urls')), # 文件管理
    path('',include('admin_manage.urls')), # 用户管理
]

# 前台子路由
from tabnanny import check
from django.contrib import admin
from django.urls import path
from file_manage.views import blockchain, index

urlpatterns = [
    path('doc/<int:pIndex>', index.index,name="file_manage_index"),
    path("doc/upload",index.upload,name="upload"), #加载文件上传表单页
    path("doc/doupload",index.doupload,name="doupload"), #执行文件上传处理
    path('doc/download/<int:file_id>/', index.download, name='download'),# 文件下载
    path('doc/approve/<int:file_id>/', index.approve, name='approve'), # 文件审批
    path('doc/reject/<int:file_id>/', index.reject, name='reject'), # 文件驳回
    path('doc/approvelist/<int:pIndex>', index.approve_list, name='approvelist'), # 审批列表
    path('doc/approvelog/<int:pIndex>', index.approve_log, name='approvelog'), # 审批记录

    path('doc/blockchain_log/<int:pIndex>',blockchain.blockchain_log,name='blockchain_log'), # 区块日志
    path('doc/new_block',blockchain.new_block),
    path('doc/check',blockchain.check_chain)
]
 
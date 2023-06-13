from datetime import datetime
from django.db import models

# Create your models here.
# 文档model
class File(models.Model):
    fileno = models.CharField(max_length=18)# 文档编号
    filename = models.CharField(max_length=200)# 文档名称
    filepath = models.CharField(max_length=200)# 文档路径
    owner = models.CharField(max_length=30)# 文档所属用户
    add_time = models.DateTimeField(default=datetime.now)# 上传时间 # 0未审批/1已审批/2已驳回
    file_hash = models.CharField(max_length=200,default='NULL')# 文档哈希
    isapprove = models.CharField(max_length=1,default='0')# 0未审批/1已审批/2已驳回
    status = models.IntegerField(default=0)# 文件状态 0 正常/ 1 异常

    class Meta:
        db_table = 'file'
        

# 文档审批日志model
class ApproveLog(models.Model):
    fileno = models.CharField(max_length=18)# 文档编号
    filename = models.CharField(max_length=200)# 文档名称
    owner = models.CharField(max_length=30)# 文档所属用户
    add_time = models.DateTimeField()# 上传时间
    isapprove = models.CharField(max_length=1)# 0未审批/1已审批/2已驳回
    approve_time = models.DateTimeField(default=datetime.now)# 审批时间
    approve_person = models.CharField(max_length=50,default='NULL')# 审批用户
    class Meta:
        db_table = 'approve_log'

# 区块日志model        
class Blockchain_log(models.Model):
    index = models.IntegerField()# 块号
    timestamp = models.CharField(max_length=50)# 时间戳
    transaction = models.TextField(max_length=200)# 区块体json数据
    proof = models.IntegerField()# 工作量证明
    pre_hash = models.CharField(max_length=200)# 前区块hash
    class Meta:
        db_table = 'blockchain_log'

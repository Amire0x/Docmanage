from django.db import models
from datetime import datetime

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=50)    #员工账号
    nickname = models.CharField(max_length=50)    #昵称
    password_hash = models.CharField(max_length=100)#密码
    password_salt = models.CharField(max_length=50)    #密码干扰值
    department = models.IntegerField(default=1)    #部门:3管理部/1设计部/2审核部
    status = models.IntegerField(default=1)    #状态:1正常/2禁用/9删除
    create_at = models.DateTimeField(default=datetime.now)    #创建时间
    update_at = models.DateTimeField(default=datetime.now)    #修改时间

    def toDict(self):# 转为字典
        return {'id':self.id,'username':self.username,'nickname':self.nickname,'password_hash':self.password_hash,'password_salt':self.password_salt,'department':self.department,'status':self.status,'create_at':self.create_at.strftime('%Y-%m-%d %H:%M:%S'),'update_at':self.update_at.strftime('%Y-%m-%d %H:%M:%S')}

    class Meta:
        db_table = "user"  # 更改表名

# 定义用户操作日志模型
class UserOperateLog(models.Model):
    username = models.CharField(max_length=15) # 员工账号
    nickname = models.CharField(max_length=20) # 昵称
    do_type = models.CharField(max_length=20) # 操作类型
    department = models.IntegerField(default=1)#部门:3管理部/1设计部/2审核部
    fileno = models.CharField(max_length=18) # 文件编号
    filename = models.CharField(max_length=200) # 文件名
    modify_time = models.DateTimeField(default=datetime.now) # 修改时间

    class Meta:
        db_table = "Operate_log"

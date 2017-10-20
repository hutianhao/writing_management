# _*_ coding:UTF-8 _*_
from django.db import models

# Create your models here.

import sys
reload(sys)
sys.setdefaultencoding('utf8')

class Writing(models.Model):

    id = models.CharField(primary_key=True,max_length = 30,verbose_name = '用户id')
    username = models.CharField(max_length = 30,verbose_name = '作者' )
    createtime = models.DateField(verbose_name = '日期')
    imgpath = models.CharField(max_length = 30,verbose_name = '作品路径')
    review = models.CharField(max_length = 30,verbose_name = 'review')
    source = models.CharField(max_length = 30,verbose_name = '来源')
    album = models.CharField(max_length = 30,verbose_name = '相册')

    def __str__(self):
        return self.username

    class Meta:
        db_table = 'userworks'
        verbose_name = '作品管理'
        verbose_name_plural = '作品管理'
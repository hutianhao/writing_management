# _*_ coding:UTF-8 _*_
from django.contrib import admin

# Register your models here.
from writing import models


class WrintingAdmin(admin.ModelAdmin):
    list_display = ('id','username','createtime','review','imgpath','source','album')    #字段显示
    search_fields = ('id','username','source')                                           #搜索
    fields = ('id','username','imgpath','review','createtime','source','album')          #编辑时字段显示顺序
    list_filter = ('username','source')

admin.site.register(models.Writing,WrintingAdmin)
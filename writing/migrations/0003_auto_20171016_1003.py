# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime
import django.utils.datetime_safe


class Migration(migrations.Migration):

    dependencies = [
        ('writing', '0002_auto_20171015_1118'),
    ]

    operations = [
        migrations.RenameField(
            model_name='writing',
            old_name='time',
            new_name='createtime',
        ),
        migrations.RenameField(
            model_name='writing',
            old_name='author',
            new_name='username',
        ),
        migrations.RemoveField(
            model_name='writing',
            name='email',
        ),
        migrations.RemoveField(
            model_name='writing',
            name='name',
        ),
        migrations.RemoveField(
            model_name='writing',
            name='phone',
        ),
        migrations.AddField(
            model_name='writing',
            name='album',
            field=models.CharField(default=datetime.date(2017, 10, 16), max_length=30, verbose_name=b'\xe7\x9b\xb8\xe5\x86\x8c'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='writing',
            name='imgpath',
            field=models.CharField(default=datetime.date(2017, 10, 16), max_length=30, verbose_name=b'\xe4\xbd\x9c\xe5\x93\x81\xe8\xb7\xaf\xe5\xbe\x84'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='writing',
            name='review',
            field=models.CharField(default=django.utils.datetime_safe.date.today, max_length=30, verbose_name=b'review'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='writing',
            name='source',
            field=models.CharField(default=2, max_length=30, verbose_name=b'\xe6\x9d\xa5\xe6\xba\x90'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='writing',
            name='uid',
            field=models.CharField(default=datetime.date(2017, 10, 16), max_length=30, verbose_name=b'\xe7\x94\xa8\xe6\x88\xb7id'),
            preserve_default=False,
        ),
    ]

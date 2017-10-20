# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('writing', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='writing',
            options={'verbose_name': '\u4f5c\u54c1\u7ba1\u7406', 'verbose_name_plural': '\u4f5c\u54c1\u7ba1\u7406'},
        ),
        migrations.AddField(
            model_name='writing',
            name='phone',
            field=models.CharField(default=datetime.date(2017, 10, 15), max_length=11, verbose_name=b'\xe6\x89\x8b\xe6\x9c\xba\xe5\x8f\xb7'),
            preserve_default=False,
        ),
    ]

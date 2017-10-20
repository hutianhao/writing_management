# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('writing', '0003_auto_20171016_1003'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='writing',
            name='uid',
        ),
        migrations.AlterField(
            model_name='writing',
            name='id',
            field=models.CharField(max_length=30, serialize=False, verbose_name=b'\xe7\x94\xa8\xe6\x88\xb7id', primary_key=True),
        ),
    ]

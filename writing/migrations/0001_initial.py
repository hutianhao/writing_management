# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='writing',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30, verbose_name=b'\xe4\xbd\x9c\xe5\x93\x81\xe5\x90\x8d\xe7\xa7\xb0')),
                ('author', models.CharField(max_length=30, verbose_name=b'\xe4\xbd\x9c\xe8\x80\x85')),
                ('time', models.DateField(verbose_name=b'\xe6\x97\xa5\xe6\x9c\x9f')),
                ('email', models.EmailField(max_length=75, verbose_name=b'\xe9\x82\xae\xe7\xae\xb1')),
            ],
            options={
                'verbose_name': '\u4e66\u6cd5\u4f5c\u54c1',
                'verbose_name_plural': '\u4e66\u6cd5\u4f5c\u54c1',
            },
            bases=(models.Model,),
        ),
    ]

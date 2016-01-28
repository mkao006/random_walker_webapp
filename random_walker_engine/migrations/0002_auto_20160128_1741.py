# -*- coding: utf-8 -*-
# Generated by Django 1.9.1 on 2016-01-28 09:41
from __future__ import unicode_literals

import django.contrib.gis.db.models.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('random_walker_engine', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='location',
            name='destination_lat',
        ),
        migrations.RemoveField(
            model_name='location',
            name='destination_lng',
        ),
        migrations.RemoveField(
            model_name='location',
            name='origin_lat',
        ),
        migrations.RemoveField(
            model_name='location',
            name='origin_lng',
        ),
        migrations.AddField(
            model_name='location',
            name='destin',
            field=django.contrib.gis.db.models.fields.PointField(default=0, help_text=b'Represented as (longitude, latitude)', srid=4326),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='location',
            name='origin',
            field=django.contrib.gis.db.models.fields.PointField(default=0, help_text=b'Represented as (longitude, latitude)', srid=4326),
            preserve_default=False,
        ),
    ]

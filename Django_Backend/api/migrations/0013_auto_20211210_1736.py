# Generated by Django 3.2.9 on 2021-12-10 12:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0012_auto_20211130_1928'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='userimages/%Y/%n/%d/'),
        ),
        migrations.AddField(
            model_name='worker',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='workerimages/%Y/%n/%d/'),
        ),
    ]

# Generated by Django 5.0.2 on 2024-04-11 10:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0007_suggestions'),
    ]

    operations = [
        migrations.AddField(
            model_name='booking',
            name='token',
            field=models.IntegerField(default=1),
        ),
    ]

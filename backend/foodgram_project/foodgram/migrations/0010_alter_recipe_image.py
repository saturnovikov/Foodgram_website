# Generated by Django 3.2.16 on 2023-01-04 19:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('foodgram', '0009_alter_favorites_recipe'),
    ]

    operations = [
        migrations.AlterField(
            model_name='recipe',
            name='image',
            field=models.ImageField(blank=True, upload_to='foodgram/image', verbose_name='Фотография'),
        ),
    ]

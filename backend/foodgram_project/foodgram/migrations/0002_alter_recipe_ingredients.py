# Generated by Django 3.2.16 on 2023-01-09 19:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('foodgram', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='recipe',
            name='ingredients',
            field=models.ManyToManyField(through='foodgram.Amount', to='foodgram.Ingredient', verbose_name='Ингредиент'),
        ),
    ]

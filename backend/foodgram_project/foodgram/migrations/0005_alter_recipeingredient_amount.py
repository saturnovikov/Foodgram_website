# Generated by Django 3.2.16 on 2023-01-15 21:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('foodgram', '0004_auto_20230109_2328'),
    ]

    operations = [
        migrations.AlterField(
            model_name='recipeingredient',
            name='amount',
            field=models.PositiveSmallIntegerField(verbose_name='Количество'),
        ),
    ]
# Generated by Django 4.2.7 on 2023-11-30 11:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ageis_app', '0008_jobcategories'),
    ]

    operations = [
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
            ],
        ),
    ]

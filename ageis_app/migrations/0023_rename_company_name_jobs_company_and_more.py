# Generated by Django 4.2.7 on 2024-01-08 06:33

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("ageis_app", "0022_alter_clients_options"),
    ]

    operations = [
        migrations.RenameField(
            model_name="jobs",
            old_name="company_name",
            new_name="company",
        ),
        migrations.RemoveField(
            model_name="jobs",
            name="company_email",
        ),
        migrations.RemoveField(
            model_name="jobs",
            name="company_logo",
        ),
        migrations.AddField(
            model_name="clients",
            name="company_email",
            field=models.EmailField(blank=True, max_length=254, null=True),
        ),
    ]

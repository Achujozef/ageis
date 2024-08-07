# Generated by Django 4.2.7 on 2024-04-01 06:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("ageis_app", "0025_extendedusermodel_profile_photo"),
    ]

    operations = [
        migrations.CreateModel(
            name="ClientAcquisitionSource",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name="Invoice",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("amount", models.DecimalField(decimal_places=2, max_digits=10)),
                ("issue_date", models.DateField(auto_now_add=True)),
                (
                    "client",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="ageis_app.clients",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="JobPosting",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("title", models.CharField(max_length=100)),
                ("position", models.CharField(max_length=100)),
                ("description", models.TextField()),
                ("post_date", models.DateField(auto_now_add=True)),
                ("candidates_needed", models.PositiveIntegerField(default=1)),
                (
                    "client",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="ageis_app.clients",
                    ),
                ),
                (
                    "source",
                    models.ForeignKey(
                        null=True,
                        on_delete=django.db.models.deletion.SET_NULL,
                        to="ageis_app.clientacquisitionsource",
                    ),
                ),
            ],
        ),
        migrations.AlterModelTable(
            name="country",
            table="ageis_app_country",
        ),
        migrations.CreateModel(
            name="ShortlistedCandidate",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "candidate",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="ageis_app.extendedusermodel",
                    ),
                ),
                (
                    "job",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="ageis_app.jobposting",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Payment",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("amount_paid", models.DecimalField(decimal_places=2, max_digits=10)),
                ("payment_date", models.DateField(auto_now_add=True)),
                (
                    "invoice",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="ageis_app.invoice",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="OfferLetter",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("offer_date", models.DateField(auto_now_add=True)),
                (
                    "candidate",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="ageis_app.shortlistedcandidate",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="CandidateApplication",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("applied_date", models.DateField(auto_now_add=True)),
                (
                    "candidate",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="ageis_app.extendedusermodel",
                    ),
                ),
                (
                    "job",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="ageis_app.jobposting",
                    ),
                ),
            ],
        ),
    ]

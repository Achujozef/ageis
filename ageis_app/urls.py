from django.urls import path
from ageis_app import views

app_name = 'ageis_app'

urlpatterns = [
    path('', views.index, name='index'),
    path('login', views.login, name='login'),
    path('logout', views.logout, name='logout'),
    path('forgot-password', views.forgot_password,name='forgot_password'),
    path('reset-password/<str:uidb64>/<str:token>/', views.reset_password,name='reset_password'),
    
    path('admin-registration', views.admin_registration, name='admin_registration'),
    path('user-registration', views.user_registration, name='user_registration'),
    path('user-management', views.user_management, name='user_management'),
    
    path('dashboard', views.dashboard, name='dashboard'),
    path('testimonial', views.testimonial, name='testimonial'),
    path('testimonial-edit/<int:update_id>/', views.testimonial_edit, name='testimonial_edit'),
    path('testimonial-delete/<int:delete_id>/', views.testimonial_delete, name='testimonial_delete'),

    path('client', views.client, name='client'),
    path('client-edit/<int:client_id>/', views.client_edit, name='client_edit'),
    path('client-delete/<int:client_id>/', views.client_delete, name='client_delete'),

    path('job-categories', views.job_categories, name='job_categories'),
    path('job-categorie-delete/<int:delete_id>/', views.job_categorie_delete, name='job_categorie_delete'),
    path('job-categories-edit/<int:update_id>/', views.job_categories_edit, name='job_categories_edit'),

    path('job-types', views.job_types, name='job_types'),
    path('job-type-edit/<int:update_id>/', views.job_type_edit, name='job_type_edit'),
    path('job-type-delete/<int:delete_id>/', views.job_type_delete, name='job_type_delete'),


    path('about-us-backend', views.about_us_backend, name='about_us_backend'),
    path('aboutus-edit/<int:update_id>/', views.aboutus_edit, name='aboutus_edit'),
    path('aboutus_delete/<int:about_id>/', views.aboutus_delete, name='aboutus_delete'),


    


    path('place-management', views.place_management, name='place_management'),

    path('country-add', views.country_add, name='country_add'),
    path('country-update/<int:country_id>/', views.country_update, name='country_update'),
    path('country-delete/<int:country_id>/', views.country_delete, name='country_delete'),

    path('state-add', views.state_add, name='state_add'),
    path('state-update/<int:state_id>/', views.state_update,name='state_update'),
    path('state-delete/<int:state_id>/', views.state_delete, name='state_delete'),

    path('district-add', views.district_add, name='district_add'),
    path('district-delete/<int:district_id>/', views.district_delete, name='district_delete'),
    path('district-update/<int:district_id>/', views.district_update, name='district_update'),


    path('jobs', views.jobs, name='jobs'),
    path('ajax/load-states/', views.load_states, name='ajax_load_states'),
    path('ajax/load-districts/', views.load_district, name='ajax_load_districts'),
    path('jobs-edit/<int:update_id>/', views.jobs_edit, name='jobs_edit'),
    path('job-delete/<int:delete_id>/', views.job_delete, name='job_delete'),
    path('jobs-list', views.jobs_frontend, name='jobs_frontend'),
    path('jobs-details/<int:job_id>/', views.jobs_details, name='jobs_details'),
    path('jobs-list/<int:cat_id>/', views.jobs_frontend_cat, name='jobs_frontend_cat'),


    path('apply-job/<int:job_id>/', views.apply_job, name='apply_job'),
    path('applied-jobs', views.applied_jobs, name='applied_jobs'),
    path('applied-jobs-delete/<int:job_id>/', views.applied_jobs_delete, name='applied_jobs_delete'),


    path('blogs', views.blogs, name='blogs'),
    path('about-us', views.about_us, name='about_us'),
    path('clients', views.clients, name='clients'),
    
    path('resume-writing', views.resume_writing, name='resume_writing'),
    path('interviewtips', views.interviewtips, name='interviewtips'),
    path('contact-us', views.contact_us, name='contact_us'),

    path('job-search', views.job_search, name='job_search'),


    
    # path('disclaimer/', views.render_template, {'template_name': 'disclaimer.html'}, name='disclaimer'),
    # path('terms/', views.render_template, {'template_name': 'terms.html'}, name='terms'),
    # path('faq/', views.render_template, {'template_name': 'faq.html'}, name='faq'),
    # path('privacy/', views.render_template, {'template_name': 'privacy.html'}, name='privacy'),
    
    path('disclaimer/', views.render_disclaimer, name='disclaimer'),
    path('terms/', views.render_terms, name='terms'),
    path('faq/', views.render_faq, name='faq'),
    path('privacy/', views.render_privacy, name='privacy'),
    

    
    
    
    



    
    

    
    
    

    
    

    
    
    
    
    
    
]

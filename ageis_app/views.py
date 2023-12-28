from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.contrib.auth.models import User,auth
from django.contrib import messages
from ageis_app.models import *
from ageis_app.forms import *
from django.contrib.auth.decorators import login_required
from django.db.models import Q
# Create your views here.

def index(request):
    job_posted_count = Jobs.objects.all().count()
    applied_jobs_count = AppliedJobs.objects.all().count()
    company_count = Clients.objects.all().count()
    members_count = ExtendedUserModel.objects.all().count()
    companies = Clients.objects.all()
    jobs = Jobs.objects.all().order_by('job_post_date')[:4]
    job_category  = JobCategories.objects.all()
    testimonial = Testimonials.objects.all()
    development_count = Jobs.objects.filter(job_category__id = 10).count()
    accounting_finance_count = Jobs.objects.filter(job_category__id = 4).count()
    internship_count = Jobs.objects.filter(job_category__id = 5).count()
    automotive_count = Jobs.objects.filter(job_category__id = 6).count()
    marketing_count = Jobs.objects.filter(job_category__id = 9).count()
    human_resource_count = Jobs.objects.filter(job_category__id = 2).count()
    customer_service_count = Jobs.objects.filter(job_category__id = 7).count()
    project_management_count = Jobs.objects.filter(job_category__id = 8).count()
    design_count = Jobs.objects.filter(job_category__id = 11).count()



    context = {
        'companies' : companies,
        'jobs' : jobs,
        'job_posted_count' : job_posted_count,
        'applied_jobs_count' : applied_jobs_count,
        'company_count': company_count,
        'members_count': members_count,
        'testimonial':testimonial,
        'job_category':job_category,
        'development_count':development_count,
        'accounting_finance_count':accounting_finance_count,
        'internship_count':internship_count,
        'automotive_count':automotive_count,
        'marketing_count':marketing_count,
        'human_resource_count':human_resource_count,
        'customer_service_count':customer_service_count,
        'project_management_count':project_management_count,
        'design_count':design_count,
    }
    return render(request,'index.html',context)


def admin_registration(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        password2 = request.POST.get('password2')
        if password == password2:
            if User.objects.filter(username = username).exists():
                messages.error(request,'Username alredy exists')
                return redirect('ageis_app:admin_registration')
            elif User.objects.filter(email = email).exists():
                messages.error(request,'Email alredy exists')
                return redirect('ageis_app:admin_registration')
            else:
                User.objects.create_superuser(username=username,email=email,password=password)
                messages.success(request,'User created..')
                return redirect('ageis_app:login')
        else:
            messages.error(request,'Password Not Match')
            return redirect('ageis_app:admin_registration')
    return render(request,'admin-register.html')




def user_registration(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        cv = request.FILES.get('resume')
        # print('CV',cv)
        password = request.POST.get('password')
        password2 = request.POST.get('password2')
        if password == password2:
            if User.objects.filter(username = username).exists():
                messages.error(request,'Username alredy exists')
                return redirect('ageis_app:user_registration')
            elif User.objects.filter(email = email).exists():
                messages.error(request,'Email alredy exists')
                return redirect('ageis_app:user_registration')
            else:
                user = User.objects.create_user(username=username,first_name=first_name,last_name=last_name,email=email,password=password)
                extendeduser = ExtendedUserModel(user = user, phone = phone, cv = cv)
                extendeduser.save()
                messages.success(request,'User created..')
                return redirect('ageis_app:login')
        else:
            messages.error(request,'Password Not Match')
            return redirect('ageis_app:user_registration')
    return render(request,'user-register.html')



def login(request):
    if 'username' in  request.session:
        return redirect('ageis_app:index')
    if request.method == 'POST':
        username_or_email = request.POST.get('username_or_email')
        password = request.POST.get('password')
        user = auth.authenticate(request, username=username_or_email, password=password)
        if user is not None:
            auth.login(request, user)
            request.session['username'] = username_or_email
            if user.is_superuser:
                return redirect('ageis_app:dashboard')
            else:
                print('User')
                return redirect('ageis_app:index')
        else:
            messages.error(request, 'Invalid credential..')
            return redirect('ageis_app:login')
    return render(request, 'login.html')


def logout(request):
    if 'username' in request.session:
        request.session.flush();
        print(request.session)
    return redirect('ageis_app:index')



from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.urls import reverse
from django.core.mail import send_mail
from django.conf import settings

def forgot_password(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        if ExtendedUserModel.objects.filter(user__email=email).exists():
            user = ExtendedUserModel.objects.get(user__email=email)
            user = User.objects.get(email=email)
            token_generator = PasswordResetTokenGenerator()
            token = token_generator.make_token(user)
            uidb64 = urlsafe_base64_encode(force_bytes(user.pk))
            reset_link = request.build_absolute_uri(
                reverse('ageis_app:reset_password', kwargs={'uidb64': uidb64, 'token': token}))
            send_mail(
                'Password Reset Link',
                f'Please click on this link to reset your password: {reset_link}',
                settings.EMAIL_HOST_USER,
                [email],
                fail_silently=False,
            )
            messages.success(request, 'Password reset link has been sent to your email.')
        else:
            messages.error(request, 'Email does not exist.')
    return render(request,'forgot-password.html')



def reset_password(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user is not None and PasswordResetTokenGenerator().check_token(user, token):
        if request.method == 'POST':
            if request.POST.get('password') == request.POST.get('password2'):
                password = request.POST.get('password')
                print(password)
                user.set_password(password)
                user.save()
                messages.success(request, 'Password has been reset.')
                return redirect('ageis_app:login')
            else:
                messages.error(request,'Password not matching')
                print('password not matching')
                reset_password_url = reverse('ageis_app:reset_password', args=[uid, token])
                return redirect(reset_password_url)
        else:
            
            return render(request, 'reset-password.html')
    else:
        messages.error(request, 'Invalid reset link.')
        return redirect('ageis_app:login')






@login_required(login_url='ageis_app:login')
def dashboard(request):
    if request.user.is_superuser:
        testimonial_count = Testimonials.objects.all().count()
        client_count = Clients.objects.all().count()
        jobs_count = Jobs.objects.all().count()
        applied_jobs_count = AppliedJobs.objects.all().count()
        context = {
            'testimonial_count':testimonial_count,
            'client_count' :client_count,
            'jobs_count':jobs_count,
            'applied_jobs_count' :applied_jobs_count
        }
        return render(request,'dashboard.html',context)
    else:
        return HttpResponse('Access Denied..')


@login_required(login_url='ageis_app:login')
def testimonial(request):
    if request.method == 'POST':
        form = TestimonialAddForm(request.POST,request.FILES)
        if form.is_valid():
            data = form.save(commit=False)
            data.added_by = request.user
            data.save()
            messages.success(request,'Added..')
            return redirect('ageis_app:testimonial')
    else:
        form = TestimonialAddForm()
    
    testimonial = Testimonials.objects.all()
    context = {
        'form':form,
        'testimonial':testimonial
    }
    return render(request,'testimonal.html',context)

@login_required(login_url='ageis_app:login')
def testimonial_edit(request,update_id):
    update = Testimonials.objects.filter(id=update_id).first()
    if request.method == 'POST':
        form = TestimonialAddForm(request.POST,request.FILES,instance=update)
        if form.is_valid():
            form.save()
            messages.success(request,'Updated..')
            return redirect('ageis_app:testimonial')
    else:
        form = TestimonialAddForm(instance=update)

    context ={
        'form':form
    }
    return render(request,'testimonial-edit.html',context)


@login_required(login_url='ageis_app:login')
def testimonial_delete(request,delete_id):
    delete_id = Testimonials.objects.filter(id=delete_id)
    delete_id.delete()
    messages.success(request,'Deleted..')
    return redirect('ageis_app:testimonial')


@login_required(login_url='ageis_app:login')
def client(request):
    if request.method == 'POST':
        form = ClientAddForm(request.POST,request.FILES)
        if form.is_valid():
            # logo = form.cleaned_data['company_logo']
            data = form.save(commit=False)
            data.added_by = request.user
            # data.company_logo = logo
            data.save()
            messages.success(request,'Added..')
            return redirect('ageis_app:client')
    else:
        form = ClientAddForm()

    clients = Clients.objects.all()
    return render(request,'client.html',{'form':form,'clients':clients})



@login_required(login_url='ageis_app:login')
def client_edit(request,client_id):
    form = ClientAddForm()
    update = Clients.objects.filter(id=client_id).first()
    if request.method == 'POST':
        form = ClientAddForm(request.POST,request.FILES,instance=update)
        if form.is_valid():
            messages.success(request,'Updated..')
            form.save()
            return redirect('ageis_app:client')
    else:
        form = ClientAddForm(instance=update)
    context = {
        'form' : form
    }
    return render(request,'editclient.html',context)


@login_required(login_url='ageis_app:login')
def client_delete(request,client_id):
    clients = Clients.objects.get(id=client_id)
    clients.delete()
    messages.success(request,'Deleted..')
    return redirect('ageis_app:client')


@login_required(login_url='ageis_app:login')
def job_categories(request):
    if request.method == 'POST':
        form = JobCategoryAddForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,'Added..')
            return redirect('ageis_app:job_categories')
    else:
        form = JobCategoryAddForm()

    categories = JobCategories.objects.all()
    context = {
        'form':form,
        'categories':categories
    }
    return render(request,'jobcategories.html',context)



@login_required(login_url='ageis_app:login')
def job_categories_edit(request,update_id):
    update = JobCategories.objects.filter(id = update_id).first()
    if request.method == 'POST':
        form = JobCategoryAddForm(request.POST,instance=update)
        if form.is_valid():
            form.save()
            messages.success(request,'Updated..')
            return redirect('ageis_app:job_categories')
    else:
        form = JobCategoryAddForm(instance=update)
    context = {
        'form':form,
    }
    return render(request,'jobcategories-edit.html',context)



@login_required(login_url='ageis_app:login')
def job_categorie_delete(request,delete_id):
    categorie = JobCategories.objects.filter(id=delete_id).first()
    categorie.delete()
    messages.success(request,'Deleted..')
    return redirect('ageis_app:job_categories')


@login_required(login_url='ageis_app:login')
def job_types(request):
    if request.method == 'POST':
        form = JobTypeAddForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,'Added..')
            return redirect('ageis_app:job_types')
    else:
        form = JobTypeAddForm()

    jobtypes = JobType.objects.all()
    context = {
        'form':form,
        'jobtypes':jobtypes
    }
    return render(request,'jobtypes.html',context)


@login_required(login_url='ageis_app:login')
def job_type_edit(request,update_id):
    update = JobType.objects.filter(id = update_id).first()
    if request.method == 'POST':
        form = JobTypeAddForm(request.POST,instance=update)
        if form.is_valid():
            form.save()
            messages.success(request,'Updated..')
            return redirect('ageis_app:job_types')
    else:
        form = JobTypeAddForm(instance=update)
    context = {
        'form':form,
    }
    return render(request,'jobcategories-edit.html',context)




@login_required(login_url='ageis_app:login')
def job_type_delete(request,delete_id):
    categorie = JobType.objects.filter(id=delete_id).first()
    categorie.delete()
    messages.success(request,'Deleted..')
    return redirect('ageis_app:job_types')



@login_required(login_url='ageis_app:login')
def load_states(request):
    country_id = request.GET.get('country_id')
    states = State.objects.filter(country=country_id).all()
    return render(request, 'city_dropdown_list_options.html', {'states': states})


@login_required(login_url='ageis_app:login')
def load_district(request):
    country_id = request.GET.get('country_id')
    districts = district.objects.filter(state=country_id).all()
    return render(request, 'place_dropdown_list_options.html', {'districts': districts})







@login_required(login_url='ageis_app:login')
def jobs(request):
    try:
        if request.method == 'POST':
            form = JobsAddForm(request.POST,request.FILES)
            if form.is_valid():
                data = form.save(commit=False)
                data.added_by = request.user
                data.save()
            
                messages.success(request,'Added..')
                return redirect('ageis_app:jobs')
        else:
            form = JobsAddForm()
    except Exception as e:
        messages.error(request,str(e))
        return redirect('ageis_app:jobs')
    jobs = Jobs.objects.all()
    context = {
        'form':form,
        'jobs':jobs,
    }
    return render(request,'jobs.html',context)

@login_required(login_url='ageis_app:login')
def jobs_edit(request,update_id):
    update = Jobs.objects.filter(id=update_id).first()
    if request.method == 'POST':
        form = JobsAddForm(request.POST,request.FILES,instance=update)
        if form.is_valid():
            form.save()
            messages.success(request,'Updated..')
            return redirect('ageis_app:jobs')
    else:
        form = JobsAddForm(instance=update)
    context = {
        'form':form
    }
    return render(request,'jobs-edit.html',context)



@login_required(login_url='ageis_app:login')
def job_delete(request,delete_id):
    jobs = Jobs.objects.get(id = delete_id)
    jobs.delete()
    messages.success(request,'Deleted....')
    return redirect('ageis_app:jobs')



@login_required(login_url='ageis_app:login')
def place_management(request):
    country = Country.objects.all()
    state = State.objects.all()
    district_list = district.objects.all()
    return render(request,'place-management.html',{'country':country,'state':state,'state':state,'district_list':district_list})



@login_required(login_url='ageis_app:login')
def country_add(request):
    if request.method == 'POST':
        Country.objects.create(name=request.POST.get('country')).save()
        messages.success(request,'Succesfully Added')
    return redirect('ageis_app:place_management')




@login_required(login_url='ageis_app:login')
def country_update(request,country_id):
    updte = Country.objects.filter(id = country_id).first()
    if request.method == 'POST':
        updte.name = request.POST.get('name')
        updte.save()
        messages.success(request,'Updated..')
        return redirect('ageis_app:place_management')
    return render(request,'edit-country.html',{'updte':updte})


@login_required(login_url='ageis_app:login')
def country_delete(request,country_id):
    dlt = Country.objects.filter(id=country_id)
    dlt.delete()
    messages.success(request,'Deleted..')
    return redirect('ageis_app:place_management')


@login_required(login_url='ageis_app:login')
def state_add(request):
    if request.method == 'POST':
        country = request.POST.get('country')
        country = Country.objects.get(name= country)
        State.objects.create(country = country,name=request.POST.get('state')).save()
        messages.success(request,'Succesfully Added')
    return redirect('ageis_app:place_management')



@login_required(login_url='ageis_app:login')
def state_update(request,state_id):
    country = Country.objects.all()
    updte = State.objects.filter(id = state_id).first()
    if request.method == 'POST':
        country_name = request.POST.get('country')
        country = Country.objects.get(name=country_name)
        updte.name = request.POST.get('name')
        updte.country = country
        updte.save()
        messages.success(request,'Updated..')
        return redirect('ageis_app:place_management')
    return render(request,'edit-state.html',{'updte':updte,'country':country})




@login_required(login_url='ageis_app:login')
def state_delete(request,state_id):
    dlt = State.objects.filter(id=state_id)
    dlt.delete()
    messages.success(request,'Deleted..')
    return redirect('ageis_app:place_management')


@login_required(login_url='ageis_app:login')
def district_add(request):
    if request.method == 'POST':
        state_name = request.POST.get('state')
        state = State.objects.filter(name= state_name).first()
        district.objects.create(state = state,name=request.POST.get('district')).save()
        messages.success(request,'Succesfully Added')
    return redirect('ageis_app:place_management')



@login_required(login_url='ageis_app:login')
def district_update(request,district_id):
    state = State.objects.all()
    updte = district.objects.filter(id = district_id).first()
    if request.method == 'POST':
        state_name = request.POST.get('country')
        states = State.objects.filter(name=state_name).first()
        updte.name = request.POST.get('name')
        updte.state = states
        updte.save()
        messages.success(request,'Updated..')
        return redirect('ageis_app:place_management')
    return render(request,'edit-state.html',{'updte':updte,'country':state})   # here state edit and disrtict edits are used both same templates




@login_required(login_url='ageis_app:login')
def district_delete(request,district_id):
    dlt = district.objects.filter(id=district_id).first()
    dlt.delete()
    messages.success(request,'Deleted..')
    return redirect('ageis_app:place_management')

from django .core.paginator import Paginator, EmptyPage , PageNotAnInteger

def jobs_frontend(request):

    all_jobs = Jobs.objects.all()
    per_page = 8
    paginator = Paginator(all_jobs,per_page)
    page= request.GET.get('page')
    try:
        jobs = paginator.page(page)
    except PageNotAnInteger:
        jobs = paginator.page(1)
    except EmptyPage:
        jobs=paginator.page(Paginator.num_pages)
    context = {
        'jobs':jobs
    }
    return render(request,'jobsfrontend.html',context)


def jobs_frontend_cat(request, cat_id=None):
    if cat_id :
          jobs = Jobs.objects.filter(job_category__id = cat_id)
    else:
         jobs = Jobs.objects.all()
    context = {
        'jobs':jobs
    }
    return render(request,'jobsfrontend.html',context)

@login_required(login_url='ageis_app:login')
def jobs_details(request,job_id):
    details = Jobs.objects.get(id=job_id)
    return render(request,'job-details.html',{'details':details})


# product list page, product view page


@login_required(login_url='ageis_app:login')
def user_management(request):
    userlist = ExtendedUserModel.objects.all()
    return render(request,'user-management.html',{'userlist':userlist})


@login_required(login_url='ageis_app:login')
def apply_job(request,job_id):
    first_name = request.user.first_name
    last_name = request.user.last_name
    full_name = first_name+' '+last_name

    jobs = Jobs.objects.get(id=job_id)
    user = ExtendedUserModel.objects.get(user = request.user)
    AppliedJobs.objects.create(
        applied_user = user,
        applied_job = jobs

    ).save()
    Leads.objects.create(name = full_name,
                         title = jobs.job_title,
                         company = jobs.company_name.company_name,
                         description = jobs.job_des,
                         country = jobs.country.id,
                         city = jobs.district.name,
                         state = jobs.state.name,
                         address = jobs.company_name.address,
                         email = request.user.email,
                         website = jobs.website_link ,
                         phonenumber = request.user.extenedusermodel.phone,
                         ).save()
    messages.success(request,'Job Applied..')
    return redirect('ageis_app:jobs_frontend')


def applied_jobs(request):
    applied_jobs = AppliedJobs.objects.all()
    return render(request,'applied-jobs-lists.html',{'applied_jobs':applied_jobs})


def applied_jobs_delete(request,job_id):
    job = AppliedJobs.objects.get(id = job_id)
    job.delete()
    messages.success(request,'Deleted')
    return redirect('ageis_app:applied_jobs')



def blogs(request):
    testimonials = Testimonials.objects.all()
    return render(request,'blog.html',{'testimonials': testimonials})


def about_us(request):
    job_posted_count = Jobs.objects.all().count()
    applied_jobs_count = AppliedJobs.objects.all().count()
    company_count = Clients.objects.all().count()
    members_count = ExtendedUserModel.objects.all().count()
    about_us = AboutUs.objects.all()
    context = {
        'job_posted_count':job_posted_count,
        'applied_jobs_count':applied_jobs_count,
        'company_count':company_count,
        'members_count':members_count,
        'about_us':about_us,
    }
    return render(request,'about.html',context)


@login_required(login_url='ageis_app:login')
def about_us_backend(request):
    if request.method == 'POST':
        form = AboutUsAddForm(request.POST)
        if form.is_valid():
            print('FORM VALID')
            form.save()
            messages.success(request,'Added..')
            return redirect('ageis_app:about_us_backend')
    else:
        form = AboutUsAddForm()
    
    about_us = AboutUs.objects.all()
    context = {
        'form':form,
        'about_us':about_us
    }

    return render(request,'about-us-backend.html',context)




@login_required(login_url='ageis_app:login')
def aboutus_edit(request,update_id):
    update = AboutUs.objects.filter(id=update_id).first()
    if request.method == 'POST':
        form = AboutUsAddForm(request.POST,instance=update)
        if form.is_valid():
            form.save()
            messages.success(request,'Updated..')
            return redirect('ageis_app:about_us_backend')
    else:
        form = AboutUsAddForm(instance=update)

    context ={
        'form':form
    }
    return render(request,'about-us-edit.html',context)





def aboutus_delete(request,about_id):
    about = AboutUs.objects.get(id = about_id)
    about.delete()
    messages.success(request,'Deleted')
    return redirect('ageis_app:about_us_backend')





def clients(request):
    companies = Clients.objects.all()
    context = {
        'companies':companies
    }
    return render(request,'clients-frontend.html',context)




def resume_writing(request):
    return render(request,'resumewriting.html')


def interviewtips(request):
    return render(request,'interviewtips.html')


def contact_us(request):
    if request.method == 'POST':
        print(request.POST)
        name = request.POST.get('name')
        email = "support@ageisrecruitment.online"
        email1 = request.POST.get('email')
        number = request.POST.get('number')
        subject = request.POST.get('subject')
        message = request.POST.get('message')
        email_body = (
            f'Name: {name}\n'
            f'Email: {email1}\n'
            f'Phone: {number}\n'
            f'Subject: {subject}\n'
            f'Message: {message}'
        )
        send_mail(
            'Enquiry',
            email_body,
            settings.EMAIL_HOST_USER,
            [email],
            fail_silently=False,    
        )
        messages.success(request,'Form submited..')
        return redirect('ageis_app:contact_us')
    return render(request,'contact-us.html')

# def contact_us(request):
#     if request.method == 'POST':
#         print(request.POST)
#         form = ContactForm(request.POST)
#         form.save()
#         email = "achujoseph@a2zalphabetsolutionz.com"  # Use the correct sender email address

#         send_mail(
#             'Enquiry',
#             f'Name: {form.cleaned_data["name"]}\nEmail: {form.cleaned_data["email"]}\nMessage: {form.cleaned_data["message"]}',
#             (email),
#             [settings.EMAIL_HOST_USER],
#             fail_silently=False,    
#         )
#         print('Form submited..')
#         return render(request,'thank_you.html')
#     else:
#         form = ContactForm()
#     return render(request,'index.html', {'form': form})

def job_search(request):
    job_title = request.POST.get('title')
    place = request.POST.get('place')
    category = request.POST.get('category')
    # Start with an empty query
    query = Q()

    # Add conditions based on the provided parameters
    if job_title:
        query &= Q(job_title__icontains=job_title)

    if place:
        query &= (
            Q(country__name__icontains=place) |
            Q(district__name__icontains=place) |
            Q(state__name__icontains=place)
        )

    if category:
        query &= Q(job_category__name__icontains=category)

    # Perform the search using the constructed query
    results = Jobs.objects.filter(query)    
    context = {
        'jobs':results
    }
    return render(request,'jobsfrontend.html',context)


def render_template(request, template_name):
    return render(request, template_name)

def render_disclaimer(request):
    return render(request, 'disclaimer.html')

def render_terms(request):
    return render(request, 'terms.html')

def render_faq(request):
    return render(request, 'faq.html')

def render_privacy(request):
    return render(request, 'privacy.html')
from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class ExtendedUserModel(models.Model):
    def __str__(self):
        return self.user.username
    user = models.OneToOneField(User,on_delete=models.CASCADE,related_name='extenedusermodel',blank=True,null=True)
    phone = models.CharField(max_length=10,blank=True,null=True)
    cv = models.FileField(upload_to='CV',blank=True,null=True)
    #####################################
    location = models.CharField(max_length=255, blank=True, null=True)


class Skills(models.Model):
    user = models.ForeignKey(ExtendedUserModel, on_delete=models.CASCADE, related_name='skills')
    skill = models.CharField(max_length=255)

    def __str__(self):
        return f"{self.user.user.username} - {self.skill}"
    
class Qualification(models.Model):
    user = models.ForeignKey(ExtendedUserModel, on_delete=models.CASCADE, related_name='qualifications')
    degree = models.CharField(max_length=255)
    institution = models.CharField(max_length=255)
    completion_year = models.IntegerField()

    def __str__(self):
        return f"{self.user.user.username} - {self.degree}"
    

class Experience(models.Model):
    user = models.ForeignKey(ExtendedUserModel, on_delete=models.CASCADE, related_name='experiences')
    company = models.CharField(max_length=255)
    position = models.CharField(max_length=255)
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    description = models.TextField()

class Clients(models.Model):
    def __str__(self):
        return f"{self.added_by.username} - {self.company_name}"

    class Meta:
        verbose_name_plural = 'Clients/Company'

    added_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user', blank=True, null=True)
    company_logo = models.ImageField(upload_to='Logos', blank=True, null=True)
    company_name = models.CharField(max_length=50, blank=True, null=True)
    company_email = models.EmailField(blank=True, null=True)
    address = models.TextField(blank=True, null=True)



class Testimonials(models.Model):
    def __str__(self):
        return self.company_name.company_name
    class Meta:
        verbose_name_plural = 'Testimonial'

    added_by = models.ForeignKey(User,on_delete=models.CASCADE,blank=True,null=True)
    customer_name = models.CharField(max_length=25,blank=True,null=True)
    customer_img = models.ImageField(upload_to='customerimg',blank=True,null=True)
    company_name = models.ForeignKey(Clients,on_delete=models.CASCADE,blank=True,null=True)
    reviews = models.TextField(blank=True,null=True)


class JobCategories(models.Model):
    def __str__(self):
        return self.name
    class Meta:
        verbose_name_plural = 'Job categories'
    name = models.CharField(max_length = 30)



class Country(models.Model):
    def __str__(self):
        return self.name

    name = models.CharField(max_length=100,blank=True,null=True)

    
    
class State(models.Model):
    def __str__(self):
        return self.name

    country = models.ForeignKey(Country,on_delete=models.CASCADE,blank=True,null=True)
    name = models.CharField(max_length=100,blank=True,null=True)

 
class district(models.Model):
    def __str__(self):
        return self.name

    state = models.ForeignKey(State,on_delete=models.CASCADE,blank=True,null=True)
    name = models.CharField(max_length=100,blank=True,null=True)
    

class JobType(models.Model):
    def __str__(self):
        return self.name
    name = models.CharField(max_length=25)


class Jobs(models.Model):
    def __str__(self):
        return self.job_title
    added_by = models.ForeignKey(User,on_delete=models.CASCADE)
    job_post_date = models.DateField(auto_now_add=True)
    job_title = models.CharField(max_length=50)
    company = models.ForeignKey(Clients, on_delete=models.CASCADE)
    country = models.ForeignKey(Country,on_delete=models.CASCADE)
    state = models.ForeignKey(State,on_delete=models.CASCADE)
    district = models.ForeignKey(district,on_delete=models.CASCADE)
    job_category = models.ForeignKey(JobCategories,on_delete=models.CASCADE)
    job_type = models.ForeignKey(JobType,on_delete=models.CASCADE)
    end_date = models.DateField()
    job_des = models.TextField()
    skills = models.CharField(max_length=100)
    experience = models.IntegerField()
    salary = models.CharField(max_length=25)
    languages = models.CharField(max_length=100)
    website_link = models.URLField()

    

class AppliedJobs(models.Model):
    def __str__(self):
        return self.applied_user.user.first_name
    applied_user = models.ForeignKey(ExtendedUserModel,on_delete=models.CASCADE)
    applied_job = models.ForeignKey(Jobs,on_delete=models.CASCADE)
    applied_date = models.DateField(auto_now_add=True)



class AboutUs(models.Model):
    company = models.ForeignKey(Clients,on_delete=models.CASCADE)
    review = models.TextField()



# FOR CRM

class Leads(models.Model):
    class Meta:
        db_table = 'tblleads'

    hash = models.CharField(max_length=65, null=True)
    name = models.CharField(max_length=191)
    title = models.CharField(max_length=100, null=True)
    company = models.CharField(max_length=191, null=True)
    description = models.TextField(null=True)
    country = models.IntegerField(default=0)
    zip = models.CharField(max_length=15, null=True)
    city = models.CharField(max_length=100, null=True)
    state = models.CharField(max_length=50, null=True)
    address = models.CharField(max_length=100, null=True)
    assigned = models.IntegerField(default=0)
    dateadded = models.DateTimeField(auto_now_add=True)
    from_form_id = models.IntegerField(default=0)
    status = models.IntegerField(null=True)
    source = models.IntegerField(null=True)
    lastcontact = models.DateTimeField(null=True)
    dateassigned = models.DateField(null=True)
    last_status_change = models.DateTimeField(null=True)
    addedfrom = models.IntegerField(default=0)
    email = models.CharField(max_length=100, null=True)
    website = models.CharField(max_length=150, null=True)
    leadorder = models.IntegerField(default=1, null=True)
    phonenumber = models.CharField(max_length=50, null=True)
    date_converted = models.DateTimeField(null=True)
    lost = models.IntegerField(default=0)
    junk = models.IntegerField(default=0)
    last_lead_status = models.IntegerField(default=0)
    is_imported_from_email_integration = models.IntegerField(default=0)
    email_integration_uid = models.CharField(max_length=30, null=True)
    is_public = models.IntegerField(default=0)
    default_language = models.CharField(max_length=40, null=True)
    client_id = models.IntegerField(default=0)
    lead_value = models.DecimalField(max_digits=15, decimal_places=2, null=True)


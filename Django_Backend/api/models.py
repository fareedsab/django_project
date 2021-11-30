from django.db import models
from django.db.models.fields.reverse_related import ManyToOneRel
from django.dispatch import receiver
from django.urls import reverse
from django_rest_passwordreset.signals import reset_password_token_created
from django.core.mail import send_mail 
from django.core.validators import MaxValueValidator, MinValueValidator

# Create your models here.
class user(models.Model):
    username = models.TextField(unique=True)
    email = models.TextField(unique=True)
    fname = models.TextField()
    lname = models.TextField()
    address = models.TextField()
    password = models.TextField()
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    user_id = models.AutoField(auto_created=True,primary_key=True)

class worker(models.Model):
    username = models.TextField(unique=True)
    email = models.TextField(unique=True)
    fname = models.TextField()
    lname = models.TextField()
    password = models.TextField()
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    worker_id = models.AutoField(auto_created=True,primary_key=True)
    # feedback = models.ForeignKey(feedback)
    average_rates = models.FloatField()

class appointment(models.Model):
    username = models.TextField(unique=True)
    appointment_id = models.AutoField(auto_created=True,primary_key=True)
    start_date = models.DateTimeField(auto_now=True)
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    end_date = models.DateTimeField()
    
class payment(models.Model):
    total = models.FloatField() 
    method = models.TextField()
    payment_id = models.AutoField(auto_created=True,primary_key=True)
    
class service(models.Model):
    service_id = models.AutoField(primary_key=True,auto_created=True) 
    name = models.TextField()

class feedback(models.Model):
    feedback_id = models.AutoField(primary_key=True,auto_created=True) 
    rating = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(10.0)])
    comments = models.TextField()

    def __str__(self):
        return self.username[0:50]
    

    # class Meta:
    #     ordering = ['-updated']

@receiver(reset_password_token_created)
def password_reset_token_created(sender, instance, reset_password_token, *args, **kwargs):
    email_plaintext_message = "{}?token={}".format(reverse('password_reset:reset-password-request'), reset_password_token.key)

    send_mail(
        # title:
        "Password Reset for {title}".format(title="Some website title"),
        # message:
        email_plaintext_message,
        # from:
        "noreply@somehost.local",
        # to:
        [reset_password_token.user.email]
    )
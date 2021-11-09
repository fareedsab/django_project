from django.db import models

# Create your models here.
class Login(models.Model):
    username = models.TextField(unique=True)
    email = models.TextField(unique=True)
    name = models.TextField()
    password = models.TextField()
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    id = models.AutoField(auto_created=True,primary_key=True,verbose_name='ID')
    def __str__(self):
        return self.username[0:50]
    
    class Meta:
        ordering = ['-updated']
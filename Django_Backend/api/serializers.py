from django.db import models
from django.db.models import fields
from rest_framework.serializers import ModelSerializer
from .models import Login

class LoginSerializer(ModelSerializer):
    class Meta:
        model = Login
        fields = '__all__'
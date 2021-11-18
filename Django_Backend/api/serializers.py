from django.db import models
from django.db.models import fields
from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from .models import Login

class LoginSerializer(ModelSerializer):
    class Meta:
        model = Login
        fields = '__all__'

class ChangePasswordSerializer(serializers.Serializer):
    model = Login
    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)
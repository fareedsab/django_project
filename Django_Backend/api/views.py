from django.views import generic
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import ChangePasswordSerializer, userSerializer
from .models import user
from rest_framework import status
from rest_framework.permissions import IsAuthenticated,AllowAny,IsAuthenticatedOrReadOnly
from rest_framework.decorators import action
from django.shortcuts import render
from django.views.generic import View
from django.shortcuts import redirect
from django.contrib import messages
from django.core.mail import send_mail, send_mass_mail
@api_view(['GET'])
def getRoutes(request):
    routes=[
        {
            'Endpoint' : '/Django_Project/',
            'method' : 'GET',
            'username' : None,
            'password' : None,
            'ID' : None,
            'description' : 'Returns idk what but we will know soon'
        },
    ]
    return Response(routes)

@api_view(['GET'])
def getLogin(request):
    login = user.objects.all()
    serializer = userSerializer(login,many=True)
    return Response(serializer.data)

@api_view(['GET'])#GET FOR RETRIEVE 
def getSingleLogin(request,uname):
    login = user.objects.get(username=uname)
    serializer = userSerializer(login,many=False)
    return Response(serializer.data)

@api_view(['POST'])#POST FOR ADD
def createLogin(request):
    data = request.data
    tempU = str(data['username'])
    tempU = tempU.lower()
    tempE = str(data['email'])
    tempE = tempE.lower()
    login = user.objects.create(
        username = tempU,
        password = data['password'],
        email = tempE,
        name = data['name']
    )
    serializer = userSerializer(login,many = False)
    return Response(serializer.data)

@api_view(['PUT'])#PUT FOR UPDATE
def updateLogin(request,uname):
    data = request.data
    login = user.objects.get(username=uname)
    
    serializer = userSerializer(login,data=request.data)
    if serializer.is_valid():
        serializer.save()
    
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteLogin(request,uname):
    login = user.objects.get(username=uname)
    login.delete()
    return Response('Login was deleted')

class SendFormEmail(View):
    def  get(self, request):
        # Get the form data 
        name = request.GET.get('name', None)
        email = request.GET.get('email', None)
        message = request.GET.get('message', None)
        # Send Email
        send_mail(
            'Subject - Django Email Testing', 
            'Hello ' + name + ',\n' + message, 
            'wahajkhan788@gmail.com', # Admin
            [
                email,
            ]
        ) 
        # Redirect to same page after form submit
        messages.success(request, ('Email sent successfully.'))
        return redirect('home') 
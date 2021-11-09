from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import LoginSerializer
from .models import Login

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
    login = Login.objects.all()
    serializer = LoginSerializer(login,many=True)
    return Response(serializer.data)

@api_view(['GET'])#GET FOR RETRIEVE 
def getSingleLogin(request,uname):
    login = Login.objects.get(username=uname)
    serializer = LoginSerializer(login,many=False)
    return Response(serializer.data)

@api_view(['POST'])#POST FOR ADD/GET
def createLogin(request):
    data = request.data
    tempU = str(data['username'])
    tempU = tempU.lower()
    tempE = str(data['email'])
    tempE = tempE.lower()
    login = Login.objects.create(
        username = tempU,
        password = data['password'],
        email = tempE,
        name = data['name']
    )
    serializer = LoginSerializer(login,many = False)
    return Response(serializer.data)

@api_view(['PUT'])#PUT FOR UPDATE
def updateLogin(request,uname):
    data = request.data
    login = Login.objects.get(username=uname)
    
    serializer = LoginSerializer(login,data=request.data)
    if serializer.is_valid():
        serializer.save()
    
    return Response(serializer.data)

@api_view(['DELETE'])
def deleteLogin(request,uname):
    login = Login.objects.get(username=uname)
    login.delete()
    return Response('Login was deleted')
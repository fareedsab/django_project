from django.urls import path
from django.urls.resolvers import URLPattern
from . import views

urlpatterns = [
    path('',views.getRoutes),
    path('Login/',views.getLogin),
    path('Login/create/',views.createLogin),
    path('Login/<str:uname>/update/',views.updateLogin),
    path('Login/<str:uname>/delete/',views.deleteLogin),
    path(r'^Login/(?P<param1>[\w-]+)/(?P<param2>[\w-]+)/$',views.getSingleLogin),
    path('Login/<str:uname>',views.getSingleLogin),
]
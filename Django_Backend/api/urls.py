from django.urls import path
from django.urls.resolvers import URLPattern
from . import views

urlpatterns = [
    path('',views.getRoutes),
    path('login/',views.getLogin),
    path('login/create/',views.createLogin),
    path('login/<str:uname>/update/',views.updateLogin),
    path('login/<str:uname>/delete/',views.deleteLogin),
    path('login/<str:uname>',views.getSingleLogin),
]
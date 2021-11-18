from django.urls import path,include
from django.urls.resolvers import URLPattern
from django.views.generic import TemplateView
from . import views
urlpatterns = [
    path('',views.getRoutes),
    path('login/',views.getLogin),
    path('login/create/',views.createLogin),
    path('login/<str:uname>/update/',views.updateLogin),
    path('login/<str:uname>/delete/',views.deleteLogin),
    path('template', TemplateView.as_view(template_name="home.html"), name='home'),
    path('login/<str:uname>',views.getSingleLogin),
    path('login/password_reset/', include('django_rest_passwordreset.urls', namespace='password_reset')),
    path('sendEmail/',views.SendFormEmail.as_view)
]
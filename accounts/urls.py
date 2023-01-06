from django.urls import path
from . import views

urlpatterns = [
    path('', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path('forgot_password/', views.forgot_password, name='forgot_password'),
    path('new_password/', views.new_password, name='new_password'),
    path('reset_password/<uidb64>/<token>/', views.reset_password, name='reset_password'),

]
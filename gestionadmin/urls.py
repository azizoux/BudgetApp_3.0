from django.contrib import admin
from django.urls import path, include

from django.conf import settings
from django.conf.urls.static import static
from budgetapp.views import home

urlpatterns = [
    path('<int:module>/', home, name='home'),
] 

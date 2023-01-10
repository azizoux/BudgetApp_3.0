from django.urls import path
from . import views

urlpatterns = [
    path('download/', views.get, name='get_pdf'),
]
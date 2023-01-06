from django.urls import path
from . import views

urlpatterns = [
    path('create/<int:module>/', views.create, name='create_requisition'),
    path('show/<int:id>/', views.show, name='show_requisition'),
    path('edit/<int:id>/', views.edit, name='edit_requisition'),
    path('delete/<int:id>/', views.delete, name='delete_requisition'),
    path('send/<int:id>/', views.send, name='send_requisition'),
    path('validate/<int:id>/', views.validate, name='validate_requisition'),
    path('return_cfo/<int:id>/', views.return_cfo, name='return_cfo'),
    path('return_gm/<int:id>/', views.return_gm, name='return_gm'),
]
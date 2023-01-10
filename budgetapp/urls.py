from django.contrib import admin
from django.urls import path, include

from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
    path('', include('accounts.urls')),
    path('line/<int:id>/', views.line, name='line'),
    path('search/', views.search, name='search'),
    path('pdf/', include('budget.urls')),
    path('gestion/', include('gestionadmin.urls')),
    path('requisitions/', include('requisitions.urls')),
    path('admin/', admin.site.urls),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


from django.contrib import admin

from .models import Compte, Ligne


class CompteAdmin(admin.ModelAdmin):
    list_display = ('id', 'code', 'label', 'year', 'prevision', 'executed', 'updated_at')
    list_display_links = ('id', 'code', 'label')


class LigneAdmin(admin.ModelAdmin):
    list_display = ('id', 'code', 'label', 'prevision', 'executed', 'compte')
    list_display_links = ('id', 'code', 'label')
    search_fields = ('id', 'code', 'label',)
    list_filter = ('compte',)


admin.site.register(Compte, CompteAdmin)
admin.site.register(Ligne, LigneAdmin)

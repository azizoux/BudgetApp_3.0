from django.contrib import admin

from .models import Requisition


class RequisitionAdmin(admin.ModelAdmin):
    list_display = ('id', 'account', 'eng_number', 'type', 'label', 'purchase_order', 'amount', 'open_credit', 'available_amount', 'status')
    list_display_links = ('account', 'eng_number', 'label')
    list_filter = ('status',)


admin.site.register(Requisition, RequisitionAdmin)

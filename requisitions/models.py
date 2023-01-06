from django.db import models
from budget.models import Ligne
from datetime import datetime


class Requisition(models.Model):
    eng_number = models.IntegerField()
    type = models.CharField(max_length=100)
    account = models.ForeignKey(Ligne, on_delete=models.CASCADE)
    purchase_order = models.CharField(max_length=100)
    label = models.CharField(max_length=200)
    amount = models.IntegerField()
    supplier_name = models.CharField(max_length=255)
    anterior_engagement = models.DecimalField(max_digits=14, decimal_places=2, default=0, blank=True)
    total_engagement = models.DecimalField(max_digits=14, decimal_places=2, default=0, blank=True)
    total_expense = models.DecimalField(max_digits=14, decimal_places=2, default=0, blank=True)
    available_amount = models.DecimalField(max_digits=14, decimal_places=2, default=0, blank=True)
    open_credit = models.DecimalField(max_digits=14, decimal_places=2, default=0, blank=True)
    status = models.CharField(max_length=100)
    module = models.CharField(max_length=100, default=1)
    created_at = models.DateTimeField(default=datetime.now, blank=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.label

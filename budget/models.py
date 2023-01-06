from django.db import models


class Compte(models.Model):
    code = models.IntegerField(unique=True)
    label = models.CharField(max_length=100)
    year = models.IntegerField()
    module = models.IntegerField()
    prevision = models.DecimalField(max_digits=14, decimal_places=2)
    executed = models.DecimalField(max_digits=14, decimal_places=2 ,default=0, blank=True)
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.label


class Ligne(models.Model):
    compte = models.ForeignKey(Compte, on_delete=models.CASCADE)
    code = models.IntegerField(unique=True)
    label = models.CharField(max_length=100)
    prevision = models.DecimalField(max_digits=14, decimal_places=2)
    executed = models.DecimalField(max_digits=14, decimal_places=2 ,default=0, blank=True)
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.label




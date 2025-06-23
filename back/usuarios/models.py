# usuarios/models.py
# usuarios/models.py
from django.db import models
from django.contrib.auth.models import AbstractUser

class Conta(AbstractUser):  # Note o "C" maiúsculo
    telefone = models.CharField(max_length=30)
    
    class Meta:
        verbose_name = 'Conta'
        verbose_name_plural = 'Contas'
from django import forms
from .models import Inscritocomunidade
from django.utils import timezone

class InscritocomunidadeForm(forms.ModelForm):
    de_acordo = forms.BooleanField(label='Estou de acordo com a LGPD', required=True)

    class Meta:
        model = Inscritocomunidade
        exclude = ['dthinscricao', 'status']  # Serão preenchidos automaticamente

    def save(self, commit=True):
        instance = super().save(commit=False)
        instance.dthinscricao = timezone.now().date()
        instance.status = None
        if commit:
            instance.save()
        return instance
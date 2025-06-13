from django import forms
from .models import Inscritocomunidade, Endereco

class InscritocomunidadeForm(forms.ModelForm):
    de_acordo = forms.BooleanField(label='Estou de acordo com a LGPD', required=True)

    class Meta:
        model = Inscritocomunidade
        exclude = ['dthinscricao', 'status']  # Campos automáticos

    def save(self, commit=True):
        instance = super().save(commit=False)
        instance.status = True  # Define como ativo automaticamente
        if commit:
            instance.save()
        return instance


class EnderecoForm(forms.ModelForm):
    class Meta:
        model = Endereco
        exclude = ['idfichacomunidade']  # Preenchido manualmente na view
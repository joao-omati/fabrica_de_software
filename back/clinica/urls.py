from django.urls import path, include
from .views import homepage, InscricaoConvenio


urlpatterns = [
    path('', homepage, name='homepage'),
    path('inscricao-convenio/', InscricaoConvenio.as_view(), name='inscricao_convenio'),  # Alterado para usar a CBV
]
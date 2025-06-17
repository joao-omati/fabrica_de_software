from django.urls import path, include
from .views import homepage, InscricaoConvenio, InscricaoComunidade


urlpatterns = [
    path('', homepage, name='homepage'),
    path('inscricao-convenio/', InscricaoConvenio.as_view(), name='inscricao_convenio'),  # Alterado para usar a CBV
    path('inscricao-comunidade/', InscricaoComunidade.as_view(), name='inscricao_comunidade'),
]
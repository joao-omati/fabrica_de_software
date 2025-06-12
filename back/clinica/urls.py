from django.urls import path, include
from .views import homepage, inscricao_convenio


urlpatterns = [
    path('', homepage),
    path('inscricao-convenio/', inscricao_convenio, name='inscricao_convenio')
]
from django.views import View
from django.shortcuts import render, redirect
# Create your views here.

def homepage(request):
    return render(request, "index.html")

def inscricao_convenio(request):
    return render(request, "convenio_form.html")
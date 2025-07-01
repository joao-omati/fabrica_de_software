from django.contrib.auth.mixins import UserPassesTestMixin
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views import View
from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout
from django.urls import reverse_lazy
from .models import Conta  # Com "C" maiúsculo  # Importe seu modelo

@method_decorator(login_required(login_url='login'), name='dispatch')
class RegisterView(UserPassesTestMixin, View):
    template_name = 'register.html'
    form_class = UserCreationForm
    login_url = '/admin/login/'
    
    def test_func(self):
        return self.request.user.username == "admin"
    
    def handle_no_permission(self):
        if self.request.user.is_authenticated:
            raise PermissionDenied("Você não tem permissão para acessar esta página.")
        return super().handle_no_permission()
    
    def get(self, request):
        return render(request, self.template_name, {'user_form': self.form_class()})
    
    def post(self, request):
        form = self.form_class(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
        return render(request, self.template_name, {'user_form': form})

class LoginView(View):
    template_name = 'login.html'
    form_class = AuthenticationForm
    
    def get(self, request):
        if request.user.is_authenticated:
            return redirect('perfil_estagiario')
        return render(request, self.template_name, {'form': self.form_class()})
    
    def post(self, request):
        form = self.form_class(request, data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('perfil_estagiario')
        return render(request, self.template_name, {'form': form})

class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect('login')

class PerfilEstagiarioView(View):
    def get(self, request):
        if not request.user.is_authenticated:
            return redirect('login')
        return render(request, 'perfil_estagiario.html')

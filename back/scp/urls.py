from django.contrib import admin
from django.urls import path
from usuarios.views import RegisterView, LoginView, LogoutView, PerfilEstagiarioView
from clinica.views import cadastrar_inscrito_comunidade

urlpatterns = [
    path('admin/', admin.site.urls),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('perfil_estagiario/', PerfilEstagiarioView.as_view(), name='perfil_estagiario'),
    path('cadastro/comunidade/',cadastrar_inscrito_comunidade, name='cadastrar_inscrito_comunidade'),
]

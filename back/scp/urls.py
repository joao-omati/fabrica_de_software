from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from usuarios.views import RegisterView, LoginView, LogoutView, PerfilEstagiarioView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('clinica.urls')),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('perfil_estagiario/', PerfilEstagiarioView.as_view(), name='perfil_estagiario'),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
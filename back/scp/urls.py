from django.contrib import admin
from django.urls import path
from usuarios.views import RegisterView, LoginView, LogoutView  # Todas as views estão definidas agora

urlpatterns = [
    path('admin/', admin.site.urls),
    path('register/', RegisterView.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
]

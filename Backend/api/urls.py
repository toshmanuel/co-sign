from django.urls import path
from .views import LoginAPI, UserDetailAPI,RegisterUserAPIView
from knox import views as knox_views
urlpatterns = [
  path("api/v1/get-details",UserDetailAPI.as_view()),
  path('api/v1/register',RegisterUserAPIView.as_view()),
  path('api/v1/logout/', knox_views.LogoutView.as_view(), name='logout'),
  path('api/v1/logoutall/', knox_views.LogoutAllView.as_view(), name='logoutall'),
  path('api/v1/login/', LoginAPI.as_view(), name='login'),
]
from django.urls import path
from .views.auth_view import LoginAPI, UserDetailAPI,RegisterUserAPIView
from .views.transaction_view import CreateTransactionView
from knox import views as knox_views
from .views.address_view import GenerateAddress, GetAddressInfo, GetAddressByUser
urlpatterns = [
  path("api/v1/get-details",UserDetailAPI.as_view()),
  path('api/v1/register',RegisterUserAPIView.as_view()),
  path('api/v1/logout/', knox_views.LogoutView.as_view(), name='logout'),
  path('api/v1/logoutall/', knox_views.LogoutAllView.as_view(), name='logoutall'),
  path('api/v1/login/', LoginAPI.as_view(), name='login'),
  path('api/v1/transactions/', CreateTransactionView.as_view(), name='create_transaction'),
  path("api/v1/generateaddress",GenerateAddress.as_view()),
  path("api/v1/addressinfo/<address>",GetAddressInfo.as_view()),
  path("api/v1/addresslist/<userid>",GetAddressByUser.as_view()),

]
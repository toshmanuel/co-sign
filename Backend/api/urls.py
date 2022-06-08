from django.urls import path

from api.views.psb_transaction_view import SignPSBTransactionView
from .views.auth_view import LoginAPI, UserDetailAPI,RegisterUserAPIView
from .views.transaction_view import BroadcastTransactionView, CreateTransactionView, GetAllRecievedTransactionsView, GetAllTransactionsView, GetUnBroadcastTransactionsView, TransactionDetailsView
from knox import views as knox_views
from .views.address_view import GenerateAddress,GetAddressByUser, ExportAddress, GetAddressInfo, GetAllUTXOByAddress, GenerateNewAddress
urlpatterns = [
  path("api/v1/get-details",UserDetailAPI.as_view()),
  path('api/v1/register/',RegisterUserAPIView.as_view()),
  path('api/v1/logout/', knox_views.LogoutView.as_view(), name='logout'),
  path('api/v1/logoutall/', knox_views.LogoutAllView.as_view(), name='logoutall'),
  path('api/v1/login/', LoginAPI.as_view(), name='login'),
  path("api/v1/generateaddress/",GenerateAddress.as_view()),
  path("api/v1/getaddressinfo/<address>/",GetAddressInfo.as_view()),
  path("api/v1/generatenewaddress/",GenerateNewAddress.as_view()),
  path("api/v1/exportaddress/<address>",ExportAddress.as_view()),
  path("api/v1/addresslist/",GetAddressByUser.as_view()),
  path("api/v1/totalutxo/",GetAllUTXOByAddress.as_view()),
  path("api/v1/transactions/<transaction_id>/broadcast/", BroadcastTransactionView.as_view()),
  path('api/v1/transactions/', CreateTransactionView.as_view(), name='create_transaction'),
  path('api/v1/transactions/unbroadcast/', GetUnBroadcastTransactionsView.as_view()),
  path('api/v1/transactions/all/', GetAllTransactionsView.as_view()),
  path('api/v1/transactions/<transaction_id>/', TransactionDetailsView.as_view()),
  path('api/v1/psbt/', SignPSBTransactionView.as_view()),
  path('api/v1/received/transactions/', GetAllRecievedTransactionsView.as_view()),
]

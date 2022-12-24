from django.urls import include, path
from djoser.views import TokenCreateView, TokenDestroyView
from rest_framework.routers import DefaultRouter

from users.api.views import UsersView

router_v1 = DefaultRouter()

router_v1.register('', UsersView, basename='users')

token_urlpatterns = [
    path('login/', TokenCreateView.as_view(), name='login'),
    path('logout/', TokenDestroyView.as_view(), name='logout'),
]

urlpatterns = [
    path('token/', include(token_urlpatterns)),
    path('', include(router_v1.urls)),
]

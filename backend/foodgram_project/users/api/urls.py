from django.urls import include, path, re_path
from djoser.views import TokenCreateView, TokenDestroyView
from rest_framework.routers import DefaultRouter

from foodgram.api.views import SubscriptionViewSet
from users.api.views import UsersView

router_v1 = DefaultRouter()

router_v1.register('', UsersView, basename='users')

token_urlpatterns = [
    path('login/', TokenCreateView.as_view(), name='login'),
    path('logout/', TokenDestroyView.as_view(), name='logout'),
]

urlpatterns = [
    path('subscriptions/',
         SubscriptionViewSet.as_view({'get': 'list'}),
         name='get_subscriptions'),
    re_path(r'(?P<pk>\d+)/subscribe/',
            SubscriptionViewSet.as_view(
                {'post': 'create', 'delete': 'destroy'}),
            name='subscribe'),
    path('token/', include(token_urlpatterns)),
    path('', include(router_v1.urls)),
]

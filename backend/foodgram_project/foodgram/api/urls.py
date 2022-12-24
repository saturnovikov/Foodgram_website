from django.urls import include, path
from rest_framework.routers import DefaultRouter

from foodgram.api.views import IngredientViewSet, TagViewSet


router_v1 = DefaultRouter()

router_v1.register('tags', TagViewSet, basename='tags')
router_v1.register('ingredient', IngredientViewSet, basename='ingredient')

urlpatterns = [
    path('', include(router_v1.urls)),
    # path('auth/token/login/', TokenCreateView.as_view(), name='login'),
]
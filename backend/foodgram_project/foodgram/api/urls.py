from django.urls import include, path, re_path
from rest_framework.routers import DefaultRouter

from foodgram.api.views import (DownloadShoppingCartViewSet, FavoriteViewSet,
                                IngredientViewSet, RecipeViewSet,
                                ShoppingcartViewSet, TagViewSet)

router_v1 = DefaultRouter()

router_v1.register('tags', TagViewSet, basename='tags')
router_v1.register('ingredients', IngredientViewSet, basename='ingredient')
router_v1.register('recipes', RecipeViewSet, basename='recipes')


urlpatterns = [
    path('recipes/download_shopping_cart/',
         DownloadShoppingCartViewSet.as_view({'get': 'list'}),
         name='download_shopping_cart'),
    re_path(r'recipes\/(?P<pk>\d+)/favorite/', FavoriteViewSet.as_view(
        {'post': 'create', 'delete': 'destroy'}), name='favorite'),
    re_path(r'recipes\/(?P<pk>\d+)/shopping_cart', ShoppingcartViewSet.as_view(
        {'post': 'create', 'delete': 'destroy'}), name='shopping_cart'),
    path('', include(router_v1.urls)),
]

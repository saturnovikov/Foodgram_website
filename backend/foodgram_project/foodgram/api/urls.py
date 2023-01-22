from django.urls import include, path, re_path
from rest_framework.routers import DefaultRouter

from foodgram.api.views import (AmountViewSet, download_shopping_cart,
                                FavoriteViewSet, IngredientViewSet,
                                RecipeViewSet, ShoppingcartViewSet, TagViewSet)

router_v1 = DefaultRouter()

router_v1.register('tags', TagViewSet, basename='tags')
router_v1.register('ingredients', IngredientViewSet, basename='ingredient')
# router_v1.register('recipes/download_shopping_cart',
#                    DownloadShoppingCartViewSet,
#                    basename='download_shopping_cart')
# router_v1.register('recipes/download_shopping_cart', download_shopping_cart,
# basename='download_shopping_cart')
router_v1.register('recipes', RecipeViewSet, basename='recipes')
router_v1.register('amount', AmountViewSet, basename='amount')


urlpatterns = [
    path('', include(router_v1.urls)),
    path('recipes/download_shopping_cart/', download_shopping_cart,
         name='download_shopping_cart'),
    re_path(r'recipes\/(?P<pk>\d+)/shopping_cart', ShoppingcartViewSet.as_view(
        {'post': 'create', 'delete': 'destroy'}), name='shopping_cart'),
    re_path(r'recipes\/(?P<pk>\d+)/favorite', FavoriteViewSet.as_view(
        {'post': 'create', 'delete': 'destroy'}), name='favorite'),
]

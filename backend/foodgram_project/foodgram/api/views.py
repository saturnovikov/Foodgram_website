from django.db.models import Sum
from django.http import HttpResponse
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import status, viewsets
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from foodgram.api.filters import IngredientsFilter, RecipeFilter
from foodgram.api.paginations import RecipePagination
from foodgram.api.serializers import (CreateSubscriptionSerializers,
                                      FavoriteSerializers,
                                      IngredientSerializers, RecipeSerializers,
                                      ShoppingCartSerializers,
                                      SubscriptionSerializers, TagSerializers)
from foodgram.api.utils import create_utils, destroy_utils
from foodgram.api.viewsets import (CreateDestroyListRetriveViewSet,
                                   CreateDestroyViewSet)
from foodgram.models import (Favorite, Ingredient, Recipe, ShoppingCart,
                             Subscription, Tag, User)


class TagViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Tag.objects.all()
    serializer_class = TagSerializers
    pagination_class = None


class IngredientViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializers
    filter_backends = (DjangoFilterBackend,)
    filterset_class = IngredientsFilter
    search_fields = ['^name']
    pagination_class = None


class RecipeViewSet(viewsets.ModelViewSet):
    queryset = Recipe.objects.all()
    serializer_class = RecipeSerializers
    filter_backends = (DjangoFilterBackend,)
    filterset_class = RecipeFilter
    pagination_class = RecipePagination

    def perform_create(self, serializer):
        tags = self.request.data['tags']
        serializer.save(author=self.request.user, tags=tags)

    def perform_update(self, serializer):
        tags = self.request.data['tags']
        serializer.save(author=self.request.user, tags=tags)


class DownloadShoppingCartViewSet(viewsets.ReadOnlyModelViewSet):
    permission_classes = [IsAuthenticated]

    def list(self, request):
        foodstuffs = {}
        objs_shoppingcart = ShoppingCart.objects.prefetch_related(
            'recipe').filter(user=self.request.user)
        if not objs_shoppingcart.exists():
            return Response(data='Нет рецептов в списке покупок',
                            status=status.HTTP_400_BAD_REQUEST)
        id_ingredients = objs_shoppingcart.values_list('recipe__ingredients')
        id_recipes = objs_shoppingcart.values_list('recipe')
        ingredients = Ingredient.objects.filter(
            recipeingredient__ingredient__in=id_ingredients,
            recipeingredient__recipe__in=id_recipes).annotate(
                sum_amount=Sum('recipeingredient__amount'))
        for ingredient in ingredients:
            name = ingredient.name
            amount = ingredient.sum_amount
            foodstuffs[name] = amount
        contents = (f'{self.request.user}. \n'
                    'Список покупок для выбранных рецептов. \n'
                    '________________________________________\n')
        for key, value in foodstuffs.items():
            contents += (f'{key}: {value} \n')
        file_name = f'{self.request.user}_shopping_file'
        return HttpResponse(contents,
                            headers={'Content-Type': 'text/plain',
                                     'Content-Disposition': 'attachment;'
                                     'filename="{}.txt"'.format(file_name)})


class ShoppingcartViewSet(CreateDestroyViewSet):
    queryset = ShoppingCart.objects.all()
    serializer_class = ShoppingCartSerializers
    permission_classes = [IsAuthenticated]

    def destroy(self, request, *args, **kwargs):
        return destroy_utils(self=self,
                             model=ShoppingCart,
                             text_error='Нет рецепта в корзине')

    def create(self, request, *args, **kwargs):
        return create_utils(self=self,
                            model=ShoppingCart,
                            text_error='Данный рецепт уже добавлен в корзину',
                            kwargs=kwargs)


class FavoriteViewSet(CreateDestroyViewSet):
    queryset = Favorite.objects.all()
    serializer_class = FavoriteSerializers
    permission_classes = [IsAuthenticated]

    def destroy(self, request, *args, **kwargs):
        return destroy_utils(self=self,
                             model=Favorite,
                             text_error='Нет рецепта в избранном')

    def create(self, request, *args, **kwargs):
        return create_utils(self=self,
                            model=Favorite,
                            text_error=('Данный рецепт уже добавлен '
                                        'в избранное'),
                            kwargs=kwargs)


class SubscriptionViewSet(CreateDestroyListRetriveViewSet):
    permission_classes = [IsAuthenticated]

    def get_serializer_class(self):
        if self.action == 'list':
            return SubscriptionSerializers
        return CreateSubscriptionSerializers

    def get_queryset(self):
        print(self.request.user.following)
        print(Subscription.objects.filter(user=self.request.user))
        return Subscription.objects.filter(user=self.request.user)

    def destroy(self, request, *args, **kwargs):
        following_id = self.kwargs.get('pk')
        following = get_object_or_404(User, id=following_id)
        username = self.request.user
        user = get_object_or_404(User, username=username)
        if not Subscription.objects.filter(user=user,
                                           following=following).exists():
            return Response(data={'detail': 'Подписки на данного автора нет'},
                            status=status.HTTP_400_BAD_REQUEST)
        Subscription.objects.get(user=username, following=following).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    def create(self, request, *args, **kwargs):
        following_id = kwargs.get('pk')
        username = self.request.user
        following = get_object_or_404(User, id=following_id)
        user = get_object_or_404(User, username=username)
        if Subscription.objects.filter(user=user,
                                       following=following).exists():
            return Response(data={'errors': 'Подписка уже существует'},
                            status=status.HTTP_400_BAD_REQUEST)
        if username == following:
            return Response(data={'errors':
                                  'Нельзя подписаться на самого себя'},
                            status=status.HTTP_400_BAD_REQUEST)
        serializer = self.get_serializer(
            data={'email': following.email, 'id': following.id,
                  'username': following.username,
                  'first_name': following.first_name,
                  'last_name': following.last_name}
        )
        serializer.is_valid(raise_exception=True)
        headers = self.get_success_headers(serializer.data)
        Subscription.objects.create(user=user, following=following)
        return Response(serializer.data, status=status.HTTP_201_CREATED,
                        headers=headers)

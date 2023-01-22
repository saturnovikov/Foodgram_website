# from django.shortcuts import render
from django.http import HttpResponse
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import mixins, status, viewsets
from rest_framework.decorators import api_view
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from foodgram.api.filters import IngredientsFilter, RecipeFilter
from foodgram.api.serializers import (CreateSubscriptionSerializers,
                                      FavoriteSerializers,
                                      IngredientSerializers,
                                      RecipeIngredientSerializers,
                                      RecipeListSerializers,
                                      ShoppingCartSerializers,
                                      SubscriptionSerializers, TagSerializers)
from foodgram.models import (Favorites, Ingredient, Recipe, RecipeIngredient,
                             ShoppingCart, Subscription, Tag, User)


class CreateDestroyViewSet(mixins.CreateModelMixin,
                           mixins.DestroyModelMixin,
                           viewsets.GenericViewSet):
    pass


class CreateDestroyListRetriveViewSet(mixins.CreateModelMixin,
                                      mixins.RetrieveModelMixin,
                                      mixins.DestroyModelMixin,
                                      mixins.ListModelMixin,
                                      viewsets.GenericViewSet):
    pass


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
    serializer_class = RecipeListSerializers
    filter_backends = (DjangoFilterBackend,)
    filterset_class = RecipeFilter

    def perform_create(self, serializer):
        tags = self.request.data['tags']
        serializer.save(author=self.request.user, tags=tags)

    def perform_update(self, serializer):
        tags = self.request.data['tags']
        serializer.save(author=self.request.user, tags=tags)


# class DownloadShoppingCartViewSet(viewsets.ReadOnlyModelViewSet):
#     queryset = ShoppingCart.objects.all()
#     serializer_class = ShoppingCartSerializers
#     permission_classes = [IsAuthenticated]

#     def list(self, request):
#         shopping_list = {}
#         obj = ShoppingCart.objects.prefetch_related(
#             'recipe').filter(user=self.request.user)
#         if not obj.exists():
#             return Response(data='Нет рецептов в списке покупок',
#                             status=status.HTTP_400_BAD_REQUEST)
#         for shoppingcart in obj:
#             ingr = RecipeIngredient.objects.select_related(
#                 'ingredient').filter(recipe=shoppingcart.recipe)
#             for recipeingr in ingr:
#                 name = recipeingr.ingredient.name
#                 amount = recipeingr.amount
#                 if recipeingr.ingredient.name not in shopping_list:
#                     shopping_list[name] = amount
#                 else:
#                     shopping_list[name] = shopping_list[name] + (amount)
#         shopping_file = open('media/shopping_file.txt', 'w+')
#         shopping_file.write((f'{self.request.user}. \n'
#                              'Список покупок для выбранных рецептов. \n'
#                              '________________________________________\n'))
#         for key, value in shopping_list.items():
#             shopping_file.write((f'{key}: {value} \n'))
#         shopping_file.close()
#         shopping_file = open('media/shopping_file.txt', 'r')
#         file_contents = shopping_file.read()
#         file_name = 'shopping_file'
#         return HttpResponse(file_contents,
#                             headers={'Content-Type': 'text/plain',
#                                      'Content-Disposition': 'attachment;'
#                                      'filename="{}.txt"'.format(file_name)})


@api_view(['GET'])
def download_shopping_cart(request):
    shopping_list = {}
    obj_shoppingcart = ShoppingCart.objects.prefetch_related(
        'recipe').filter(user=request.user)
    # print(obj_shoppingcart[0].__dict__)
    if not obj_shoppingcart.exists():
        return Response(data='Нет рецептов в списке покупок',
                        status=status.HTTP_400_BAD_REQUEST)
    for shoppingcart in obj_shoppingcart:
        ingredients = RecipeIngredient.objects.select_related(
            'ingredient').filter(recipe=shoppingcart.recipe)
        print('INGR', ingredients)
        for ingredientinrecipe in ingredients:
            name = ingredientinrecipe.ingredient.name
            amount = ingredientinrecipe.amount
            if ingredientinrecipe.ingredient.name not in shopping_list:
                shopping_list[name] = amount
            else:
                shopping_list[name] = shopping_list[name] + (amount)
    shopping_file = open('media/shopping_file.txt', 'w+')
    shopping_file.write((f'{request.user}. \n'
                         'Список покупок для выбранных рецептов. \n'
                         '________________________________________\n'))
    for key, value in shopping_list.items():
        shopping_file.write((f'{key}: {value} \n'))
    shopping_file.close()
    shopping_file = open('media/shopping_file.txt', 'r')
    file_contents = shopping_file.read()
    file_name = 'shopping_file'
    return HttpResponse(file_contents,
                        headers={'Content-Type': 'text/plain',
                                 'Content-Disposition': 'attachment;'
                                 'filename="{}.txt"'.format(file_name)})


class AmountViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = RecipeIngredient.objects.all()
    serializer_class = RecipeIngredientSerializers


class ShoppingcartViewSet(CreateDestroyViewSet):
    queryset = ShoppingCart.objects.all()
    serializer_class = ShoppingCartSerializers

    def destroy(self, request, *args, **kwargs):
        recipe_id = self.kwargs.get('pk')
        recipe = get_object_or_404(Recipe, id=recipe_id)
        username = self.request.user
        if not ShoppingCart.objects.filter(user=username,
                                           recipe=recipe).exists():
            return Response(data={'detail': 'Нет рецепта в корзине'},
                            status=status.HTTP_400_BAD_REQUEST)
        ShoppingCart.objects.get(user=username, recipe=recipe).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    def create(self, request, *args, **kwargs):
        recipe_id = kwargs.get('pk')
        username = self.request.user
        recipe = get_object_or_404(Recipe, id=recipe_id)
        if ShoppingCart.objects.filter(user=username, recipe=recipe).exists():
            return Response(
                data={'detail': 'Данный рецепт уже добавлен в корзину'},
                status=status.HTTP_400_BAD_REQUEST
            )
        serializer = ShoppingCartSerializers(
            data={'id': recipe.id, 'name': recipe.name,
                  'cooking_time': recipe.cooking_time, 'image': recipe.image}
        )
        serializer.is_valid(raise_exception=True)
        headers = self.get_success_headers(serializer.data)
        ShoppingCart.objects.create(user=username, recipe=recipe)
        return Response(serializer.data, status=status.HTTP_201_CREATED,
                        headers=headers)


class FavoriteViewSet(CreateDestroyViewSet):
    queryset = Favorites.objects.all()
    serializer_class = FavoriteSerializers

    def destroy(self, request, *args, **kwargs):
        recipe_id = self.kwargs.get('pk')
        recipe = get_object_or_404(Recipe, id=recipe_id)
        username = self.request.user
        if not Favorites.objects.filter(user=username,
                                        recipe=recipe).exists():
            return Response(data={'errors': 'Нет рецепта в избранном'},
                            status=status.HTTP_400_BAD_REQUEST)
        Favorites.objects.get(user=username, recipe=recipe).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    def create(self, request, *args, **kwargs):
        recipe_id = kwargs.get('pk')
        username = self.request.user
        recipe = get_object_or_404(Recipe, id=recipe_id)
        if Favorites.objects.filter(user=username, recipe=recipe).exists():
            return Response(data={
                'errors': 'Данный рецепт уже добавлен в избранное'
            },
                status=status.HTTP_400_BAD_REQUEST)
        serializer = FavoriteSerializers(
            data={'id': recipe.id, 'name': recipe.name,
                  'cooking_time': recipe.cooking_time,
                  'image': recipe.image}
        )
        serializer.is_valid(raise_exception=True)
        headers = self.get_success_headers(serializer.data)
        Favorites.objects.create(user=username, recipe=recipe)
        return Response(serializer.data, status=status.HTTP_201_CREATED,
                        headers=headers)


class SubscriptionViewSet(CreateDestroyListRetriveViewSet):
    serializer_class = SubscriptionSerializers
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
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

        serializer = CreateSubscriptionSerializers(
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

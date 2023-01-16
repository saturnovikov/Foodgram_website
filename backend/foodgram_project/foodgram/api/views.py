# from django.shortcuts import render
from django.core.files.base import ContentFile
from django.http import HttpResponse
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters, mixins, status, viewsets
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from foodgram.api.filters import RecipeFilter
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
    filter_backends = (filters.SearchFilter,)
    search_fields = ('^name',)
    pagination_class = None


class RecipeViewSet(viewsets.ModelViewSet):
    queryset = Recipe.objects.all()
    serializer_class = RecipeListSerializers
    filter_backends = (DjangoFilterBackend,)
    filterset_class = RecipeFilter

    # def create(self, request, *args, **kwargs):
    #     print(request.data['tags'])
    #     print(request.data['ingredients'])
    #     # list_id=[]
    #     # for i in request.data['ingredients']:
    #     #     list_id.append(i['id'])
    #     # print(list_id)
    #     # ingredients = Ingredient.objects.filter(id__in=list_id)
    #     tags = Tag.objects.filter(id__in=request.data['tags'])
    #     request.data['tags'] = list(tags.values())
    #     # request.data['ingredients'] = list(ingredients.values())
    #     print(125, request.data)
    #     serializer = self.get_serializer(data=request.data)
    #     print('serializ')
    #     serializer.is_valid(raise_exception=True)
    #     print('is_valid')
    #     self.perform_create(serializer)
    #     headers = self.get_success_headers(serializer.data)
    #     return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    # def get_serializer_class(self):
    #     if request.method =
    #     return super().get_serializer_class()

    # print(request.data['tags'])
    # print(*args)
    # print(**kwargs)
    # return None
    # def create(self, request, *args, **kwargs):
    #     print('REQUEST', request.data)
    #     data=request.data
    #     tags = Tag.objects.filter(id__in=request.data['tags'])
    #     print('TAGGGGS', tags)
    #     # print(data)
    #     serializer = self.get_serializer(data=data)
    #     print('serializ')
    #     serializer.is_valid(raise_exception=True)
    #     print('is_valid')
    #     self.perform_create(serializer)
    #     headers = self.get_success_headers(serializer.data)
    #     return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    # # ДО НОВОЙ БАЗЫ
    # def create(self, request, *args, **kwargs):
    #     user = self.request.user
    #     # print('TYPE', username)
    #     print('self.request', self.request.__dict__)
    #     print('REQUEST', request.data)
    #     print('125', request.data['ingredients'])
    #     data_ingredients = request.data['ingredients']
    #     print('INGR', data_ingredients)
    #     for i in data_ingredients:
    #         # print('PRINT', ingredient=Ingredient.objects.get(id=1))
    #         print('iii', i['id'])
    #         ingredient = Ingredient.objects.get(id=i['id'])
    #         print('JJJJJJJ++++++++', ingredient)
    #         # IngredientAmount.objects.create(ingredient=ingredient, amount='125')
    #         # IngredientAmount.objects.create(ingredient=ingredient, amount=i['amount'])
    #     ingredients_amount = RecipeIngredient.objects.all().reverse()[
    #         :len(data_ingredients)]
    #     # ingredients = Ingredient.objects.filter(
    #     #     ingredientamount__ingredient=1123)
    #     # ingredients=IngredientAmount.objects.all().latest()
    #     print('values', list(ingredients_amount.values()))
    #     print('INGGGGG', ingredients_amount)
    #     print(request.data['tags'])
    #     # tags = Tag.objects.filter(id__in=request.data['tags'])
    #     tags = Tag.objects.filter(id__in=request.data['tags'])
    #     print('TAGGGGS', tags)
    #     data = request.data
    #     # user = get_object_or_404(User, username=self.request.user)
    #     # data['author']=user.__dict__
    #     user_c = {'email': user.email,
    #               'id': user.id,
    #               'username': user.username,
    #               "first_name": user.first_name,
    #               "last_name": user.last_name

    #               }
    #     print(user_c)
    #     data.update({'ingredients': list(ingredients_amount.values())})
    #     data.update({'tags': list(tags.values())})
    #     data.update({'author': user_c})
    #     # user = get_object_or_404(User, username=username)
    #     # print('user', user)
    #     # data.update({'author':list(user.values())})

    #     # print(data)
    #     serializer = self.get_serializer(data=data)
    #     print('serializ')
    #     serializer.is_valid(raise_exception=True)
    #     print('is_valid')
    #     self.perform_create(serializer)
    #     headers = self.get_success_headers(serializer.data)
    #     return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    # data={'125':1, '126':3}
    # data.update({'125':125})
    # data['126']=555
    # print(data)
    # print(Recipe.objects.filter(ingredients__amount=5).count())
    #     following_id = kwargs.get('pk')
    #     print(following_id)
    #     username = self.request.user
    #     print(username)
    #     following = get_object_or_404(User, id=following_id)
    #     # following = User.objects.filter(id=following_id)
    #     print('id= ', following.id)
    #     user = get_object_or_404(User, username=username)
    #     print(33, user)
    #     if Subscription.objects.filter(user=user, following=following).exists():
    #         return Response(data={'errors': 'Подписка уже существует'},
    #                         status=status.HTTP_400_BAD_REQUEST)
    #     if username == following:
    #         return Response(data={'errors': 'Нельзя подписаться на самого себя'},
    #                         status=status.HTTP_400_BAD_REQUEST)

    #     # serializer = SubscriptionSerializers(
    #     serializer = CreateSubscriptionSerializers(
    #         data={'email': following.email, 'id': following.id,
    #               'username': following.username, 'first_name': following.first_name,
    #               'last_name': following.last_name}
    #         # {'email':following.email, 'id': following.id, 'username': following,
    #         #       'cooking_time': recipe.cooking_time,
    #         #       'image': recipe.image}
    #     )
    #     print('data==', serializer)
    #     serializer.is_valid(raise_exception=True)
    #     print('=========')
    #     # self.perform_create(serializer)
    #     print('data2==', serializer.data)
    #     headers = self.get_success_headers(serializer.data)
    #     Subscription.objects.create(user=user, following=following)
    # return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    # return Response(None)

    def perform_create(self, serializer):
        print('SELFFFF', self.request.data['tags'])
        tags = self.request.data['tags']
        serializer.save(author=self.request.user, tags=tags)

    def perform_update(self, serializer):
        print('SELFFFF UPDATE', self.request.data['tags'])
        tags = self.request.data['tags']
        serializer.save(author=self.request.user, tags=tags)


class DownloadShoppingCartViewSet(viewsets.ReadOnlyModelViewSet):
    """Д"""
    queryset = ShoppingCart.objects.all()
    serializer_class = ShoppingCartSerializers
    permission_classes = [IsAuthenticated]
    # @action(detail=False, url_patch=)

    def list(self, request):
        shopping_list = {}
        print('OOOOOPPPPP', type(self.request.user))
        obj = ShoppingCart.objects.prefetch_related(
            'recipe').filter(user=self.request.user)
        if not obj.exists():
            return Response(data='Нет рецептов в списке покупок',
                            status=status.HTTP_400_BAD_REQUEST)
        # obj_2 = ShoppingCart.objects.filter(user=self.request.user)
        print('OBJ', obj)
        print(obj[0].recipe)
        for shoppingcart in obj:
            ingr = RecipeIngredient.objects.select_related(
                'ingredient').filter(recipe=shoppingcart.recipe)
            for recipeingr in ingr:
                name = recipeingr.ingredient.name
                amount = recipeingr.amount
                if recipeingr.ingredient.name not in shopping_list:
                    shopping_list[name] = amount
                else:
                    shopping_list[name] = shopping_list[name] + (amount)
                print('name= ', name,
                      'amount=', amount)
        print(shopping_list)
        # my_data = 'data'
        shopping_file = open('media/shopping_file.txt', 'w+')
        shopping_file.write((f'{self.request.user}. \n'
                             'Список покупок для выбранных рецептов. \n'
                             '________________________________________\n'))
        for key, value in shopping_list.items():

            shopping_file.write((f'{key}: {value} \n'))
        # my_file.close()

        shopping_file.close()

        shopping_file = open('media/shopping_file.txt', 'r')
        file_contents = shopping_file.read()
        print(123, file_contents)
        # print(str(shopping_list.items()))

        return HttpResponse(file_contents, headers={'Content-Type': 'application/pdf',
                                                    'Content-Disposition': 'attachment; filename="{}.pdf"'.format('shopping_file')})


#         response = HttpResponse(my_data, headers={
# ...     'Content-Type': 'application/vnd.ms-excel',
# ...     'Content-Disposition': 'attachment; filename="foo.xls"',
# ... })
        # ingr = RecipeIngredient.objects.select_related(
        #     'ingredient').filter(recipe=obj[0].recipe)
        # ingr = RecipeIngredient.objects.filter(recipe=obj[0].recipe)
        # print('name= ', ingr[0].ingredient.name,
        #       'amount=', ingr[0].amount)
        # print('OBJ_22222222', obj_2)
        # print(obj_2[0].recipe)


class AmountViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = RecipeIngredient.objects.all()
    serializer_class = RecipeIngredientSerializers


class ShoppingcartViewSet(CreateDestroyViewSet):
    queryset = ShoppingCart.objects.all()
    serializer_class = ShoppingCartSerializers

    def destroy(self, request, *args, **kwargs):
        # print(self.kwargs.get('pk'))
        recipe_id = self.kwargs.get('pk')
        # recipe = Recipe.objects.get(id=id)
        recipe = get_object_or_404(Recipe, id=recipe_id)
        # print(self.request.user)
        username = self.request.user
        # self.perform_destroy(instance)
        if not ShoppingCart.objects.filter(user=username,
                                           recipe=recipe).exists():
            return Response(data={'detail': 'Нет рецепта в корзине'},
                            status=status.HTTP_400_BAD_REQUEST)
        ShoppingCart.objects.get(user=username, recipe=recipe).delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

    # def perform_destroy(self, instance):
    #     instance.delete()

    def create(self, request, *args, **kwargs):
        # print('kwargs- ', kwargs.get('pk'))
        # print(self.request.data)
        # print('args-', args)
        # serializer = ShoppingCartReadSerializers(data=request.data)
        # print(987)

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
        # ShoppingCart.objects.create(user=username, recipe=recipe)
        # print(123)
        # self.perform_create(serializer)
        # print(serializer.data)
        headers = self.get_success_headers(serializer.data)
        ShoppingCart.objects.create(user=username, recipe=recipe)
        return Response(serializer.data, status=status.HTTP_201_CREATED,
                        headers=headers)

    # def create(self, request, *args, **kwargs):
    #     serializer = self.get_serializer(data=request.data)
    #     serializer.is_valid(raise_exception=True)
    #     self.perform_create(serializer)
    #     headers = self.get_success_headers(serializer.data)
    #     return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        serializer.save()

    # def destroy(self, request, pk=None):
    #     return super().destroy(request, *args, **kwargs)

    # def get_queryset(self):
    #     id = self.kwargs.get('id')
    #     print(id)
    #     new_queryset = Recipe.objects.filter(id=id)
    #     return new_queryset

    # def perform_create(self, serializer):
    #     id = self.kwargs.get('id')
    #     recipe = get_object_or_404(Recipe, pk=id)
    #     print(recipe)
    #     user = User.objects.get(username=self.request.user)
    #     serializer.save(user=user, id=recipe.id)


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

    # def perform_create(self, serializer):
    #     serializer.save()


class SubscriptionViewSet(CreateDestroyListRetriveViewSet):
    # queryset = Subscription.objects.all()
    serializer_class = SubscriptionSerializers
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        # print(self.request.user.id)
        # print(User.objects.filter(following__user=self.request.user))
        return Subscription.objects.filter(user=self.request.user)
        # return User.objects.filter(following__user=self.request.user)
        # return Subscription.objects.filter(recipes__author=self.request.user)

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
        print('REQUEST', request.data)
        following_id = kwargs.get('pk')
        print(following_id)
        username = self.request.user
        print(username)
        following = get_object_or_404(User, id=following_id)
        # following = User.objects.filter(id=following_id)
        print('id= ', following.id)
        user = get_object_or_404(User, username=username)
        print(33, user)
        if Subscription.objects.filter(user=user,
                                       following=following).exists():
            return Response(data={'errors': 'Подписка уже существует'},
                            status=status.HTTP_400_BAD_REQUEST)
        if username == following:
            return Response(data={'errors':
                                  'Нельзя подписаться на самого себя'},
                            status=status.HTTP_400_BAD_REQUEST)

        # serializer = SubscriptionSerializers(
        # serializer = self.get_serializer(data=request.data)
        serializer = CreateSubscriptionSerializers(
            data={'email': following.email, 'id': following.id,
                  'username': following.username,
                  'first_name': following.first_name,
                  'last_name': following.last_name}
            # {'email':following.email, 'id': following.id,
            # 'username': following,
            #       'cooking_time': recipe.cooking_time,
            #       'image': recipe.image}
        )
        print('data==', serializer)
        serializer.is_valid(raise_exception=True)
        print('=========')
        # self.perform_create(serializer)
        print('data2==', serializer.data)
        headers = self.get_success_headers(serializer.data)
        Subscription.objects.create(user=user, following=following)
        return Response(serializer.data, status=status.HTTP_201_CREATED,
                        headers=headers)

    # def perform_create(self, serializer):
    #     serializer.save()

# from rest_framework.generics import get_object_or_404
# from rest_framework.response import Response
import base64

from django.core.files.base import ContentFile
# from django.db.models import Count
from rest_framework import serializers  # , status

from foodgram.models import (Favorites, Ingredient, Recipe, RecipeIngredient,
                             ShoppingCart, Subscription, Tag)
from users.api.serializers import UserIdSerializer

# import webcolors


# class Hex2NameColor(serializers.Field):
#     def to_representation(self, value):
#         return value
#     def to_internal_value(self, data):
#         try:
#             data = webcolors.hex_to_name(data)
#         except ValueError:
#             raise serializers.ValidationError('Для этого цвета нет имени')
#         return data


class TagSerializers(serializers.ModelSerializer):
    # color = Hex2NameColor
    class Meta:
        model = Tag
        fields = '__all__'
        read_only_fields = ['name', 'color', 'slug']


class IngredientSerializers(serializers.ModelSerializer):
    class Meta:
        model = Ingredient
        fields = '__all__'
        read_only_fields = ('name',)


class RecipeIngredientSerializers(serializers.ModelSerializer):
    # ingredient = IngredientSerializers(many=True)
    # id = serializers.CharField(source='recipe.id')
    # name = serializers.CharField(source='ingredient.name')
    # measurement_unit = serializers.CharField(
    #     source='ingredient.measurement_unit')
    id = serializers.CharField(source='ingredient.id')
    name = serializers.CharField(source='ingredient.name', read_only=True)
    measurement_unit = serializers.CharField(
        source='ingredient.measurement_unit',
        read_only=True)
    amount = serializers.CharField()

    class Meta:
        model = RecipeIngredient
        fields = ('id', 'name', 'measurement_unit', 'amount')
        # fields = ('ingredient', 'amount')
        # read_only_fields = ('name',)


class Base64ImageField(serializers.ImageField):

    def to_internal_value(self, data):
        if isinstance(data, str) and data.startswith('data:image'):
            format, imgstr = data.split(';base64,')
            ext = format.split('/')[-1]
            data = ContentFile(base64.b64decode(imgstr),
                               name='temp_image.' + ext)
        return super().to_internal_value(data)


class RecipeListSerializers(serializers.ModelSerializer):
    author = UserIdSerializer(read_only=True)
    # tags = serializers.PrimaryKeyRelatedField(read_only=True, default=serializers.CurrentUserDefault(), many=True)
    tags = TagSerializers(read_only=True, many=True)
    image = Base64ImageField(required=False, allow_null=True)
    # ingredients = serializers.SlugRelatedField(many=True, read_only=True, slug_field='')
    # ingredients =serializers.StringRelatedField(many=True, read_only=True)
    # ingredients = RecipeIngredientSerializers(many=True)
    ingredients = RecipeIngredientSerializers(
        source='recipeingredient_set', many=True)
    is_favorited = serializers.SerializerMethodField()
    is_in_shopping_cart = serializers.SerializerMethodField()

    class Meta:
        model = Recipe
        fields = ('id', 'tags', 'author', 'ingredients', 'is_favorited',
                  'is_in_shopping_cart', 'name', 'image', 'text',
                  'cooking_time')

    def get_is_favorited(self, obj):
        username = self.context.get('request').user
        id = obj.id
        if Favorites.objects.filter(user__username=username,
                                    recipe__id=id).exists():
            return True
        return False

    def get_is_in_shopping_cart(self, obj):
        username = self.context.get('request').user
        id = obj.id
        if ShoppingCart.objects.filter(user__username=username,
                                       recipe__id=id).exists():
            return True
        return False

    def create(self, validated_data):
        # print('1', self.request)
        print('VAL', validated_data)
        ingredients = validated_data.pop('recipeingredient_set')
        id_tags = validated_data.pop('tags')
        # tags = Tag.objects.filter(id__in=id_tags)
        print('111', id_tags[0])
        recipe = Recipe.objects.create(**validated_data)
        print('RECIPE CREATE', recipe)
        # print(recipe.tags.add(id_tags[0]))
        # tags = Tag.objects.filter(id__in=id_tags)
        # print('TAGGGGS', tags)
        for id in id_tags:
            recipe.tags.add(id)
        # print('UUU', recipe.tags.set(id_tags))
        # recipe=Recipe.objects.create(**validated_data)
        # recipe.tags_set.create(tags=tags)

        # Сначала тэги, потом ingredients
        # recipe=Recipe.objects.create(**validated_data)
        # tags = validated_data.pop('tags')
        print('INGRED', ingredients)
        # print('TAGGG', tags)
        print('VAL___', validated_data)
        for id in ingredients:
            ingredient_id = id['ingredient']['id']
            current_ingredient = Ingredient.objects.get(id=ingredient_id)
            print('CURRENT INGREDIENT', current_ingredient)
            current_amount = id['amount']
            print('ITEMS', current_ingredient, current_amount)
            RecipeIngredient.objects.create(
                ingredient=current_ingredient, amount=current_amount, recipe=recipe)
        return recipe

    def update(self, instance, validated_data):
        print('UPDATE_serializ', instance)
        print(validated_data)
        RecipeIngredient.objects.filter(recipe=instance).delete()
        print('DELETED')
        ingredients = validated_data.pop('recipeingredient_set')
        id_tags = validated_data.pop('tags')
        tag = Tag.objects.get(id=1)
        print('id_tags', id_tags)
        instance.tags.set(id_tags)
        instance.name = validated_data.get('name', instance.name)
        instance.image = validated_data.get('image', instance.image)
        instance.text = validated_data.get('text', instance.text)
        instance.cooking_time = validated_data.get(
            'cooking_time', instance.cooking_time)
        instance.save()
        # for id in id_tags:
        #     print('TAGS', id)
            
            # print(instance.tags.update(id=id))
        for id in ingredients:
            ingredient_id = id['ingredient']['id']
            current_ingredient = Ingredient.objects.get(id=ingredient_id)
            print('CURRENT INGREDIENT', current_ingredient)
            current_amount = id['amount']
            print('ITEMS', current_ingredient, current_amount)
            RecipeIngredient.objects.create(
                ingredient=current_ingredient, amount=current_amount,
                recipe=instance)
        return instance

    # def create(self, validated_data):
    #     print(**validated_data)
    #     return

# class RecipeSmallSerializers(serializers.ModelSerializer):
#     id = serializers.CharField(source='recipe.id', required=False)
#     name = serializers.CharField(
#         source='recipe.name', required=False)
#     image = serializers.CharField(
#         source='recipe.image', read_only=True, required=False)
#     cooking_time = serializers.CharField(source='recipe.cooking_time',
#                                          required=False)

#     class Meta:
#         model = Recipe
#         fields = ('id', 'name', 'image', 'cooking_time')


class ShoppingCartSerializers(serializers.ModelSerializer):
    # id = serializers.CharField(source='recipe.id', required=False)
    # name = serializers.CharField(
    #     source='recipe.name', required=False)
    # image = serializers.CharField(
    #     source='recipe.image', read_only=True, required=False)
    # cooking_time = serializers.CharField(source='recipe.cooking_time',
    #                                      required=False)
    id = serializers.CharField(required=False)
    name = serializers.CharField(required=False)
    image = serializers.CharField(
        allow_null=True, read_only=True, required=False)
    cooking_time = serializers.CharField(required=False)

    class Meta:
        model = ShoppingCart
        fields = ('id', 'name', 'image', 'cooking_time')
        # read_only_fields = ('name', 'image', 'cooking_time',)

    # def get_serializer_class

    # def create(self, validated_data):
    #     # print(self.__dict__)
    #     # # print(12555, self.context.get('request').data['id'])
    #     # print()
    #     # print(self.initial_data)
    #     # print(self.context.get('request').parser_context['kwargs']['id'])
    #     # print(self.data['id'])
    #     # print()
    #     # print(validated_data)
    #     # print(validated_data['recipe']['id'])
    #     recipe_id = self.context.get('request').parser_context['kwargs']['id']
    #     # recipe_id = self.data['id']
    #     # recipe = Recipe.objects.get(id=recipe_id)
    #     recipe = get_object_or_404(Recipe, id=recipe_id)
    #     # print(type(recipe_id))
    #     username = self.context.get('request').user

    #     # shopping_cart = ShoppingCart.objects.create(user=username,
    #     #                                             recipe=recipe)
    #     if ShoppingCart.objects.filter(user=username,
    #                                        recipe=recipe).exists():
    #         raise serializers.ValidationError('Данный рецепт уже добавлен в корзину')
    #     return ShoppingCart.objects.create(user=username,
    #                                        recipe=recipe)
    #     pass

# class ShoppingCartWriteSerializers(serializers.ModelSerializer):
#     id = serializers.CharField(source='recipe.id')
#     name = serializers.CharField(
#         source='recipe.name', required=False)
#     image = serializers.CharField(
#         source='recipe.image', read_only=True, required=False)
#     cooking_time = serializers.CharField(source='recipe.cooking_time',
#                                          read_only=True, required=False)

#     class Meta:
#         model = ShoppingCart
#         fields = ('id', 'name', 'image', 'cooking_time')
#     #     # read_only_fields = ('name', 'image', 'cooking_time',)

    # # def get_serializer_class

    # def create(self, validated_data):
    #     # print(self.__dict__)
    #     # print(12555, self.context.get('request').data['id'])
    #     # print()
    #     # print(self.data['id'])
    #     # print()
    #     # print(validated_data)
    #     # print(validated_data['recipe']['id'])
    #     recipe_id = self.data['id']
    #     recipe = Recipe.objects.get(id=recipe_id)
    #     # print(type(recipe_id))
    #     username = self.context.get('request').user
    #     shopping_cart = ShoppingCart.objects.create(user=username,
    #                                                 recipe=recipe)
    #     return shopping_cart
    #     pass


class FavoriteSerializers(serializers.ModelSerializer):
    id = serializers.CharField(required=False)
    name = serializers.CharField(required=False)
    image = serializers.CharField(
        allow_null=True, read_only=True, required=False)
    cooking_time = serializers.CharField(required=False)

    class Meta:
        model = Favorites
        fields = ('id', 'name', 'image', 'cooking_time')


# class SubscriptionSerializers(serializers.ModelSerializer):
class SubscriptionSerializers(serializers.Serializer):
    email = serializers.CharField(source='following.email', required=False)
    id = serializers.CharField(source='following.id', required=False)
    username = serializers.CharField(
        source='following.username', required=False)
    first_name = serializers.CharField(
        source='following.first_name', required=False)
    last_name = serializers.CharField(
        source='following.last_name', required=False)
    is_subscribed = serializers.BooleanField(default=True)
    # recipe = serializers.CharField(source='following.recipes', required=False)
    recipes = serializers.SerializerMethodField(read_only=True, required=False)
    # recipes = serializers.CharField(
    #     source='recipes.user', required=False)

    # user = UserIdSerializer()

    # recipe = RecipeSmallSerializers(many=True)
    recipes_count = serializers.SerializerMethodField(
        read_only=True, required=False)

    # class Meta:
    #     model = Subscription
    #     fields = ('email', 'id', 'username', 'first_name', 'last_name',
    #               'is_subscribed', 'recipes', 'recipes_count')
    #     read_only_fields = ('recipes', 'recipes_count',)

    def get_recipes_count(self, obj):
        # username = self.context.get('request').user
        print(2, obj.__dict__)
        # id = obj.id
        # if Favorites.objects.filter(user__username=username, recipe__id=id).exists():
        #     return True
        # re=Recipe.objects.filter(author=obj.following_id).annotate(count_rep=Count('p'))
        # print(re.values('count_rep'))
        return Recipe.objects.filter(author=obj.following_id).count()

    def get_recipes(self, obj):
        print(1, obj.__dict__)
        # print(Recipe.objects.filter(author=obj.following_id))
        # for i in obj:

        recipes = Recipe.objects.filter(author=obj.following_id)
        # print(1, b.values()[0].get('id'))
        # print(a=recipes.annotate(Count('author')))
        # print(recipes.count)
        return recipes.values('id', 'name', 'image', 'cooking_time')
    pass


class CreateSubscriptionSerializers(serializers.Serializer):
    email = serializers.CharField(source='following.email', required=False)
    id = serializers.CharField(source='following.id', required=False)
    username = serializers.CharField(
        source='following.username', required=False)
    first_name = serializers.CharField(
        source='following.first_name', required=False)
    last_name = serializers.CharField(
        source='following.last_name', required=False)
    is_subscribed = serializers.BooleanField(default=True)
    # recipe = serializers.CharField(source='following.recipes', required=False)
    recipes = serializers.SerializerMethodField(read_only=True, required=False)
    # recipes = serializers.CharField(
    #     source='recipes.user', required=False)

    # user = UserIdSerializer()

    # recipe = RecipeSmallSerializers(many=True)
    recipes_count = serializers.SerializerMethodField(
        read_only=True, required=False)

    # class Meta:
    #     model = Subscription
    #     fields = ('email', 'id', 'username', 'first_name', 'last_name',
    #               'is_subscribed', 'recipes', 'recipes_count')
    #     read_only_fields = ('recipes', 'recipes_count',)

    def get_recipes_count(self, obj):
        # username = self.context.get('request').user
        # print(2, obj.__dict__)
        # print(235, self.initial_data.get('id'))
        # id = obj.id
        # if Favorites.objects.filter(user__username=username, recipe__id=id).exists():
        #     return True
        # re=Recipe.objects.filter(author=obj.following_id).annotate(count_rep=Count('p'))
        # print(re.values('count_rep'))
        return Recipe.objects.filter(author=self.initial_data.get('id')).count()

    def get_recipes(self, obj):
        # print(1, self._kwargs.get('data').get('id'))
        # print(1, self.__dict__)
        # print(Recipe.objects.filter(author=obj.following_id))
        # for i in obj:

        recipes = Recipe.objects.filter(author=self.initial_data.get('id'))
        # print(1, b.values()[0].get('id'))
        # print(a=recipes.annotate(Count('author')))
        # print(recipes.count)
        return recipes.values('id', 'name', 'image', 'cooking_time')

    # def validate(self, data):
    #     print(125, self.context)
    #     print(126, data)
    #     if self.context['request'].user == data['following']:
    #         raise serializers.ValidationError(
    #             'Нельзя подписаться на самого себя')
    #     return data

import base64

from django.core.files.base import ContentFile
from rest_framework import serializers

from foodgram.models import (Favorites, Ingredient, Recipe, RecipeIngredient,
                             ShoppingCart, Tag)
from users.api.serializers import UserIdSerializer


class TagSerializers(serializers.ModelSerializer):
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
    id = serializers.CharField(source='ingredient.id')
    name = serializers.CharField(source='ingredient.name',
                                 read_only=True)
    measurement_unit = serializers.CharField(
        source='ingredient.measurement_unit',
        read_only=True)
    amount = serializers.CharField()

    class Meta:
        model = RecipeIngredient
        fields = ('id', 'name', 'measurement_unit', 'amount')


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
    tags = TagSerializers(read_only=True, many=True)
    image = Base64ImageField(required=False, allow_null=True)
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
        ingredients = validated_data.pop('recipeingredient_set')
        id_tags = validated_data.pop('tags')
        recipe = Recipe.objects.create(**validated_data)
        for id in id_tags:
            recipe.tags.add(id)
        for id in ingredients:
            ingredient_id = id['ingredient']['id']
            current_ingredient = Ingredient.objects.get(id=ingredient_id)
            current_amount = id['amount']
            RecipeIngredient.objects.create(
                ingredient=current_ingredient,
                amount=current_amount,
                recipe=recipe)
        return recipe

    def update(self, instance, validated_data):
        RecipeIngredient.objects.filter(recipe=instance).delete()
        ingredients = validated_data.pop('recipeingredient_set')
        id_tags = validated_data.pop('tags')
        instance.tags.set(id_tags)
        instance.name = validated_data.get('name', instance.name)
        instance.image = validated_data.get('image', instance.image)
        instance.text = validated_data.get('text', instance.text)
        instance.cooking_time = validated_data.get(
            'cooking_time', instance.cooking_time)
        instance.save()
        for id in ingredients:
            ingredient_id = id['ingredient']['id']
            current_ingredient = Ingredient.objects.get(id=ingredient_id)
            current_amount = id['amount']
            RecipeIngredient.objects.create(
                ingredient=current_ingredient,
                amount=current_amount,
                recipe=instance)
        return instance


class ShoppingCartSerializers(serializers.ModelSerializer):
    id = serializers.CharField(required=False)
    name = serializers.CharField(required=False)
    image = serializers.CharField(allow_null=True,
                                  read_only=True, required=False)
    cooking_time = serializers.CharField(required=False)

    class Meta:
        model = ShoppingCart
        fields = ('id', 'name', 'image', 'cooking_time')


class FavoriteSerializers(serializers.ModelSerializer):
    id = serializers.CharField(required=False)
    name = serializers.CharField(required=False)
    image = serializers.CharField(
        allow_null=True, read_only=True, required=False)
    cooking_time = serializers.CharField(required=False)

    class Meta:
        model = Favorites
        fields = ('id', 'name', 'image', 'cooking_time')


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
    recipes = serializers.SerializerMethodField(read_only=True,
                                                required=False)
    recipes_count = serializers.SerializerMethodField(
        read_only=True, required=False)

    def get_recipes_count(self, obj):
        return Recipe.objects.filter(author=obj.following_id).count()

    def get_recipes(self, obj):
        recipes = Recipe.objects.filter(author=obj.following_id)
        return recipes.values('id', 'name', 'image', 'cooking_time')


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
    recipes = serializers.SerializerMethodField(read_only=True,
                                                required=False)
    recipes_count = serializers.SerializerMethodField(
        read_only=True, required=False)

    def get_recipes_count(self, obj):
        return Recipe.objects.filter(
            author=self.initial_data.get('id')).count()

    def get_recipes(self, obj):
        recipes = Recipe.objects.filter(author=self.initial_data.get('id'))
        return recipes.values('id', 'name', 'image', 'cooking_time')

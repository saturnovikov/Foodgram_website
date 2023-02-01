from rest_framework import serializers

from foodgram.api.fields import Base64ImageField
from foodgram.models import (Favorite, Ingredient, Recipe, RecipeIngredient,
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
    amount = serializers.IntegerField()

    class Meta:
        model = RecipeIngredient
        fields = ('id', 'name', 'measurement_unit', 'amount')

    def validate_amount(self, value):
        if value <= 0:
            raise serializers.ValidationError(
                'Количество не может быть отрицательным или нулевым')
        return value


class RecipeSerializers(serializers.ModelSerializer):
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
        return Favorite.objects.filter(user__username=username,
                                       recipe__id=obj.id).exists()

    def get_is_in_shopping_cart(self, obj):
        username = self.context.get('request').user
        return ShoppingCart.objects.filter(user__username=username,
                                           recipe__id=obj.id).exists()

    def create_ingredients_in_recipe(self, ingredients, recipe):
        objs = []
        for ingredient in ingredients:
            id_ingredient = ingredient['ingredient']['id']
            instance_ingredients = Ingredient.objects.get(id=id_ingredient)
            objs.append(RecipeIngredient(
                ingredient=instance_ingredients,
                amount=ingredient['amount'],
                recipe=recipe))
        RecipeIngredient.objects.bulk_create(objs)

    def validate_ingredients(self, value):
        ids = []
        for obj in value:
            id_ingredient = obj['ingredient']['id']
            if bool(ids.count(id_ingredient)):
                text = 'Ингредиент дублируется. Проверьте список ингредиентов.'
                raise serializers.ValidationError(text)
            ids.append(id_ingredient)
        return value

    def create(self, validated_data):
        ingredients = validated_data.pop('recipeingredient_set')
        id_tags = validated_data.pop('tags')
        recipe = Recipe.objects.create(**validated_data)
        for id in id_tags:
            recipe.tags.add(id)
        self.create_ingredients_in_recipe(ingredients, recipe)
        return recipe

    def update(self, instance, validated_data):
        RecipeIngredient.objects.filter(recipe=instance).delete()
        ingredients = validated_data.pop('recipeingredient_set')
        id_tags = validated_data.pop('tags')
        instance.tags.set(id_tags)
        self.create_ingredients_in_recipe(ingredients, instance)
        return super().update(
            instance=instance, validated_data=validated_data)


class RecipesmallSerializers(serializers.ModelSerializer):
    class Meta:
        model = Recipe
        fields = ('id', 'name', 'image', 'cooking_time')


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
        model = Favorite
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
    recipes = RecipesmallSerializers(source='following.recipes', many=True)
    recipes_count = serializers.SerializerMethodField(
        read_only=True, required=False)

    def get_recipes_count(self, obj):
        return Recipe.objects.filter(author=obj.following_id).count()


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

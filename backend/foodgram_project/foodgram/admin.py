from django.contrib import admin

from .models import (Favorites, Ingredient, Recipe, RecipeIngredient,
                     ShoppingCart, Subscription, Tag)

COUNT_DISPLAY_INGREDIENT = 100
COUNT_DISPLAY_RECIPE = 50


@admin.register(Favorites)
class FavoritesAdmin(admin.ModelAdmin):
    list_display = ('user', 'recipe')


@admin.register(Ingredient)
class IngredientAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'measurement_unit')
    list_filter = ('name',)
    list_per_page = COUNT_DISPLAY_INGREDIENT


@admin.register(Recipe)
class RecipeAdmin(admin.ModelAdmin):
    list_display = ('name', 'author')
    list_filter = ('name', 'author', 'tags',)
    list_per_page = COUNT_DISPLAY_RECIPE


@admin.register(RecipeIngredient)
class RecipeIngredient(admin.ModelAdmin):
    list_display = ('pk', 'ingredient', 'amount')
    list_per_page = COUNT_DISPLAY_RECIPE


@admin.register(Subscription)
class SubscriptionAdmin(admin.ModelAdmin):
    list_display = ('user', 'following')


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name',)


@admin.register(ShoppingCart)
class ShoppingCartAdmin(admin.ModelAdmin):
    list_display = ('user', 'recipe',)

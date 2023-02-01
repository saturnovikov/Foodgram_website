from django.contrib import admin

from .models import (Favorite, Ingredient, Recipe, RecipeIngredient,
                     ShoppingCart, Subscription, Tag)

COUNT_DISPLAY_INGREDIENT = 100
COUNT_DISPLAY_RECIPE = 50


@admin.register(Favorite)
class FavoritesAdmin(admin.ModelAdmin):
    list_display = ('user', 'recipe')


@admin.register(Ingredient)
class IngredientAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'measurement_unit')
    list_filter = ('name',)
    list_per_page = COUNT_DISPLAY_INGREDIENT


class RecipeIngredientAdmin(admin.TabularInline):
    model = RecipeIngredient
    min_num = 1


@admin.register(Recipe)
class RecipeAdmin(admin.ModelAdmin):
    list_display = ('name', 'author', 'count_favorite')
    list_filter = ('name', 'author', 'tags',)
    list_per_page = COUNT_DISPLAY_RECIPE
    inlines = (RecipeIngredientAdmin,)

    @admin.display(description='Count_favorite')
    def count_favorite(self, obj):
        return Favorite.objects.filter(recipe=obj.id).count()


@admin.register(Subscription)
class SubscriptionAdmin(admin.ModelAdmin):
    list_display = ('user', 'following')


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name',)


@admin.register(ShoppingCart)
class ShoppingCartAdmin(admin.ModelAdmin):
    list_display = ('user', 'recipe',)

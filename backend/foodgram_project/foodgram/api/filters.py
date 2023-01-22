import django_filters as filters

from foodgram.models import Ingredient, Recipe


class RecipeFilter(filters.FilterSet):
    author = filters.CharFilter(
        field_name='author__username',
    )
    tags = filters.CharFilter(
        # field_name='tags__slug',
        # lookup_expr='icontains',
        method='filter_tags'
    )
    is_in_shopping_cart = filters.CharFilter(
        method='filter_is_in_shopping_cart')
    is_favorited = filters.CharFilter(method='filter_is_favorited')

    class Meta:
        model = Recipe
        fields = ('author', 'tags', 'is_favorited', 'is_in_shopping_cart',)

    def filter_tags(self, queryset, name, value):
        # print(value)
        # print('DATA', self.data.getlist('tags'))
        # print('SELF', self.__dict__)
        if value:
            return queryset.filter(
                tags__slug__in=self.data.getlist('tags')).distinct()
        return queryset

    def filter_is_in_shopping_cart(self, queryset, name, value):
        if bool(int(value)) and self.request.user.is_authenticated:
            return queryset.filter(is_in_shopping_cart__user=self.request.user)
        return queryset

    def filter_is_favorited(self, queryset, name, value):
        if bool(int(value)) and self.request.user.is_authenticated:
            return queryset.filter(favorites__user=self.request.user)
        return queryset


class IngredientsFilter(filters.FilterSet):
    name = filters.CharFilter(
        field_name='name',
        lookup_expr='startswith'
    )

    class Meta:
        model = Ingredient
        fields = ('name',)

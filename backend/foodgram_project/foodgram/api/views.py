from django.shortcuts import render
from rest_framework import filters
from rest_framework import viewsets

from foodgram.models import Ingredient, Tag
from foodgram.api.serializers import IngredientSerializers, TagSerializers


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

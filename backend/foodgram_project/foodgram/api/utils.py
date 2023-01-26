from rest_framework import status
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response

from foodgram.models import Recipe


def destroy_utils(self, model, text_error):
    recipe_id = self.kwargs.get('pk')
    recipe = get_object_or_404(Recipe, id=recipe_id)
    username = self.request.user
    if not model.objects.filter(user=username,
                                recipe=recipe).exists():
        return Response(data={'detail': text_error},
                        status=status.HTTP_400_BAD_REQUEST)
    model.objects.get(user=username, recipe=recipe).delete()
    return Response(status=status.HTTP_204_NO_CONTENT)


def create_utils(self, model, text_error, kwargs):
    recipe_id = kwargs.get('pk')
    username = self.request.user
    recipe = get_object_or_404(Recipe, id=recipe_id)
    if model.objects.filter(user=username, recipe=recipe).exists():
        return Response(
            data={'detail': text_error},
            status=status.HTTP_400_BAD_REQUEST
        )
    serializer = self.serializer(
        data={'id': recipe.id, 'name': recipe.name,
              'cooking_time': recipe.cooking_time, 'image': recipe.image}
    )
    serializer.is_valid(raise_exception=True)
    headers = self.get_success_headers(serializer.data)
    model.objects.create(user=username, recipe=recipe)
    return Response(serializer.data, status=status.HTTP_201_CREATED,
                    headers=headers)

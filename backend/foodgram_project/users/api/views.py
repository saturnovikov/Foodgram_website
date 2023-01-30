from djoser import views
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.response import Response

from users.models import User


class UsersView(views.UserViewSet):
    queryset = User.objects.all()
    
    @action(['get'], detail=False)
    def me(self, request):
        user = request.user
        if request.method == "GET":
            serializer = self.get_serializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)

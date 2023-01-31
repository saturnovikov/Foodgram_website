from djoser.serializers import UserCreateSerializer, UserSerializer
from rest_framework import serializers

from foodgram.models import Subscription
from users.models import User


class UserCreateSerializer(UserCreateSerializer):
    class Meta:
        model = User
        fields = (
            'email', 'id', 'username', 'first_name', 'last_name',
            'password'
        )
        read_only_fields = ('id',)


class UserSerializer(UserSerializer):
    class Meta:
        model = User
        fields = (
            'email', 'id', 'username', 'first_name', 'last_name',
        )


class UserIdSerializer(UserSerializer):
    is_subscribed = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = (
            'email', 'id', 'username', 'first_name', 'last_name',
            'is_subscribed',
        )

    def get_is_subscribed(self, obj):
        username = self.context.get('request').user
        following = obj.id
        return Subscription.objects.filter(
            user__username=username, following=following).exists()

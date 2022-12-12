from django.contrib.auth.models import AbstractUser
from django.core.validators import RegexValidator
from django.db import models


USER = "user"
ADMIN = "admin"
ROLE_CHOICES = (
    ('user', 'Пользователь'),
    ('admin', 'Администратор'),
)
CATEGORY_REGEX = RegexValidator(r'^[\w.@+-]+\z')

class User(AbstractUser):
    username = models.CharField(
        'Login',
        max_length=150,
        unique = True,
        validators=[CATEGORY_REGEX]
    )
    email = models.EmailField(
        max_length=254,
        unique = True,
    )
    first_name = models.CharField(
        'Имя',
        max_length=150,
    )
    last_name = models.CharField(
        'Фамилия',
        max_length=150
    )
    password = models.CharField(
        'Пароль',
        max_length=150,
    )
    role = models.CharField(
        max_length=150,
        choices=ROLE_CHOICES,
        default=USER,
    )

    class Meta:
        verbose_name = 'Пользователь'
        verbose_name_plural = 'Пользователи'

    def __str__(self) -> str:
        return f'{self.username}'

    @property
    def is_admin(self):
        return self.role == ADMIN

    @property
    def is_user(self):
        return self.role == USER
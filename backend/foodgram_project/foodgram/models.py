from django.core.validators import MinValueValidator, RegexValidator
from django.db import models

from users.models import User

SLUG_REGEX = RegexValidator(r'^[-a-zA-Z0-9_]+$')
MIN_COOKING_TIME = 1


class Ingredient(models.Model):
    name = models.CharField(
        'Название',
        max_length=200
    )
    measurement_unit = models.CharField(
        'Единицы измерения',
        max_length=200
    )

    class Meta:
        verbose_name = ('Ингредиент')
        verbose_name_plural = ('Ингредиенты')

    def __str__(self):
        return f'{self.name}'


class Tag(models.Model):
    name = models.CharField(
        'Название',
        max_length=200,
        unique=True
    )
    color = models.CharField(
        'Цвет',
        max_length=7,
        null=True,
        unique=True
    )
    slug = models.CharField(
        max_length=200,
        unique=True,
        validators=[SLUG_REGEX]
    )

    def __str__(self):
        return f'{self.name}'


class Recipe(models.Model):
    name = models.CharField(
        'Название блюда',
        max_length=200
    )
    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='recipes',
        verbose_name='Автор рецепта'
    )
    tags = models.ManyToManyField(Tag)
    # ingredients = models.ManyToManyField(
    #     Ingredient,
    #     verbose_name='Ингредиент'
    # )
    # До новой базы
    # ingredients = models.ManyToManyField(
    #     'IngredientAmount',
    #     verbose_name='Ингредиент',
    #     related_name='recipe'
    # )
    ingredients = models.ManyToManyField(
        Ingredient,
        verbose_name='Ингредиент',
        # related_name='recipe',
        through='RecipeIngredient'
    )
    image = models.ImageField(
        'Фотография',
        upload_to='foodgram/image',
        blank=True,
    )
    text = models.TextField('Описание')
    cooking_time = models.PositiveIntegerField(
        'Время приготовления в минутах',
        validators=[MinValueValidator(MIN_COOKING_TIME)]
    )
    pub_date = models.DateTimeField(
        'Дата публикаии',
        auto_now_add=True
    )

    class Meta:
        verbose_name = ('Рецепт')
        verbose_name_plural = ('Рецепты')
        ordering = ('-pub_date',)

    def __str__(self):
        return f'{self.name}'


class RecipeIngredient(models.Model):
    recipe = models.ForeignKey(
        Recipe,
        on_delete=models.CASCADE,
        verbose_name='Рецепт',
    )
    ingredient = models.ForeignKey(
        Ingredient,
        on_delete=models.CASCADE,
        verbose_name='Ингредиент')
    amount = models.CharField(
        'Количество',
        max_length=50
    )

    class Meta:
        verbose_name = ('Количество ингредиентов')
        verbose_name_plural = ('Количество ингредиентов')
        ordering = ['pk']
        get_latest_by = 'pk'

    def __str__(self):
        return f'{self.ingredient}{self.recipe}'


class Favorites(models.Model):
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='favorites',
        verbose_name='Пользователь'
    )
    recipe = models.ForeignKey(
        Recipe,
        on_delete=models.CASCADE,
        related_name='favorites',
        verbose_name='Рецепт'
    )

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['user', 'recipe'], name='user_recipe'
            )
        ]
        verbose_name = ('Избранное')
        verbose_name_plural = ('Избранное')


class Subscription(models.Model):
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='follower',
        verbose_name='Подписчик'
    )
    following = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='following',
        verbose_name='Автор рецептов'
    )

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['user', 'following'], name='user_following'
            )
        ]
        verbose_name = ('Подписки')
        verbose_name_plural = ('Подписки')


class ShoppingCart(models.Model):
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='in_shoping_cart',
        verbose_name='Пользователь'
    )
    recipe = models.ForeignKey(
        Recipe,
        on_delete=models.CASCADE,
        related_name='is_in_shopping_cart',
        verbose_name='Рецепт'
    )

    class Meta:
        constraints = [
            models.UniqueConstraint(
                fields=['user', 'recipe'], name='user_recipe_shopping_cart'
            )
        ]
        verbose_name = ('Список покупок')
        verbose_name_plural = ('Список покупок')

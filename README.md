# [«Продуктовый помощник»](http://84.201.164.171)

## Описание

Продуктовый помощник - [__сайт__](http://http://84.201.164.171/recipes), на котором пользователи будут публиковать рецепты, добавлять чужие рецепты в избранное и подписываться на публикации других авторов. Сервис «Список покупок» позволит пользователям создавать список продуктов, которые нужно купить для приготовления выбранных блюд, и скачивать файл (.txt) со списком нужных продуктов и их количеством.

Также реализован сервис API.
Документация к API доступна по адресу: http://84.201.164.171/api/docs/

### Регистрация пользователей
* Регистрация пользователей происходит на странице [Регистрация](http://84.201.164.171/signup).
* Авторизация реализована с помощью токенов. 
* [Вход](http://84.201.164.171/login) на сайт выполняется с помощью email и пароля.

## Установка
В директории **infra/** находится файл docker-compose.yaml
```
Запуск контейнера:
docker-compose up -d --build
```
Далее выполнить:
```
docker-compose exec <название контейнера web> bash 
python manage.py migrate
python manage.py createsuperuser # если будет загружаться дамп, то можно пропустить
python manage.py collectstatatic --noinput
```

### Импорт данных БД из файла db_foodgram.json

```
docker-compose exec <название контейнера web> bash
python manage.py shell

выполнить в открывшемся терминале:

>>>from django.contrib.contenttypes.models import ContentType

>>>ContentType.objects.all().delete()

>>>quit()

python manage.py loaddata db_foodgram.json
```

*superuser: admin, пароль: admin*.

### ENV
#### Шаблон заполнения .env:
```
DB_ENGINE=django.db.backends.postgresql # указываем, что работаем с postgresql

POSTGRES_DB=<имя базы данных>

DB_USER=<логин для подключения к базе данных>

DB_PASSWORD=<пароль для подключения к БД>

DB_HOST=<название сервиса (контейнера)> 

DB_PORT=5432 # порт для подключения к БД
```

## Технологии

<img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue" /><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" /><img src="https://img.shields.io/badge/django%20rest-ff1709?style=for-the-badge&logo=django&logoColor=white" /><img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white" /><img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" /><img src="https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white" />

## Разработчик

| [<img src="https://github.com/saturnovikov.png?size=115" width="115"><br><sub>@saturnovikov</sub>](https://github.com/saturnovikov) |
| :---------------------------------------------------------------------------------------------------------------------: |
**Новиков Антон**: студент Yandex-practicum, курс Python разработчик.

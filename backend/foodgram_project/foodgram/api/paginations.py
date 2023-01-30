from rest_framework.pagination import PageNumberPagination, LimitOffsetPagination
from rest_framework.response import Response

class RecipePagination(PageNumberPagination):
    page_size_query_param = 'limit'
    pass
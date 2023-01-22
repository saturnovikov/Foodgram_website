"""foodgram_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path, re_path

from foodgram.api.views import SubscriptionViewSet

urlpatterns = [
    path('api/users/subscriptions/',
         SubscriptionViewSet.as_view({'get': 'list'}),
         name='get_subscriptions'),
    re_path(r'api/users\/(?P<pk>\d+)/subscribe/',
            SubscriptionViewSet.as_view(
                {'post': 'create', 'delete': 'destroy'}),
            name='subscribe'),
    path('api/users/', include('users.api.urls')),
    path('api/auth/', include('users.api.urls')),
    path('api/', include('foodgram.api.urls')),
    path('admin/', admin.site.urls),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)

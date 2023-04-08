from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('api/users/', include('users.api.urls')),
    path('api/auth/', include('users.api.urls')),
    path('api/', include('foodgram.api.urls')),
    path('admin1235/', admin.site.urls),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)

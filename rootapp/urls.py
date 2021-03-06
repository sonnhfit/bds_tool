"""tracking URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
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
from django.contrib import admin
from django.urls import path, include
from apps.dashboard import views as dash_views
from apps.users import views as user_views
from django.conf.urls.static import static
from apps.core import views as core_views

from django.conf import settings

urlpatterns = [
    path('', admin.site.urls),
    path('ckeditor/', include('ckeditor_uploader.urls')),
    path('phuong', dash_views.HomeView.as_view()),
    path('login/', user_views.LoginAPIView.as_view(), name='login_url'),
    path('get-all-home/', core_views.GetAllNewsPost.as_view()),

]





if settings.DEBUG: # new
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
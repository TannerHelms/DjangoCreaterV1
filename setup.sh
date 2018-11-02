#!/bin/bash
echo "What would you like to name your app?"
read app
echo "What was the name or your project?"
read project
echo
python manage.py startapp $app
cd $app
echo "#START

# pages/views.py
from django.http import HttpResponse


def homePageView(request):
    return HttpResponse('Hello, World! This is Tanner')


#END" > views.py

touch urls.py

echo "#START

# pages/urls.py
from django.urls import path

from .views import homePageView

urlpatterns = [
    path('', homePageView, name='home')
]

#END" >urls.py

cd ../$project

echo "#START
# helloworld_project/urls.py
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('$app.urls')),
]
#END" > urls.py

cd ..
python manage.py runserver



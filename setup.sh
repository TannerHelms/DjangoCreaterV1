#!/bin/bash
echo "What do you want to call your app?"
read app
project=$(cat projectname.txt)
python manage.py startapp $app
cd $app


# /home/USR/FOLDER/$app/views.py


echo "#START
# pages/views.py
from django.http import HttpResponse
def homePageView(request):
    return HttpResponse('Hello, World! This is Tanner')
#END" > views.py
touch urls.py


# /home/USR/FOLDER/$app/urls.py


echo "#START
# pages/urls.py
from django.urls import path
from .views import homePageView
urlpatterns = [
    path('', homePageView, name='home')
]
#END" >urls.py
cd ../$project


# /home/USR/FOLDER/$project/urls.py


echo "#START
# helloworld_project/urls.py
from django.contrib import admin
from django.urls import path, include
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('$app.urls')),
]
#END" > urls.py


# /home/USR/FOLDER/$project/settings.py




cd ..
python manage.py migrate
python manage.py runserver

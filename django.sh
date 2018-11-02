#!/bin/bash
cd /home/compsci
clear
####################################
#Create Directory
####################################
echo "What directory would you like to make?"
read seldir

####################################
#Show the directory contents
####################################
echo "You have selected $seldir"
ls | grep $seldir

####################################
#Name your project
####################################

echo "What would you like to name your project?"
read answer



####################################
#clean
####################################

sudo apt update
sudo apt autoremove

####################################
#Clean and Start making the files!!!
####################################

cd /home/compsci
mkdir $seldir
cd $seldir 

####################################
#Start your project and runs the server
####################################

echo "#!/bin/bash
django-admin startproject $answer .
tree
python manage.py runserver" > server.sh
sudo chmod 777 server.sh

echo "#!/bin/bash
python manage.py runserver" > runserver.sh
sudo chmod 777 runserver.sh

####################################
#Creates Your App
####################################

cp /home/compsci/Desktop/CreateDjango/setup.sh startapp.sh
sudo chmod 777 startapp.sh


"""
####################################
#Views.py 
####################################
#START

# pages/views.py
from django.http import HttpResponse


def homePageView(request):
    return HttpResponse('Hello, World! This is Tanner')


#END



####################################
# pages/urls.py
####################################
#START

# pages/urls.py
from django.urls import path

from .views import homePageView

urlpatterns = [
    path('', homePageView, name='home')
]

#END
####################################
#urls.py /directoryname/project name
####################################
#START
# helloworld_project/urls.py
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('pages.urls')),
]
#END

"""

####################################
#Installs Django into your foler
####################################



pipenv install django==2.1
echo "Now run ther server typing: ./server.sh"
echo "Type ./startapp.sh to setup the app"
echo "REMEMBER THAT THE NAME OF YOUR PROJECT IS :$answer"
pipenv shell




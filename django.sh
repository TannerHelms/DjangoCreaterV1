#!/bin/bash
cd /home/$USER
clear
echo "What directory would you like to make?"
read seldir
echo "You have selected $seldir"
ls | grep $seldir
echo "What would you like to name your project?"
read answer
sudo apt update
sudo apt autoremove
cd /home/compsci
mkdir $seldir
cd $seldir 
echo $answer > projectname.txt
echo "#!/bin/bash
django-admin startproject $answer .
python manage.py migrate
python manage.py runserver" > server.sh
sudo chmod 777 server.sh
echo "#!/bin/bash
python manage.py migrate
python manage.py runserver" > runserver.sh
sudo chmod 777 runserver.sh
cp /home/$USER/Desktop/DjangoCreaterV1-master/setup.sh startapp.sh
sudo chmod 777 startapp.sh
pipenv install django==2.1
echo "Now run ther server typing: ./server.sh"
echo "Type ./startapp.sh to setup the app"
pipenv shell

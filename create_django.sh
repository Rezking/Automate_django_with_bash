#!/bin/bash
#This shell is to create django projects and applications on debian linux distro

echo "Welcome to the automated django project"
#ask if python pip is installed
read -p "is pip installed?(yes/no):" response
if [ $response = "yes" ]
then echo "Installing django ......";pip install django&>-
elif [ $response = "no" ]
#install pip and django
then echo "Installing pip......";sudo apt install python3-pip&>- && echo "Installing django......";pip install django&>-
else echo "invalid response"
fi

read -p "Enter the name of your django project:" django_project
#Create django_project
echo "Creating project...";django-admin startproject $django_project
#change directory to project 
cd $django_project

#Creates virtual environment
read -p "Enter virtual environment name:" virtual_env
pip install virtualenv&>-
virtualenv $virtual_env&>- && source $virtual_env/bin/activate

echo "Loading...";pip install django&>-

echo "Welcome to your new project"
read -p "How many applications will you like to run:" app_number
START = 1
END = $app_number
for (( number=$START; number<=$END; number++ ))
    do read -p "enter application $number name:" app_name && echo "Creating $app_name ...";django-admin startapp $app_name&>-
done
#Let test our app if it is running
echo "making migrations...";python3 manage.py migrate&>-
python3 manage.py runserver

echo "Happy developing!"





# trackflight app

## Tech Stack

**Core Tech:** Python

**Backend Service:** Django, Django Rest Framework

**Database:** Mysql

**Test** Django Test, Flake8, Factory Boy

**Documentation:** Swagger

## Features

- Integrate Mqtt publising and subscribing system
- Device and Broker management
- Supports pagination system

## Run Locally

Clone the project

```bash
  git clone https://github.com/koksalkapucuoglu/tracking-flight-app.git
```

Go to the project directory

```bash
  cd tracking-flight-app
```

Create python env

```bash
  python -m venv env
```

Activate enviroment

```bash
  source env/Scripts/activate
```

or

```bash
  env\Scripts\activate
```

Install requirements

```bash
  pip install -r requirements.txt
  pip install -r requirements_dev.txt
```

Detect django model changes

```bash
  python manage.py makemigrations
```

Apply django model changes

```bash
  python manage.py migrate
```

Run django project

```bash
  python manage.py runserver
```

![Airport List](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/device_list.PNG?token=GHSAT0AAAAAABM4JJZJNXWNDJS7SSP2HC7IYSEDHLQ)

![Flight List](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/broker_list.PNG?token=GHSAT0AAAAAABM4JJZI7EGJFO54CUK7PFEKYSEDHJQ)

![Flight Count](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/broker_list.PNG?token=GHSAT0AAAAAABM4JJZI7EGJFO54CUK7PFEKYSEDHJQ)

### Run the app inside a Docker container

1. Build the docker container and get it up and running.

```
$ docker-compose build
$ docker-compose up
```

2. Setup database tables by running migrations.

```
$ docker-compose run --rm web python manage.py makemigrations
$ docker-compose run --rm web python manage.py migrate
```

### Swagger

1. Go to [http://localhost:8000/swagger](http://localhost:8000/swagger) to see Swagger documentation for API endpoints.

![Swagger Endpoint List](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/broker_list.PNG?token=GHSAT0AAAAAABM4JJZI7EGJFO54CUK7PFEKYSEDHJQ)

![Create Airport](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/broker_list.PNG?token=GHSAT0AAAAAABM4JJZI7EGJFO54CUK7PFEKYSEDHJQ)

![Create Flight](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/broker_list.PNG?token=GHSAT0AAAAAABM4JJZI7EGJFO54CUK7PFEKYSEDHJQ)

![Get Flight Number](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/broker_list.PNG?token=GHSAT0AAAAAABM4JJZI7EGJFO54CUK7PFEKYSEDHJQ)

### Run Django admin dashboard

1. Setup a password to login to the Django admin dashboard.

```
$ python manage.py createsuperuser
```

2. Go to [http://localhost:8000/admin](http://localhost:8000/admin) and login to the dashboard using username `admin` and the password you chose in step 1 above.

### Run tests and check code coverage
-> -v {0 ,1 ,2 ,3} is verbocity, verbosity is for detailed display of test results
```
python manage.py test -v 2 
```

```
coverage run manage.py test
coverage report 
```

![Test Results](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/broker_list.PNG?token=GHSAT0AAAAAABM4JJZI7EGJFO54CUK7PFEKYSEDHJQ)

![Coverage Result and Report](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/broker_list.PNG?token=GHSAT0AAAAAABM4JJZI7EGJFO54CUK7PFEKYSEDHJQ)

### Lint your code

```
flake8 <dir>
```

![Lint Results](https://raw.githubusercontent.com/koksalkapucuoglu/django-mqtt-app/master/app_screenshots/broker_list.PNG?token=GHSAT0AAAAAABM4JJZI7EGJFO54CUK7PFEKYSEDHJQ)
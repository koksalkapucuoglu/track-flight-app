# trackflight app

## Tech Stack

**Core Tech:** Python

**Backend Service:** Django, Django Rest Framework

**Database:** Mysql

**Test** Django Test, Flake8, Factory Boy

**CI/CD** Docker, Github Actions

**Documentation:** Swagger



## Features

- Management of airport list and flight list
- Track of flight count
- Better documentation using Swagger
- Better system to using test-driven development
- Continuous Integration for deployment

## Run Locally

Clone the project

```bash
  git clone https://github.com/koksalkapucuoglu/track-flight-app.git
```

Go to the project directory

```bash
  cd track-flight-app
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

Setup MySQL Enviroment

1. Install XAMPP and run
2. Start Apache and MySQL module
3. Go to [MySQL dashboard](http://localhost/phpmyadmin/index.php?route=/database/structure&db=trackingflightdatabase).
4. Create database as trackingFlightDatabase
5. Import dataset using trackingflightdatabase_old.sql file

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

![Airport List](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/airport_list.PNG)

![Flight List](https://raw.githubusercontent.com/koksalkapucuoglu/track-flight-app/master/readme_images/flight_list.PNG?token=GHSAT0AAAAAABM4JJZJJS2CZBLJBS2DENKOYWJLQWA)

![Flight Count](https://raw.githubusercontent.com/koksalkapucuoglu/track-flight-app/master/readme_images/flight_count.PNG?token=GHSAT0AAAAAABM4JJZJANP7T4XRFL5HYMO6YWJLRCQ)

### Swagger

1. Go to [http://localhost:8000/swagger](http://localhost:8000/swagger) to see Swagger documentation for API endpoints.

![Swagger Endpoint List](https://raw.githubusercontent.com/koksalkapucuoglu/track-flight-app/master/readme_images/swagger_endpoints.PNG?token=GHSAT0AAAAAABM4JJZJOBSX7VCLW6NOEFOCYWJLRNQ)

![Create Airport](https://raw.githubusercontent.com/koksalkapucuoglu/track-flight-app/master/readme_images/create_airport.PNG?token=GHSAT0AAAAAABM4JJZISHX5JVINIQ7JSEWIYWJLRYQ)

![Create Flight](https://raw.githubusercontent.com/koksalkapucuoglu/track-flight-app/master/readme_images/create_flight.PNG?token=GHSAT0AAAAAABM4JJZJQXJDS5G5VXYH2T2YYWJLSAA)

![Get Flight Count](https://raw.githubusercontent.com/koksalkapucuoglu/track-flight-app/master/readme_images/get_flight_count.PNG?token=GHSAT0AAAAAABM4JJZIDZ6YA7FIXJNZVQWCYWJLSMQ)

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

![Test Results](https://raw.githubusercontent.com/koksalkapucuoglu/track-flight-app/master/readme_images/test_result.PNG?token=GHSAT0AAAAAABM4JJZI4BYBPXI4X27MP7EMYWJLSVQ)

![Coverage Result and Report](https://raw.githubusercontent.com/koksalkapucuoglu/track-flight-app/master/readme_images/coverage_test_and_report.PNG?token=GHSAT0AAAAAABM4JJZJIBLNFPIMQY3ZRVKAYWJLS3Q)

### Lint your code

```
flake8 <dir>
```

![Lint Results](https://raw.githubusercontent.com/koksalkapucuoglu/track-flight-app/master/readme_images/flake8.PNG?token=GHSAT0AAAAAABM4JJZIZWELQTJ6NC3C57CKYWJLTGQ)


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

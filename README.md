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

![Flight List](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/flight_list.PNG)

![Flight Count](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/flight_count.PNG)

### Swagger

1. Go to [http://localhost:8000/swagger](http://localhost:8000/swagger) to see Swagger documentation for API endpoints.

![Swagger Endpoint List](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/swagger_endpoints.PNG)

![Create Airport](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/create_airport.PNG)

![Create Flight](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/create_flight.PNG)

![Get Flight Count](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/get_flight_count.PNG)

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

![Test Results](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/test_result.PNG)

![Coverage Result and Report](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/coverage_test_and_report.PNG)

### Lint your code

```
flake8 <dir>
```

![Lint Results](https://github.com/koksalkapucuoglu/track-flight-app/blob/master/readme_images/flake8.PNG)


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

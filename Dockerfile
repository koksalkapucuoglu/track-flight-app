FROM python:3.9-alpine as builder

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk update && apk add gcc python3-dev musl-dev  mariadb-dev

# this line changes
COPY ./requirements.txt ./

RUN pip wheel --no-cache-dir --wheel-dir /usr/src/app/wheels -r requirements.txt

# === FINAL IMAGE ===

FROM python:3.9-alpine

RUN addgroup -S app && adduser -S app -G app

# Create directories app_home and static directories
ENV HOME=/home/app
ENV APP_HOME=/home/app/web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Copy dependencies from builder image
RUN apk update && apk add --no-cache libpq mariadb-connector-c-dev

COPY --from=builder /usr/src/app/wheels /wheels
COPY --from=builder /usr/src/app/requirements.txt .

RUN pip install --no-cache --no-deps /wheels/*

COPY . $APP_HOME

RUN chown -R app:app $APP_HOME

USER app

RUN python manage.py collectstatic --noinput

CMD sleep 15 && python manage.py runserver 0.0.0.0:8000

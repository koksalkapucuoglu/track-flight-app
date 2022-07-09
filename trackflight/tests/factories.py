from datetime import timedelta, timezone
from random import randint, uniform

from django.db import models

import factory
from factory import LazyAttribute, LazyFunction, SubFactory, fuzzy, SelfAttribute
from factory.django import DjangoModelFactory
from faker import Factory

from trackflight.models import Airport, Flight

faker = Factory.create()


class AirportFactory(DjangoModelFactory):
    class Meta:
        model = Airport

    code = LazyAttribute(lambda o: faker.text(max_nb_chars=255))
    name = LazyAttribute(lambda o: faker.text(max_nb_chars=255))


class FlightFactory(DjangoModelFactory):
    class Meta:
        model = Flight

    flight_number = LazyAttribute(lambda o: faker.text(max_nb_chars=255))
    take_off = LazyAttribute(lambda o: faker.date_time(tzinfo=timezone(timedelta(0))).isoformat())
    landing = LazyAttribute(lambda o: faker.date_time(tzinfo=timezone(timedelta(0))).isoformat())
    to_airport = SubFactory(AirportFactory)
    from_airport = SubFactory(AirportFactory)

from datetime import datetime

import factory
from django.test import TestCase
from django.urls import reverse
from rest_framework import serializers
from rest_framework.test import APIRequestFactory

from trackflight.serializers import AirportSerializer

from .factories import AirportFactory


class AirportSerializer_Test(TestCase):
    def setUp(self):
        self.factory = APIRequestFactory()
        self.airport = AirportFactory.create()

    def test_that_a_airport_is_correctly_serialized(self):
        airport = self.airport
        serializer = AirportSerializer
        serialized_airport = serializer(airport).data

        assert serialized_airport['id'] == airport.id
        assert serialized_airport['code'] == airport.code
        assert serialized_airport['name'] == airport.name

from datetime import datetime

import factory
from django.test import TestCase
from django.urls import reverse
from rest_framework import serializers
from rest_framework.test import APIRequestFactory

from trackflight.serializers import FlightSerializer

from .factories import FlightFactory


class FlightSerializer_Test(TestCase):
    def setUp(self):
        self.factory = APIRequestFactory()
        self.flight = FlightFactory.create()

    def test_that_a_flight_is_correctly_serialized(self):
        flight = self.flight
        serializer = FlightSerializer
        serialized_flight = serializer(flight).data

        assert serialized_flight['id'] == flight.id
        assert serialized_flight['flight_number'] == flight.flight_number
        assert serialized_flight['take_off'] == flight.take_off
        assert serialized_flight['landing'] == flight.landing
        assert serialized_flight['to_airport'] == flight.to_airport.id
        assert serialized_flight['from_airport'] == flight.from_airport.id

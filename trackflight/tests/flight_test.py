import json
from datetime import datetime
from re import A

import factory
from django.core import management
from django.test import TestCase
from django.urls import reverse
from faker import Factory
from rest_framework import status
from rest_framework.test import APIClient

from ..models import Flight, Airport
from .factories import FlightFactory, AirportFactory

faker = Factory.create()


class Flight_Test(TestCase):
    def setUp(self):
        self.api_client = APIClient()
        FlightFactory.create_batch(size=3)

    def  create_and_get_airport(self):
        """
        Create a new airport object and get this object.
        """
        client = self.api_client
        airport_count = Airport.objects.count()
        airport_dict = factory.build(dict, FACTORY_CLASS=AirportFactory)
        response = client.post(reverse('airport-list'), airport_dict)
        created_airport_pk = response.data['id']
        airport = Airport.objects.get(pk=created_airport_pk)

        return airport

    def test_create_flight(self):
        """
        Ensure we can create a new flight object.
        """
        client = self.api_client
        flight_count = Flight.objects.count()
        flight_dict = factory.build(dict, FACTORY_CLASS=FlightFactory)

        airport1 = self.create_and_get_airport()
        airport2 = self.create_and_get_airport()
        flight_dict["to_airport"] = airport1.id 
        flight_dict["from_airport"] = airport2.id
        response = client.post(reverse('flight-list'), flight_dict)
        created_flight_pk = response.data['id']

        assert response.status_code == status.HTTP_201_CREATED
        assert Flight.objects.count() == flight_count + 1
        flight = Flight.objects.get(pk=created_flight_pk)

        assert flight_dict['flight_number'] == flight.flight_number
        assert flight_dict['take_off'] == flight.take_off.isoformat()
        assert flight_dict['landing'] == flight.landing.isoformat()
        assert flight_dict['to_airport'] == flight.to_airport.id
        assert flight_dict['from_airport'] == flight.from_airport.id

    def test_get_one(self):
        client = self.api_client
        flight_pk = Flight.objects.first().pk
        flight_detail_url = reverse('flight-detail', kwargs={'pk': flight_pk})
        response = client.get(flight_detail_url)
        assert response.status_code == status.HTTP_200_OK

    def test_fetch_all(self):
        """
        Create 3 objects, do a fetch all call and check if you get back 3 objects
        """
        client = self.api_client
        response = client.get(reverse('flight-list'))
        assert response.status_code == status.HTTP_200_OK
        assert Flight.objects.count() == len(response.data)

    def test_delete(self):
        """
        Create 3 objects, do a fetch all call and check if you get back 3 objects.
        Then in a loop, delete one at a time and check that you get the correct number back on a fetch all.
        """
        client = self.api_client
        flight_qs = Flight.objects.all()
        flight_count = Flight.objects.count()

        for i, flight in enumerate(flight_qs, start=1):
            response = client.delete(reverse('flight-detail', kwargs={'pk': flight.pk}))
            assert response.status_code == status.HTTP_204_NO_CONTENT
            assert flight_count - i == Flight.objects.count()

    def test_update_correct(self):
        """
        Add an object. Call an update with 2 (or more) fields updated.
        Fetch the object back and confirm that the update was successful.
        """
        client = self.api_client
        flight_pk = Flight.objects.first().pk
        flight_detail_url = reverse('flight-detail', kwargs={'pk': flight_pk})
        flight_dict = factory.build(dict, FACTORY_CLASS=FlightFactory)
        airport1 = self.create_and_get_airport()
        airport2 = self.create_and_get_airport()
        flight_dict["to_airport"] = airport1.id 
        flight_dict["from_airport"] = airport2.id
        response = client.patch(flight_detail_url, data=flight_dict)

        # print(f'response: {response.json()}')
        # print(f'response status code: {response.status_code}')
        # print(f'response.data["to_airport"]: {response.data["to_airport"]}')
        # print(f'flight_dict["to_airport"]: {flight_dict["to_airport"]}')
        assert response.status_code == status.HTTP_200_OK

        assert flight_dict['flight_number'] == response.data['flight_number']
        assert flight_dict['take_off'] == response.data['take_off'].replace('Z', '+00:00')
        assert flight_dict['landing'] == response.data['landing'].replace('Z', '+00:00')
        assert flight_dict['to_airport'] == response.data['to_airport']
        assert flight_dict['from_airport'] == response.data['from_airport']

    def test_update_take_off_with_incorrect_value_data_type(self):
        client = self.api_client
        flight = Flight.objects.first()
        flight_detail_url = reverse('flight-detail', kwargs={'pk': flight.pk})
        flight_take_off = flight.take_off
        data = {
            'take_off': faker.pystr(),
        }
        response = client.patch(flight_detail_url, data=data)
        assert response.status_code == status.HTTP_400_BAD_REQUEST
        assert flight_take_off == Flight.objects.first().take_off

    def test_update_landing_with_incorrect_value_data_type(self):
        client = self.api_client
        flight = Flight.objects.first()
        flight_detail_url = reverse('flight-detail', kwargs={'pk': flight.pk})
        flight_landing = flight.landing
        data = {
            'landing': faker.pystr(),
        }
        response = client.patch(flight_detail_url, data=data)
        assert response.status_code == status.HTTP_400_BAD_REQUEST
        assert flight_landing == Flight.objects.first().landing

    def test_update_flight_number_with_incorrect_value_outside_constraints(self):
        client = self.api_client
        flight = Flight.objects.first()
        flight_detail_url = reverse('flight-detail', kwargs={'pk': flight.pk})
        flight_flight_number = flight.flight_number
        data = {
            'flight_number': faker.pystr(min_chars=256, max_chars=256),
        }
        response = client.patch(flight_detail_url, data=data)
        assert response.status_code == status.HTTP_400_BAD_REQUEST
        assert flight_flight_number == Flight.objects.first().flight_number

    def test_update_to_airport_with_incorrect_value_outside_constraints(self):
        client = self.api_client
        flight = Flight.objects.first()
        flight_detail_url = reverse('flight-detail', kwargs={'pk': flight.pk})
        flight_to_airport = flight.to_airport
        data = {
            'to_airport': faker.pystr(min_chars=256, max_chars=256),
        }
        response = client.patch(flight_detail_url, data=data)
        assert response.status_code == status.HTTP_400_BAD_REQUEST
        assert flight_to_airport == Flight.objects.first().to_airport

    def test_update_from_airport_with_incorrect_value_outside_constraints(self):
        client = self.api_client
        flight = Flight.objects.first()
        flight_detail_url = reverse('flight-detail', kwargs={'pk': flight.pk})
        flight_from_airport = flight.from_airport
        data = {
            'from_airport': faker.pystr(min_chars=256, max_chars=256),
        }
        response = client.patch(flight_detail_url, data=data)
        assert response.status_code == status.HTTP_400_BAD_REQUEST
        assert flight_from_airport == Flight.objects.first().from_airport

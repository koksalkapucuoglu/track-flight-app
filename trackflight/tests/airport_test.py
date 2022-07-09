import json
from datetime import datetime

import factory
from django.core import management
from django.test import TestCase
from django.urls import reverse
from faker import Factory
from rest_framework import status
from rest_framework.test import APIClient

from ..models import Airport
from .factories import AirportFactory

faker = Factory.create()


class Airport_Test(TestCase):
    def setUp(self):
        self.api_client = APIClient()
        AirportFactory.create_batch(size=3)

    def test_create_airport(self):
        """
        Ensure we can create a new airport object.
        """
        client = self.api_client
        airport_count = Airport.objects.count()
        airport_dict = factory.build(dict, FACTORY_CLASS=AirportFactory)
        response = client.post(reverse('airport-list'), airport_dict)
        created_airport_pk = response.data['id']
        assert response.status_code == status.HTTP_201_CREATED
        assert Airport.objects.count() == airport_count + 1
        airport = Airport.objects.get(pk=created_airport_pk)

        assert airport_dict['code'] == airport.code
        assert airport_dict['name'] == airport.name

    def test_get_one(self):
        client = self.api_client
        airport_pk = Airport.objects.first().pk
        airport_detail_url = reverse('airport-detail', kwargs={'pk': airport_pk})
        response = client.get(airport_detail_url)
        assert response.status_code == status.HTTP_200_OK

    def test_fetch_all(self):
        """
        Create 3 objects, do a fetch all call and check if you get back 3 objects
        """
        client = self.api_client
        response = client.get(reverse('airport-list'))
        assert response.status_code == status.HTTP_200_OK
        assert Airport.objects.count() == len(response.data)

    def test_delete(self):
        """
        Create 3 objects, do a fetch all call and check if you get back 3 objects.
        Then in a loop, delete one at a time and check that you get the correct number back on a fetch all.
        """
        client = self.api_client
        airport_qs = Airport.objects.all()
        airport_count = Airport.objects.count()

        for i, airport in enumerate(airport_qs, start=1):
            response = client.delete(reverse('airport-detail', kwargs={'pk': airport.pk}))
            assert response.status_code == status.HTTP_204_NO_CONTENT
            assert airport_count - i == Airport.objects.count()

    def test_update_correct(self):
        """
        Add an object. Call an update with 2 (or more) fields updated.
        Fetch the object back and confirm that the update was successful.
        """
        client = self.api_client
        airport_pk = Airport.objects.first().pk
        airport_detail_url = reverse('airport-detail', kwargs={'pk': airport_pk})
        airport_dict = factory.build(dict, FACTORY_CLASS=AirportFactory)
        response = client.patch(airport_detail_url, data=airport_dict)
        assert response.status_code == status.HTTP_200_OK

        assert airport_dict['code'] == response.data['code']
        assert airport_dict['name'] == response.data['name']

    def test_update_code_with_incorrect_value_outside_constraints(self):
        client = self.api_client
        airport = Airport.objects.first()
        airport_detail_url = reverse('airport-detail', kwargs={'pk': airport.pk})
        airport_code = airport.code
        data = {
            'code': faker.pystr(min_chars=256, max_chars=256),
        }
        response = client.patch(airport_detail_url, data=data)
        assert response.status_code == status.HTTP_400_BAD_REQUEST
        assert airport_code == Airport.objects.first().code

    def test_update_name_with_incorrect_value_outside_constraints(self):
        client = self.api_client
        airport = Airport.objects.first()
        airport_detail_url = reverse('airport-detail', kwargs={'pk': airport.pk})
        airport_name = airport.name
        data = {
            'name': faker.pystr(min_chars=256, max_chars=256),
        }
        response = client.patch(airport_detail_url, data=data)
        assert response.status_code == status.HTTP_400_BAD_REQUEST
        assert airport_name == Airport.objects.first().name

from django.db.models import Count
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated

from .models import Airport, Flight
from .serializers import AirportSerializer, FlightSerializer


class AirportViewSet(viewsets.ModelViewSet):
    queryset = Airport.objects.all()
    serializer_class = AirportSerializer
    permission_classes = [AllowAny]
    authentication_classes = ()
    filterset_fields = ['id', 'code', 'name']


class FlightViewSet(viewsets.ModelViewSet):
    queryset = Flight.objects.all()
    serializer_class = FlightSerializer
    permission_classes = [AllowAny]
    authentication_classes = ()
    filterset_fields = ['id', 'flight_number', 'take_off', 'landing', 'to_airport', 'from_airport']


class FlightCountViewSet(viewsets.ViewSet):
    """
    A simple ViewSet for listing or retrieving users.
    """

    def list(self, request):
        queryset = Flight.objects.all().values('flight_number').annotate(
            count=Count('flight_number')).order_by('-count')
        print(f'custom queryset: {queryset}')
        # serializer = FlightSerializer(queryset, many=True)
        return Response(queryset)

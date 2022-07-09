from django.db import models


class Airport(models.Model):

    id = models.AutoField(primary_key=True)
    code = models.CharField(max_length=255, null=True, blank=True, unique=True)
    name = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = "airport"

    def __str__(self):
        return self.name


class Flight(models.Model):

    id = models.AutoField(primary_key=True)
    flight_number = models.CharField(max_length=255, null=True, blank=True)
    take_off = models.DateTimeField()
    landing = models.DateTimeField()
    to_airport = models.ForeignKey(Airport, related_name='to_airport',
                                   on_delete=models.CASCADE, null=False)
    from_airport = models.ForeignKey(
        Airport, related_name='from_airport', on_delete=models.CASCADE, null=False)

    class Meta:
        db_table = "flight"

    def __str__(self):
        return self.flight_number

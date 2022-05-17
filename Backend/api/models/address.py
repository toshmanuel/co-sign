from django.db import models
from django.contrib.auth.models import User


class Addresses(models.Model):
    address_generated=models.CharField(max_length=80)
    user_id= models.ForeignKey(User, on_delete=models.CASCADE)
    script_pubkey=models.CharField(max_length=200)
    service_key = models.CharField(max_length=80)

    def __str__(self):
        return self.address_generated
    
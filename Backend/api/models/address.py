from django.db import models
from django.contrib.auth.models import User


class Addresses(models.Model):
    address_generated=models.CharField()
    user_id= models.ForeignKey(User, on_delete=models.CASCADE)
    script_pubkey=models.CharField()
    service_key = models.CharField()

    def __str__(self):
        return self.address_generated
    
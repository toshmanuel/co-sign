from django.db import models
from .address import Addresses

# Create your models here.
class Transactions(models.Model):
    tx_id =models.CharField()
    address=models.ForeignKey(Addresses, on_delete=models.CASCADE)
    txn_input=models.CharField()
    recipient_address=models.CharField()
    amount_sent=models.IntegerField()
    txn_fee=models.IntegerField()
    created_at=models.DateTimeField(auto_now_add=True)
   
    def __str__(self):
        return self.tx_id



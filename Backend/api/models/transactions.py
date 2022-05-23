from django.db import models
from .address import Addresses

# Create your models here.
class Transactions(models.Model):
    tx_id =models.CharField(max_length=80)
    address=models.ForeignKey(Addresses, on_delete=models.CASCADE)
    txn_input=models.CharField(max_length=200)
    recipient_address=models.CharField(max_length=60)
    amount_sent=models.IntegerField()
    txn_fee=models.IntegerField()
<<<<<<< HEAD
    created_at=models.DateTimeField(auto_now_add=True)
   
    def __str__(self):
        return self.tx_id


=======
    transaction_id=models.CharField(max_length=255,blank=True, null=True)
    created_at=models.DateTimeField(auto_now_add=True)
   
    def __str__(self):
        return self.transaction_id
>>>>>>> 0a20c58ef5ad045a889ac625ce7445e97755b919



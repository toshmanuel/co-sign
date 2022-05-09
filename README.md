<h1 align="center">Welcome to Co Sign 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000" />
</p>

> A service that provide collaborative and secure custody of bitcoin. A M of N multi-sig wallet where the user holds Mof the keys and the service holds one, that way the service is unable to sign transactions since they only have one key. Users can make use of their M keys or allow service to provide the other key necessary for transaction (User has to give service permission to sign with their key)

## Backend

### Requirements
```python
python
pip
virtualenv
postgres
```

### Running The Backend
1. clone the repository ```git clone https://github.com/toshmanuel/co-sign.git```
1. ```cd Backend```
1. ```virtualenv venv```
1. for MACOS/LINUX ```source venv/bin/activate```
1. for WINDOWS ```venv\Scripts\activate```
1. ```pip install -r requirements.txt```
1. create a .env file in the Backend directory
1. check the .env.sample file and copy to variable to the .env file
1. replace the 'somevalues' with the neccesary value
1. ```python manage.py runserver```

### API Examples
```json
Register User API

Request Body Parameters
{
  "email": "some@email.com",
  "password": "somepassword",
  "password2": "somepassword"
}

Response

```


## Authors

👤 **toshmanuel**
👤 **Muneerah1612**
👤 **j-kon**

* Github: [@toshmanuel](https://github.com/toshmanuel)
* Github: [@Muneerah1612](https://github.com/Muneerah1612)
* Github: [@j-kon](https://github.com/j-kon)

## Show your support
Give a ⭐️ if this project helped you!

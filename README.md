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

1. ```POST /api/v1/register```

> 
> Request Body
> 
> ```json
> {
>  "email": "some@email.com",
>  "password": "somepassword",
>  "password2": "somepassword"
> }
> ```
>
> On a successful request, this endpoint would return a 201 status code and 
> 
> Response Body
> ```json
> {
>    "email": "some@email.com"
> }
> ```
> On a failed request e.g, email is not provided or the password does not match, or the password is too common, or the user already exists. this endpoint would return a 400 bad request status code
> 
> Possible Error Response, may return one or more of the following error
> ```json
> {
>    "email": [
>       "This field must be unique.", 
>       "Enter a valid email address."
>    ],
>    "password": [
>        "This password is too common.",
>        "Password fields didn't match.",
>    ]
> }
> ```
>

2. ```POST /api/v1/login```

> 
> Request Body
> 
> ```json
> {
>  "username": "some@email.com",
>  "password": "somepassword",
> }
> ```
>
> On a successful request, this endpoint would return a 200 status code and 
> 
> Response Body
> ```json
> {
>    "expiry": "2022-05-10T06:01:06.930521+01:00",
>    "token": "3ee47e529230b68e12685924f1da2aa0cf67e228ea486626b6e2bbbeda117936"
> }
> ```
> On a failed request e.g, username is not provided, or the username is wrong or does not exist, or the password is incorrect, this endpoint would return a 400 bad request status code
> 
> Possible Error Response, may return one or more of the following error
> ```json
> {
>    "non_field_errors": [
>        "Unable to log in with provided credentials."
>    ],
>    "username": [
>        "This field may not be blank."
>    ],
>    "password": [
>        "This field may not be blank."
>    ]
> }
> ```
>

3. ```POST /api/v1/logout/```

> 
> Request Header should contain 
> ``` Authorzation: Token token_generated_from_login```
>
> On a successful request, this endpoint would return a 204 status code and 
> 
> ```\
> On a failed request e.g, if the key "Authorization" is not provided in the header, this endpoint would return a 400 bad request status code
> 
> Possible Error Response, may return one or more of the following error
> ```json
> 
> {
>    "detail": "Invalid token."
> }
>
>{
>    "detail": "Authentication credentials were not provided."
>}
> ```
>




## Authors

👤 **toshmanuel**
👤 **Muneerah1612**
👤 **j-kon**

* Github: [@toshmanuel](https://github.com/toshmanuel)
* Github: [@Muneerah1612](https://github.com/Muneerah1612)
* Github: [@j-kon](https://github.com/j-kon)

## Show your support
Give a ⭐️ if this project helped you!

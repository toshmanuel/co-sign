FROM python:3.8
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY /api /api
COPY /cosign /cosign
COPY manage.py manage.py

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

EXPOSE 8000  

CMD python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000

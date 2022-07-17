FROM python:3.11-rc-alpine

ENV PYTHONUNBUFFERED 1

COPY Pipfile Pipfile.lock ./
RUN python -m pip install --upgrade pip
RUN pip install pipenv && pipenv install --dev --system --deploy --ignore-pipfile

RUN mkdir -p /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
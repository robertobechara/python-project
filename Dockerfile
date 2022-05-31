FROM python:3.9-slim

# POETRY
ENV POETRY_VERSION 1.1.13
RUN pip3 install --upgrade pip setuptools \
    && pip3 install poetry==${POETRY_VERSION}

RUN mkdir /app
WORKDIR /app

ADD pyproject.toml poetry.lock /app/
ADD src /app/src

RUN poetry config virtualenvs.in-project true \
    && poetry install --no-dev

RUN poetry build

ENTRYPOINT ["poetry", "run", "run-script"]

FROM python:3.10.8-slim-buster

COPY ./src /src
COPY ./requirements.txt /src

WORKDIR /src

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "uvicorn" ]
CMD [ "main:app", "--host", "0.0.0.0", "--port", "8000"]
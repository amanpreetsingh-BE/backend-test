FROM python:3.10.8-slim-buster

COPY ./src /app/src
COPY ./requirements.txt /app

WORKDIR /app

RUN pip3 install -r requirements.txt

EXPOSE 8000

ENTRYPOINT [ "uvicorn" ]
CMD [ "src.main:app", "--host", "0.0.0.0"]
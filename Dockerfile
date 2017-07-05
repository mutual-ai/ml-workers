FROM python:3.6-slim

RUN apt-get update && \
	apt-get install -y wget git nano grep sed && \
    apt-get clean

RUN mkdir /code && mkdir /output
WORKDIR /code
ADD . /code/

RUN pip install -r requirements.txt

ENV PYTHONUNBUFFERED 1

ENTRYPOINT /bin/bash -c "python ml_task_runner.py"
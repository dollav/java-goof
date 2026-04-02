FROM python:3.7-slim-bullseye

RUN apt-get update
RUN apt install linux-libc-dev

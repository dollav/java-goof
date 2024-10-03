From python:3.13.0rc2-slim

RUN apt-get update
RUN apt-get install libkrb5support0 -y

RUN ["sleep", "1"]

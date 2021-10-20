# Use the official Python image.
# https://hub.docker.com/_/python
FROM python:3.8-slim

# Your external IP in development to test geolocation
ENV DEV_EXT_IP xxx.xxx.xxx.xxx

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn

RUN chmod -R 444 *.py
RUN chmod -R 444 *.txt

# Service must listen to $PORT environment variable.
# This default value facilitates local development.
ENV PORT 8080

# Run the web service on container startup.
CMD exec gunicorn app:app --workers 2 --threads 2 -b 0.0.0.0:8080

# to build and run this Dockerfile:
# docker build -t covidweb . && docker run --rm -p 8080:8080 -e PORT=8080 covidweb
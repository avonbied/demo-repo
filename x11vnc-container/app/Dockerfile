FROM docker.io/python:3.9-alpine

RUN apk add --no-cache xvfb x11vnc mesa-dri-gallium xvfb-run

ENV DISPLAY=:99
ENV XAUTHORITY=CookieFile

WORKDIR /home/app
COPY . .

WORKDIR /home/app/src
RUN pip install -r requirements.txt

WORKDIR /home/app
EXPOSE 5900
ENTRYPOINT [ "./entrypoint.sh" ]
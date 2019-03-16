FROM alpine:3.4
COPY ./build/build.sh /tmp/build.sh
RUN /tmp/build.sh
COPY . /var/src
WORKDIR /var/src
ENTRYPOINT ["./scraper.py"]

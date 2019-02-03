FROM golang:1.9.1

MAINTAINER Fedorenko Victor <fedorenko22116@gmail.com>

RUN apt-get update && apt-get install -y git

RUN wget -qO- https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get install -y nodejs && apt-get install -y build-essential
RUN git clone https://github.com/webchain-network/webchain-pool.git /app

WORKDIR /app/www

RUN npm install -g ember-cli@2.4.3 && \
    npm install -g bower && \
    npm install && \
    bower install --allow-root

WORKDIR /app

RUN make

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && ln -s /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080
EXPOSE 8888
EXPOSE 3333

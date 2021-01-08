FROM openresty/openresty

RUN apt update && apt upgrade -y && apt install -y luarocks git

RUN mkdir -p /etc/openresty/sites/

COPY src/* /etc/openresty/sites/
COPY default.conf /etc/nginx/conf.d/default.conf

RUN luarocks install uuid
RUN luarocks install amqp-client

EXPOSE 80
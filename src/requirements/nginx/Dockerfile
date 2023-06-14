FROM	debian:buster


RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/heloufra.key \
    -out /etc/nginx/ssl/heloufra.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

COPY ./config/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
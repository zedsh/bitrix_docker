FROM nginx:1.15.5

RUN mkdir -p /run/php

ADD ./conf/nginx.conf /etc/nginx/
ADD ./conf/upstream.conf /etc/nginx/conf.d/
ADD ./conf/default.conf /etc/nginx/conf.d
ARG USER='www-data'
ARG USER=${USER} 
ENV USER ${USER}

RUN sed -i -e "s/#USER#/$USER/g" /etc/nginx/nginx.conf
RUN cat /etc/nginx/nginx.conf

CMD ["nginx"]

EXPOSE 80 443

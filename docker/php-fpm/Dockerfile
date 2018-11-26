FROM phpdockerio/php71-fpm

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /run/php

ARG APP_ENV='prod'
ARG APP_ENV=${APP_ENV} 
ENV APP_ENV ${APP_ENV}

ARG USER='www-data'
ARG USER=${USER} 
ENV USER ${USER}



RUN echo `test ${APP_ENV} '=' 'local' &&  echo "${APP_ENV} php-xdebug on" || echo "${APP_ENV} php-xdebug off"`

ADD ./conf/local /etc/apt/apt.conf.d/local

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php7.1-memcached \
    php7.1-memcache \
    php7.1-mysql `test ${APP_ENV} '=' 'local' &&  echo "php-xdebug" || echo ""` \
    php7.1-intl \
    php7.1-interbase \
    php7.1-gd \
    php7.1-imagick \
    php7.1-mcrypt \
    msmtp \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*



ADD ./conf/php.ini /etc/php/7.1/fpm/php.ini
ADD ./conf/php.ini /etc/php/7.1/cli/php.ini
ADD ./conf/www.conf /etc/php/7.1/fpm/pool.d/www.conf
RUN sed -i -e "s/#USER#/$USER/g" /etc/php/7.1/fpm/pool.d/www.conf
RUN rm -f /etc/php/7.1/fpm/pool.d/z-overrides.conf
# MSMTP
ADD ./conf/msmtprc /etc/msmtprc
RUN chmod 0600 /etc/msmtprc && \
    chown www-data:www-data /etc/msmtprc && \
    mkdir -p /var/log/msmtp \
    touch /var/log/msmtp/msmtp.log && \
    chmod 775 /var/log/msmtp/msmtp.log && \
    chown www-data:www-data /var/log/msmtp/msmtp.log

EXPOSE 9000

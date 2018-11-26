FROM mysql:8.0

ADD conf.d/my.cnf /etc/mysql/conf.d/my.cnf

#RUN groupadd -r $USER && useradd -r -g $USER $USER

CMD ["mysqld"]

EXPOSE 3306

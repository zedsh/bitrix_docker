Базовый docker-образ для Битрикс-сайта
======================================
TODO
================
- Подключение к mysql через сокет
- Заготовка использования сертификата (let's encrypt или свой)
- Пароль к бд в .env
- Параметры почты в env
- Автоматическая генерация .env



Развёртывание
=================
Установить docker/docker-compose

Склонировать репозиторий

Перейти в репозиторий

`cp .env.example .env`

Сменить в файле .env переменные 

`APP_ENV= local или prod`, при значении local при сборке включается расширение xdebug

`MYSQL_USER_ID=1000 - вместо 1000 выставить идентификатор своего пользователя, узнать его можно командой id`

`docker-compose build`

`docker-compose up`

Структура каталогов
=========
DOCUMENT ROOT сайта - web/

Каталог логов всех сервисов - logs/

Каталог файлов БД - database/

Каталог конфигураций docker - /docker


Установка Битрикс
=================
При необходимости чистой установки 1С-битрикс расположить в каталоге web скрипт http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php .  

Для настройки подключения к базе использовать хост mysql, пользователь/бд site, пароль xV1S1YQFLwL1 (настраивается в docker-compose.yml)

Краткий список команд для docker-compose
===============
docker-compose build - собрать образы docker

docker-compose up - запустить образы с текущей конфигурацией (опция -d запускает в режиме демона)

docker ps - вывести список активных образов

docker exec -it #хеш-код образа bash - войти внутрь образа в оболочку (вместо bash может быть sh и любая другая команда, параметры it нужды для интерактивной сессии)



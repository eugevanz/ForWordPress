FROM wordpress:latest

RUN apt-get update && \
    apt-get install -y ca-certificates apt-transport-https wget gnupg && \
    wget -qO - https://packages.sury.org/php/apt.gpg | gpg --batch --no-tty --dearmor --output /etc/apt/trusted.gpg.d/sury.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sury.list && \
    apt-get update && apt-get install -y --no-install-recommends \
        postgresql-client \
        php-pgsql

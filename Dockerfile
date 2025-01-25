FROM wordpress:latest

RUN apt-get update && \
    apt-get install -y ca-certificates apt-transport-https wget gnupg && \
    wget -qO /tmp/sury.gpg https://packages.sury.org/php/apt.gpg && \
    gpg --batch --no-tty --dearmor /tmp/sury.gpg > /tmp/sury.gpg.gpg && \
    mv /tmp/sury.gpg.gpg /etc/apt/trusted.gpg.d/sury.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sury.list && \
    apt-get update && apt-get install -y --no-install-recommends \
        postgresql-client \
        php8.2-pgsql

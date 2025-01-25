FROM wordpress:latest

RUN apt-get update && \
    apt-get install -y ca-certificates apt-transport-https wget && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/sury.list && \
    apt-get update && apt-get install -y --no-install-recommends \
        postgresql-client \
        php8.2-pgsql

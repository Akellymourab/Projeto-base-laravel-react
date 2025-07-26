FROM php:8.2-fpm

WORKDIR /var/www/html

RUN groupadd -g 1000 developer && useradd -u 1000 -ms /bin/bash -g developer developer

RUN mkdir -p /var/www/html/storage /var/www/html/bootstrap/cache /var/www/.composer \
    && chown -R developer:developer /var/www/html /var/www/.composer

RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libzip-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip

RUN pecl install mongodb && docker-php-ext-enable mongodb

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER developer

EXPOSE 9000

CMD ["php-fpm"]
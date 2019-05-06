FROM php:7.3-apache
WORKDIR /var/www/html

# Install dependencies
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod proxy
RUN a2enmod proxy_http

RUN { \
		echo 'memory_limit=256M'; \
		echo 'upload_max_filesize=128M'; \
		echo 'post_max_size=128M'; \
		echo 'ax_execution_time=120'; \
		echo 'output_buffering=4096'; \
} > /usr/local/etc/php/conf.d/php.ini

RUN apt-get update && \
    apt-get install -y libzip-dev libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev git zlib1g-dev && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd zip json xml

EXPOSE 80 443
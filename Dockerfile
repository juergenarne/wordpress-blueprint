FROM php:8.3-apache

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip

# Enable Apache mod_rewrite for pretty permalinks
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install mysqli

# Enable Apache mod_rewrite for WordPress permalinks
RUN a2enmod rewrite
#!/bin/bash

cd /var/www/html

echo "Réglage des permissions..."
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
rm -rf /var/www/html/*

echo "Téléchargement de WordPress..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


echo "Téléchargement de WordPress..."
wp core download --allow-root

echo "Vérification de la connexion à la base de données..."
sleep 10

db_password=$(cat $DB_PASSWORD)
wp_admin_password=$(cat $WP_ADMIN_PASSWORD)
wp_user_password=$(cat $WP_USER_PASSWORD)

echo "Création du fichier wp-config.php..."
sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
sed -i "s/password_here/$db_password/g" wp-config-sample.php
sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

echo "Installation de WordPress..."
wp core install --url=$WP_URL --title="Inception by Lolo" --admin_user=$WP_ADMIN_NAME --admin_password=$wp_admin_password --admin_email=$WP_ADMIN_MAIL --allow-root

echo "Creation second utilisateur..."
wp user create $WP_USER $WP_USER_MAIL --role=editor --user_pass=$wp_user_password --allow-root


echo "Installation du thème..."
wp theme install skatepark --allow-root
wp theme activate skatepark --allow-root


echo "Réglage des permissions..."
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

echo "Démarrage de PHP-FPM..."
php-fpm7.3 -F
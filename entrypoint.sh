#/bin/bash

echo "EXECUTANDO ENTRYPOINT"

cd /app

composer install

php artisan migrate
#!/bin/sh

while ! nc -z database 3306; do
    echo "Waiting for database"
    sleep 10
done

./gowebapp

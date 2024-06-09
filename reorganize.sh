#!/bin/bash

# Crear las carpetas necesarias
mkdir -p geoproject/geoproject
mkdir -p geoproject/geodjangoapp
mkdir -p geoproject/geodjangoapp/migrations

# Mover archivos a la ubicación correcta si existen
if [ -f "geoproject/__init__.py" ]; then
    mv geoproject/__init__.py geoproject/geoproject/
fi

if [ -f "geoproject/settings.py" ]; then
    mv geoproject/settings.py geoproject/geoproject/
fi

if [ -f "geoproject/urls.py" ]; then
    mv geoproject/urls.py geoproject/geoproject/
fi

if [ -f "geoproject/wsgi.py" ]; then
    mv geoproject/wsgi.py geoproject/geoproject/
fi

if [ -f "geoproject/asgi.py" ]; then
    mv geoproject/asgi.py geoproject/geoproject/
fi

# Crear archivos vacíos en la aplicación geodjangoapp
touch geoproject/geodjangoapp/__init__.py
touch geoproject/geodjangoapp/admin.py
touch geoproject/geodjangoapp/apps.py
touch geoproject/geodjangoapp/models.py
touch geoproject/geodjangoapp/tests.py
touch geoproject/geodjangoapp/views.py
touch geoproject/geodjangoapp/migrations/__init__.py

# Imprimir estructura final de carpetas y archivos
echo "Estructura de carpetas y archivos reorganizada:"
find geoproject

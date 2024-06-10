#!/bin/bash

# Asegurarse de estar en el directorio correcto
cd "$(dirname "$0")"

# Crear la nueva estructura de directorios deseada
mkdir -p project/app/migrations
mkdir -p project/settings

# Mover archivos de la aplicación a la nueva ubicación
mv geoproject/geodjangoapp/__init__.py project/app/__init__.py 2>/dev/null
mv geoproject/geodjangoapp/admin.py project/app/admin.py 2>/dev/null
mv geoproject/geodjangoapp/apps.py project/app/apps.py 2>/dev/null
mv geoproject/geodjangoapp/migrations/__init__.py project/app/migrations/__init__.py 2>/dev/null
mv geoproject/geodjangoapp/models.py project/app/models.py 2>/dev/null
mv geoproject/geodjangoapp/tests.py project/app/tests.py 2>/dev/null
mv geoproject/geodjangoapp/views.py project/app/views.py 2>/dev/null

# Mover archivos de configuración a la nueva ubicación
mv geoproject/geoproject/__init__.py project/settings/__init__.py 2>/dev/null
mv geoproject/geoproject/asgi.py project/settings/asgi.py 2>/dev/null
mv geoproject/geoproject/settings.py project/settings/settings.py 2>/dev/null
mv geoproject/geoproject/urls.py project/settings/urls.py 2>/dev/null
mv geoproject/geoproject/wsgi.py project/settings/wsgi.py 2>/dev/null
mv geoproject/geoproject/__pycache__ project/settings/__pycache__ 2>/dev/null

# Mover manage.py a la raíz del proyecto
mv geoproject/manage.py ./manage.py 2>/dev/null

# Eliminar las carpetas antiguas innecesarias
rm -rf geoproject

echo "Estructura de carpetas y archivos reorganizada:"
tree . || find .

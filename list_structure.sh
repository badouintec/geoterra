#!/bin/bash

# Asegurarse de estar en el directorio correcto
cd "$(dirname "$0")"

OUTPUT_FILE="directory_structure.txt"

# Verificar si el comando tree está instalado
if command -v tree &> /dev/null
then
    echo "Usando el comando tree para listar la estructura de directorios:"
    tree -L 3 -I "myenv|node_modules" . > "$OUTPUT_FILE"
else
    echo "El comando tree no está instalado. Usando el comando find en su lugar:"
    find . -maxdepth 3 -not -path "./myenv*" -not -path "./node_modules*" > "$OUTPUT_FILE"
fi

echo "La estructura de directorios ha sido exportada a $OUTPUT_FILE"

#!/bin/bash

# Define el archivo SQL original y el archivo modificado
ORIGINAL_FILE="BOXDBFINAL.sql"
MODIFIED_FILE="BOXDBFINALARCH.sql"

# Reemplaza charset y collation en todo el archivo
sed -e 's/CHARACTER SET utf8mb3/CHARACTER SET utf8mb4/g' \
    -e 's/CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci/CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci/g' \
    -e 's/DEFAULT CHARSET=utf8mb3/DEFAULT CHARSET=utf8mb4/g' \
    -e 's/DEFAULT CHARSET=utf8mb3 COLLATE utf8mb3_general_ci/DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci/g' \
    "$ORIGINAL_FILE" > "$MODIFIED_FILE"

echo "El archivo modificado se ha guardado como $MODIFIED_FILE"

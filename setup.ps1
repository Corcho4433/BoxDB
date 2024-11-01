# Crear el entorno virtual si no existe
if (!(Test-Path -Path "venv")) {
    python -m venv venv
    Write-Output "Entorno virtual 'venv' creado."
}

# Activar el entorno virtual
& .\venv\Scripts\Activate.ps1

# Instalar dependencias
pip install -r requirements.txt
Write-Output "Dependencias instaladas y entorno virtual activado. Listo para ejecutar el programa."

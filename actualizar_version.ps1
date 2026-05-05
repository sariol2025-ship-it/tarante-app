# Script para actualizar versión y subir cambios
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html"

# Actualizar versión de 6.21 a 6.21 (ya está en 6.21)
$content = $content -replace "const APP_VERSION = '6.21';", "const APP_VERSION = '6.21';"

# Actualizar título
$content = $content -replace "TaranTe v6.21", "TaranTe v6.21"

$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Encoding UTF8

Write-Host "Versión actualizada a 6.21"

# Subir cambios al repositorio
Set-Location "C:\Users\usuario\Documents\trae_projects\tarante-app-remote"
& 'C:\Program Files\Git\cmd\git.exe' add .
& 'C:\Program Files\Git\cmd\git.exe' commit -m "Organizar vistas: Dashboard solo mesas, Menú solo menú del día y fijos, Configuración intacta - v6.21"
& 'C:\Program Files\Git\cmd\git.exe' push origin main

Write-Host "Cambios subidos exitosamente al repositorio"

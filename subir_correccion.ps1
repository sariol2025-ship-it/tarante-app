# Script para subir la corrección del login
Set-Location "C:\Users\usuario\Documents\trae_projects\tarante-app-remote"

# Actualizar versión a 6.22 por la corrección
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html"
$content = $content -replace "const APP_VERSION = '6.21';", "const APP_VERSION = '6.22';"
$content = $content -replace "TaranTe v6.21", "TaranTe v6.22"
$content = $content -replace "v6.21", "v6.22"
$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Encoding UTF8

# Subir cambios al repositorio
& 'C:\Program Files\Git\cmd\git.exe' add .
& 'C:\Program Files\Git\cmd\git.exe' commit -m "Corregir problema de login: agregar función hideLoader() - v6.22"
& 'C:\Program Files\Git\cmd\git.exe' push origin main

Write-Host "Corrección del login subida exitosamente - v6.22"

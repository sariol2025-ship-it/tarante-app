# Script para limpiar el Dashboard de forma directa
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html"

# Eliminar sección de Menú del Día
$content = $content -replace '(?s)<div class="panel-section">\s*<h3>🍽️ Menú del Día</h3>.*?</div>\s*</div>\s*<div class="grid grid-3">.*?</div>\s*</div>\s*(?=<!-- ============ COMANDAS ============ -->)', '$1'

# Eliminar los tres paneles de estadísticas
$content = $content -replace '(?s)<div class="grid grid-3">\s*<div class="panel">\s*<div class="panel-header">🪑 Mesas Activas</div>.*?</div>\s*</div>\s*<div class="panel">\s*<div class="panel-header">📋 Pedidos en Cocina</div>.*?</div>\s*</div>\s*<div class="panel">\s*<div class="panel-header">💰 Ventas del Día</div>.*?</div>\s*</div>\s*(?=<!-- ============ COMANDAS ============ -->)', '$1'

$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html"
Write-Host "Dashboard limpiado exitosamente - Solo mesas visibles"

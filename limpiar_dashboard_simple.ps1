# Script simple para limpiar el Dashboard
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html"

# Buscar y eliminar la sección de Menú del Día
$menuPattern = '(?s)<div class="panel-section">\s*<h3>🍽️ Menú del Día</h3>.*?</div>\s*</div>\s*<div class="grid grid-3">.*?</div>\s*</div>\s*(?=<!-- ============ COMANDAS ============ -->)'
if ($content -match $menuPattern) {
    $content = $content -replace $menuPattern, '$1'
}

# Buscar y eliminar los tres paneles de estadísticas
$statsPattern = '(?s)<div class="grid grid-3">\s*<div class="panel">\s*<div class="panel-header">🪑 Mesas Activas</div>.*?</div>\s*</div>\s*<div class="panel">\s*<div class="panel-header">📋 Pedidos en Cocina</div>.*?</div>\s*</div>\s*<div class="panel">\s*<div class="panel-header">💰 Ventas del Día</div>.*?</div>\s*</div>\s*(?=<!-- ============ COMANDAS ============ -->)'
if ($content -match $statsPattern) {
    $content = $content -replace $statsPattern, '$1'
}

$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html"
Write-Host "Dashboard limpiado exitosamente - Solo mesas visibles"

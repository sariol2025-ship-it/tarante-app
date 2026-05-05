# Limpiar Dashboard para mostrar solo mesas
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html"

# Eliminar sección de Menú del Día
$content = $content -replace [regex]::(?s)<div class="panel-section">\s*<h3>🍽️ Menú del Día</h3>.*?</div>\s*</div>\s*</div>\s*<div class="grid grid-3">.*?</div>\s*</div>\s*<!-- ============ COMANDAS ============ -->, '$1<!-- ============ COMANDAS ============ -->', [regex]::Singleline, Multiline

# Eliminar los tres paneles de estadísticas (Mesas Activas, Pedidos en Cocina, Ventas del Día)
$content = $content -replace [regex]::(?s)<div class="grid grid-3">.*?</div>\s*</div>\s*<!-- ============ COMANDAS ============ -->, '$1<!-- ============ COMANDAS ============ -->', [regex]::Singleline, Multiline

$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html"
Write-Host "Dashboard limpiado exitosamente"

# Script robusto para limpiar el Dashboard
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Raw

# Encontrar y eliminar la sección de Menú del Día
$menuStart = $content.IndexOf('<div class="panel-section">')
$menuEnd = $content.IndexOf('<!-- ============ COMANDAS ============ -->', $menuStart)
if ($menuStart -ge 0 -and $menuEnd -gt 0) {
    $content = $content.Substring(0, $menuStart) + $content.Substring($menuEnd)
}

# Encontrar y eliminar los tres paneles de estadísticas
$statsStart = $content.IndexOf('<div class="grid grid-3">')
$statsEnd = $content.IndexOf('<!-- ============ COMANDAS ============ -->', $statsStart)
if ($statsStart -ge 0 -and $statsEnd -gt 0) {
    $content = $content.Substring(0, $statsStart) + $content.Substring($statsEnd)
}

$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Encoding UTF8
Write-Host "Dashboard limpiado exitosamente - Solo mesas visibles"

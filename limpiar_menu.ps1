# Script para limpiar la pestaña Menú
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Raw

# Encontrar la sección de Menú del Día y eliminar todo excepto el título y el contenedor del menú
$menuPattern = '(?s)<div id="vistaItemsDia">\s*<div id="itemsMenuDia">.*?</div>\s*</div>\s*<div class="grid grid-2" id="gridMenuFijo">.*?</div>\s*</div>\s*(?=<!-- ============ INFORMES Y ESTADÍSTICAS ============ -->)'
if ($content -match $menuPattern) {
    $content = $content -replace $menuPattern, '$1<div id="vistaItemsDia">
                    <div id="itemsMenuDia">
                        <div style="color: var(--text-muted); font-style: italic; text-align: center; padding: 1rem;">
                            No hay menú configurado para hoy
                        </div>
                    </div>
                </div>
                
                <div class="grid grid-2" id="gridMenuFijo">
                    <div class="panel">
                        <div class="panel-header">🥤 Bebidas</div>
                        <div class="panel-body" id="resumenBebidasFijas">
                            <div style="color: var(--text-muted);">Sin bebidas fijas</div>
                        </div>
                    </div>
                    <div class="panel">
                        <div class="panel-header">🍟 Extras</div>
                        <div class="panel-body" id="resumenExtrasFijas">
                            <div style="color: var(--text-muted);">Sin extras fijos</div>
                        </div>
                    </div>
                </div>
$2'
}

$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Encoding UTF8
Write-Host "Menú limpiado exitosamente - Solo menú del día y fijos visibles"

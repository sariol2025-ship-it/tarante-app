# Script para reparar el problema de login
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Raw

# Buscar y reemplazar la sección de inicialización que puede estar causando problemas
$initPattern = '(?s)document\.addEventListener\('DOMContentLoaded', function\(\) \{.*?hideLoader\(\);\s*\}\);'
$replacement = 'document.addEventListener('DOMContentLoaded', function() {
            try {
                cargarTema();
                cargarDatosSistema();
                iniciarListenerSistema();
                const elLoginVer = document.getElementById('versionLogin');
                if (elLoginVer) elLoginVer.textContent = `v${APP_VERSION}`;
                const elNavVer = document.getElementById('versionNav');
                if (elNavVer) elNavVer.textContent = `v${APP_VERSION}`;
                actualizarMesas();
                actualizarMesasComandas();
                actualizarMesasCocina();
                actualizarVistaCocina();
                actualizarVistaCuentas();
                actualizarDashboard();
                actualizarVistaInformes();
                if (typeof actualizarVistaDia === 'function') actualizarVistaDia(diaSeleccionado);
                actualizarEstadoFirebase();
                setInterval(actualizarEstadoFirebase, 30000);
                hideLoader();
            } catch (error) {
                console.error('Error en inicialización:', error);
                hideLoader();
            }
        });'

if ($content -match $initPattern) {
    $content = $content -replace $initPattern, $replacement
}

# Asegurar que hideLoader() exista
if ($content -notmatch 'function hideLoader') {
    $hideLoaderFunction = 'function hideLoader() {
            const loader = document.getElementById('loader');
            if (loader) {
                loader.style.display = 'none';
            }
        }'
    
    # Insertar hideLoader antes del DOMContentLoaded
    $content = $content -replace '(?s)(document\.addEventListener\('DOMContentLoaded')', "$hideLoaderFunction`n`n$1"
}

$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Encoding UTF8
Write-Host "Login reparado - Función hideLoader agregada y manejo de errores en inicialización"

# Script simple para reparar el problema de login
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Raw

# Verificar si hideLoader existe
if ($content -notmatch 'function hideLoader') {
    # Agregar la función hideLoader antes del DOMContentLoaded
    $hideLoaderFunction = "        function hideLoader() {
            const loader = document.getElementById('loader');
            if (loader) {
                loader.style.display = 'none';
            }
        }"
    
    # Buscar el DOMContentLoaded y agregar hideLoader antes
    $domContentLoadedPos = $content.IndexOf('document.addEventListener('DOMContentLoaded'')
    if ($domContentLoadedPos -gt 0) {
        $content = $content.Substring(0, $domContentLoadedPos) + $hideLoaderFunction + "`n`n" + $content.Substring($domContentLoadedPos)
    }
}

# Reemplazar la llamada a hideLoader con un try-catch
$content = $content -replace 'hideLoader\(\);', 'try { hideLoader(); } catch(e) { console.error("Error hideLoader:", e); const loader = document.getElementById("loader"); if (loader) loader.style.display = "none"; }'

$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Encoding UTF8
Write-Host "Login reparado - hideLoader agregado con manejo de errores"

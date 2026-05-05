# Script para agregar la función hideLoader
$content = Get-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Raw

# Agregar la función hideLoader al final del archivo, antes del cierre de </script>
$hideLoaderFunction = "
        // Función para ocultar el loader
        function hideLoader() {
            const loader = document.getElementById('loader');
            if (loader) {
                loader.style.display = 'none';
            }
        }"

# Buscar el cierre del </script> y agregar la función antes
$closingScriptPos = $content.LastIndexOf('</script>')
if ($closingScriptPos -gt 0) {
    $content = $content.Substring(0, $closingScriptPos) + $hideLoaderFunction + "`n    </script>" + $content.Substring($closingScriptPos + 9)
}

$content | Set-Content "C:\Users\usuario\Documents\trae_projects\tarante-app-remote\index.html" -Encoding UTF8
Write-Host "Función hideLoader agregada correctamente"

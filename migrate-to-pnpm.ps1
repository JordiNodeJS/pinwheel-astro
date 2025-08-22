# Script de migración a PNPM para Pinwheel Astro (Windows PowerShell)
Write-Host "🚀 Migrando proyecto a PNPM..." -ForegroundColor Green

# Verificar si pnpm está instalado
try {
    $pnpmVersion = pnpm --version
    Write-Host "✅ PNPM está instalado: $pnpmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ PNPM no está instalado. Instalando..." -ForegroundColor Yellow
    npm install -g pnpm
}

# Eliminar archivos de otros gestores de paquetes
Write-Host "🧹 Limpiando archivos de otros gestores..." -ForegroundColor Yellow
if (Test-Path "yarn.lock") { Remove-Item "yarn.lock" -Force }
if (Test-Path "package-lock.json") { Remove-Item "package-lock.json" -Force }
if (Test-Path "node_modules") { Remove-Item "node_modules" -Recurse -Force }

# Instalar dependencias con pnpm
Write-Host "📦 Instalando dependencias con PNPM..." -ForegroundColor Yellow
pnpm install

Write-Host "✅ Migración completada!" -ForegroundColor Green
Write-Host "🎉 Ahora puedes usar PNPM para gestionar tu proyecto:" -ForegroundColor Cyan
Write-Host "   - pnpm dev     # Desarrollo" -ForegroundColor White
Write-Host "   - pnpm build   # Construir" -ForegroundColor White
Write-Host "   - pnpm add     # Agregar dependencias" -ForegroundColor White
Write-Host ""
Write-Host "📚 Consulta PNPM_SETUP.md para más información" -ForegroundColor Cyan

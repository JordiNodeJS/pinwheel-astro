#!/bin/bash

# Script de migración a PNPM para Pinwheel Astro
echo "🚀 Migrando proyecto a PNPM..."

# Verificar si pnpm está instalado
if ! command -v pnpm &> /dev/null; then
    echo "❌ PNPM no está instalado. Instalando..."
    npm install -g pnpm
fi

echo "✅ PNPM está instalado: $(pnpm --version)"

# Eliminar archivos de otros gestores de paquetes
echo "🧹 Limpiando archivos de otros gestores..."
rm -f yarn.lock
rm -f package-lock.json
rm -rf node_modules

# Instalar dependencias con pnpm
echo "📦 Instalando dependencias con PNPM..."
pnpm install

echo "✅ Migración completada!"
echo "🎉 Ahora puedes usar PNPM para gestionar tu proyecto:"
echo "   - pnpm dev     # Desarrollo"
echo "   - pnpm build   # Construir"
echo "   - pnpm add     # Agregar dependencias"
echo ""
echo "📚 Consulta PNPM_SETUP.md para más información"

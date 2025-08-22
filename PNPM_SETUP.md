# Configuración de PNPM para Pinwheel Astro

Este proyecto ha sido configurado para usar **pnpm** como gestor de paquetes.

## ¿Por qué PNPM?

- **Más rápido**: Instalación y actualización de dependencias más rápida
- **Eficiente en espacio**: Almacena paquetes de forma más eficiente
- **Mejor gestión de dependencias**: Mejor resolución de dependencias y menos duplicados
- **Compatibilidad**: Compatible con npm y yarn

## Instalación de PNPM

Si no tienes pnpm instalado, puedes instalarlo globalmente:

```bash
npm install -g pnpm
```

## Comandos básicos

### Instalar dependencias
```bash
pnpm install
```

### Agregar una dependencia
```bash
pnpm add [paquete]
```

### Agregar una dependencia de desarrollo
```bash
pnpm add -D [paquete]
```

### Ejecutar scripts
```bash
pnpm dev          # Desarrollo
pnpm build        # Construir
pnpm preview      # Vista previa
pnpm check        # Verificar
pnpm format       # Formatear código
```

### Actualizar dependencias
```bash
pnpm update
```

### Eliminar dependencias
```bash
pnpm remove [paquete]
```

## Archivos de configuración

- `.npmrc`: Configuraciones específicas de pnpm
- `pnpm-workspace.yaml`: Configuración del workspace
- `pnpm-lock.yaml`: Archivo de bloqueo (se genera automáticamente)

## Migración desde Yarn

Si venías usando yarn, simplemente:

1. Elimina `yarn.lock` (si existe)
2. Elimina `node_modules/`
3. Ejecuta `pnpm install`

## Compatibilidad

Este proyecto mantiene compatibilidad total con:
- Astro 5.x
- React 19.x
- Tailwind CSS 4.x
- TypeScript 5.x

## Solución de problemas

### Error de permisos
```bash
pnpm config set store-dir ~/.pnpm-store
```

### Limpiar cache
```bash
pnpm store prune
```

### Verificar instalación
```bash
pnpm --version
```

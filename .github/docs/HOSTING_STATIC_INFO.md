# Información de Hosting Estático - Pinwheel Astro

## **Este proyecto es completamente estático y puede subirse a servicios de hosting estático básicos como Hostinger**

### **Razones principales:**

1. **Configuración por defecto de Astro**: El proyecto usa la configuración estándar de Astro que genera HTML estático en el build.

2. **No hay configuración de SSR**: En `astro.config.mjs` no hay configuraciones como `output: 'server'` o `adapter` que indiquen renderizado en servidor.

3. **Componentes React se hidratan en cliente**: Los componentes interactivos usan directivas como `client:load`, `client:visible`, etc., que se renderizan estáticamente y luego se hidratan en el navegador.

4. **Contenido estático**: Todo el contenido viene de archivos Markdown/MDX que se procesan en build time, no en runtime.

5. **Configuración para hosting estático**: El `netlify.toml` está configurado para publicar desde la carpeta `dist` (build estático).

### **Lo que sucede en el build:**

- **Astro** procesa todos los archivos `.astro`, `.mdx` y componentes React
- **Genera HTML estático** para cada página
- **Los componentes React** se convierten en HTML estático + JavaScript para hidratación
- **Todo se optimiza** y se coloca en la carpeta `dist`

### **Para subir a Hostinger:**

1. Ejecuta `pnpm build` (o `npm run build`)
2. Sube todo el contenido de la carpeta `dist` a tu hosting
3. Funcionará perfectamente sin necesidad de Node.js en el servidor

### **Componentes que usan hidratación en cliente:**

- `client:load` - Para interacción inmediata
- `client:visible` - Para componentes que pueden esperar a entrar en viewport
- `client:idle` - Para componentes que pueden diferirse

### **Conclusión**: 

Es un sitio web completamente estático que puede funcionar en cualquier hosting básico, incluyendo los planes más económicos de Hostinger. No requiere servidor Node.js ni capacidades de renderizado en tiempo real.

---

**Nota**: Este documento complementa las reglas del proyecto en `AI_PROJECT_RULES.md` y proporciona información específica sobre el despliegue y hosting.

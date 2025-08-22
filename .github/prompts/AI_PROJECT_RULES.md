## Reglas del Proyecto para la AI (Cursor)

Estas reglas guían a la AI en este repositorio `pinwheel-astro` para producir código consistente, seguro y alineado con Astro 5, Tailwind CSS 4 y el stack actual. Mantén estas prácticas en cada cambio.

### Stack y versiones
- **Astro**: 5.x (vite 7) con integraciones `@astrojs/react`, `@astrojs/mdx`, `@astrojs/sitemap` y `astro-auto-import`.
- **UI**: Tailwind CSS 4 con plugin `@tailwindcss/vite`.
- **Tipado**: TypeScript estricto (`extends: astro/tsconfigs/strict`).
- **Contenido**: `astro:content` v5 (Zod), colecciones en `src/content` y esquema en `src/content.config.ts`.
- **Fuentes**: `astro-font`.
- **GTM**: `@digi4care/astro-google-tagmanager` controlado por `src/config/config.json`.

### Estructura y rutas
- Respeta la estructura actual: `src/pages`, `src/layouts`, `src/layouts/components`, `src/layouts/partials`, `src/lib`, `src/styles`, `src/content`.
- Usa alias de `tsconfig.json`:
  - `@/components/*` → `src/layouts/components/*`
  - `@/shortcodes/*` → `src/layouts/shortcodes/*`
  - `@/partials/*` → `src/layouts/partials/*`
  - `@/*` → `src/*`
- No cambies la convención de contenido `-index.md(x)` para páginas índice de colección.

### Convenciones de código
- **Nombres explícitos** para funciones y variables; evita abreviaturas. Prioriza legibilidad.
- **TypeScript estricto**: evita `any`, usa tipos y `CollectionEntry<"collection">` al trabajar con contenido.
- **Props en .astro**: tipa props con `interface Props` y desestructura desde `Astro.props` con valores por defecto.
- **No re-formatees** código ajeno. Mantén estilo y sangrías existentes.
- **Utilidades existentes**: usa `plainify`, `markdownify`, `readingTime`, `taxonomyFilter`, etc., antes de crear nuevas.

### Astro e islas
- Astro renderiza HTML por defecto. Usa islas sólo cuando se requiera interactividad.
- Para componentes React, añade directivas `client:*` apropiadas:
  - `client:load` para interacción inmediata.
  - `client:idle` si es diferible.
  - `client:visible` si puede esperar a entrar en viewport.
- Considera `server:defer` para contenido dinámico no bloqueante en el servidor.
- En MDX, puedes usar componentes UI; respeta las reglas de `@astrojs/mdx`.
- No dupliques auto-imports: `astro-auto-import` ya expone shortcodes listados en `astro.config.mjs`.

### Contenido y colecciones (`astro:content`)
- Agrega/edita esquemas en `src/content.config.ts` usando `z.object`.
- Para leer contenido, usa APIs tipadas como `getEntry`/`getCollection`. Ejemplo:
  ```ts
  import type { CollectionEntry } from "astro:content";
  const entry = (await getEntry("blog", "post-1")) as CollectionEntry<"blog">;
  ```
- Mantén coherencia de campos según el esquema. No introduzcas campos no tipados.

### Páginas, layouts y metadatos
- Usa `src/layouts/Base.astro` como envoltorio de páginas. Pasa `title`, `meta_title`, `description`, `image`, `noindex`, `canonical` cuando sea necesario. Si no, se usarán valores por defecto desde `src/config/config.json`.
- No inyectes manualmente GTM; respétalo vía `config.google_tag_manager`.
- Usa `ClientRouter` sólo si la página requiere transiciones del paquete `astro:transitions`.

### Imágenes, fuentes y assets
- Usa `astro:assets` (`<Image />`) para imágenes procesables. Para archivos en `public/`, enlaza rutas absolutas desde `/`.
- Define y carga fuentes con `AstroFont` (ya aplicado en `Base.astro`). No añadas `<link>` manuales a Google Fonts.

### Tailwind CSS
- Usa utilidades de Tailwind 4; evita estilos inline salvo necesidad.
- Reutiliza clases y componentes utilitarios existentes (`src/styles/*`). No introduzcas frameworks CSS extra.
- Mantén accesibilidad: estados focus visibles, contraste suficiente, semántica HTML.

### Accesibilidad y SEO
- Usa etiquetas semánticas y atributos `aria-*` cuando aplique.
- Mantén títulos jerárquicos y `alt` descriptivo en imágenes.
- Conserva y completa metadatos OG/Twitter via `Base.astro`.

### Rendimiento
- Prefiere islas pequeñas y diferidas; evita hidratar toda la página.
- Evita dependencias pesadas en el cliente. Mueve lógica al servidor cuando sea posible.
- Reaprovecha utilidades y evita trabajo duplicado.

### Configuración y parámetros
- Centraliza cambios en `src/config/*.json` y evita constantes dispersas.
- Si añades nuevas opciones de configuración, documenta su uso y valores por defecto.

### Estándares de commit y PR
- Mensajes de commit: inglés, estilo Conventional Commits (ej.: `feat: add careers filter by location`).
- Antes de abrir PR:
  - Ejecuta `pnpm check` y `pnpm build` si cambiaste código.
  - Ejecuta `pnpm format`.
  - Verifica rutas y alias válidos, y ausencia de `any` no justificado.

### Instrucciones específicas para Cursor
- Siempre habla en español en los comentarios y descripciones; commits en inglés.
- Al crear/editar código:
  - Usa imports con alias `@/...`.
  - Añade tipos explícitos a props y funciones exportadas.
  - No reordenas imports ni re-formateas más allá del cambio necesario.
  - Reutiliza layouts/componentes existentes antes de crear nuevos.
  - Usa `apply` de Tailwind y variables CSS sólo si ya están presentes en `src/styles`.
- Al crear contenido:
  - Sigue el patrón de archivos y campos del esquema.
  - Evita añadir frontmatter no tipado.

### Antipatrones (evitar)
- Hidratar componentes sin necesidad (`client:*` por defecto).
- Añadir `any` o suprimir errores de tipo sin explicación.
- Importar rutas relativas largas en vez de alias.
- Inyectar scripts de terceros fuera del control de `config.json`.
- Duplicar utilidades existentes.

### Referencias rápidas
- Dev: `pnpm dev`
- Type-check: `pnpm check`
- Build: `pnpm build`
- Formato: `pnpm format`

Mantén estas reglas como fuente de verdad para nuevas contribuciones y automatizaciones de la AI.



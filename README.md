# Plantilla de Apuntes Universitarios (`apuntes.cls`)

Clase de LaTeX personalizada para apuntes, manuales técnicos y guías académicas universitarias. Diseñada para mantener un formato tipográfico riguroso, elegante y modular, permitiendo **reutilizarla en cualquier asignatura** y **cambiar la paleta visual al instante**.

---

## 🚀 Inicio Rápido

Para un nuevo documento o asignatura, simplemente crea un archivo `.tex` con la siguiente estructura:

```latex
\documentclass[11pt,a4paper,oneside,blue]{apuntes}

% --- Metadatos de la asignatura ---
\title{Nombre de la Asignatura}
\subtitle{Manual Teórico-Práctico}
\degree{Grado en Ingeniería del Software}
\author{Tu Nombre}
\university{Universidad Rey Juan Carlos (URJC)}
\academicdate{Curso Académico 2024--2025}
\docversion{1.0}

\begin{document}

\makecover
\tableofcontents
\newpage

\chapter{Introducción}
...
\end{document}
```

---

## 🎨 Cambio Rápido de Apariencia (Temas de Color)

Puedes cambiar la apariencia de todo el documento modificando la opción de clase:

```latex
\documentclass[emerald]{apuntes}
```

O en cualquier momento en el preámbulo con `\settheme{...}`:

| Opción de Tema | Estilo Visual | Colores Principales | Ideal Para |
|---|---|---|---|
| `blue` *(por defecto)* | Azul institucional / Marino / Cian | Primary `#143462`, Secondary `#0E7490`, Accent `#D97706` | Fundamentos Web, Redes, Cloud |
| `emerald` o `green` | Verde pino profundo / Teal / Fuego | Primary `#134E4A`, Secondary `#0D9488`, Accent `#EA580C` | Algoritmos, Estructuras de Datos, IA |
| `purple` o `violet` | Púrpura real / Violeta vibrante | Primary `#4C1D95`, Secondary `#6D28D9`, Accent `#D97706` | Matemáticas, Lógica, Seguridad |
| `red` o `crimson` | Burdeos vino / Rubí / Dorado | Primary `#881337`, Secondary `#BE123C`, Accent `#CA8A04` | Sistemas Operativos, Hardware, Concurrencia |
| `amber` o `orange` | Ámbar tierra oscuro / Cobre / Cian | Primary `#78350F`, Secondary `#B45309`, Accent `#0E7490` | Bases de Datos, Minería de Datos |
| `slate` o `nord` | Gris pizarra oscuro / Pizarra medio / Cielo | Primary `#1E293B`, Secondary `#475569`, Accent `#0284C7` | Diseño Minimalista, Interfaces (UI/UX) |

### Colores personalizados
Si deseas usar colores a medida para una asignatura específica:
```latex
\definecolor{primary}{RGB}{35, 78, 120}
\definecolor{secondary}{RGB}{50, 130, 180}
\definecolor{accent}{RGB}{220, 100, 30}
```

---

## 📦 Componentes y Entornos Incluidos

La clase ya incluye y estiliza automáticamente:

1. **Cajas de texto (`tcolorbox`)**:
   - `\begin{definicion}{Título}...` (Conceptos clave)
   - `\begin{importante}{Título}...` (Alertas y advertencias de ingeniería)
   - `\begin{ejemplo}{Título}...` (Ejemplos práctico de código/arquitectura)
   - `\begin{historia}{Título}...` (Contexto histórico y evolución)
   - `\begin{ejercicioresuelto}{Título}...` (Ejercicios resueltos y casos prácticos)
2. **Bloques de código (`listings`)**:
   - Soporte preconfigurado para `json`, `css`, `javascript`, etc., con resaltado de sintaxis, bordes redondeados y caracteres UTF-8 en español (tildes, eñes).
3. **Encabezados y pies de página (`fancyhdr`)**:
   - Título de la asignatura a la izquierda, sección actual truncada a la derecha, número de página y reglas de color coordinadas con el tema.
4. **Portada profesional (`\makecover`)**:
   - Totalmente automática a partir de los metadatos declarados en el preámbulo.

---

## 🔄 Cómo Reutilizar `apuntes.cls` en Otros Apuntes

Para usar la misma clase en tus demás asignaturas tienes dos opciones:

1. **Opción Directa (Copiar y pegar)**:
   Copia el archivo `apuntes.cls` a la carpeta raíz de cualquier otro proyecto de apuntes.
2. **Opción Global (Disponible en todo tu sistema)**:
   Si usas MiKTeX o TeX Live en Windows, puedes colocar `apuntes.cls` en tu árbol local `texmf`:
   - MiKTeX: `C:\Users\<Usuario>\AppData\Local\Programs\MiKTeX\tex\latex\apuntes\apuntes.cls` (y luego ejecutar *Refresh FNDB* en MiKTeX Console).
   - TeX Live: `C:\texlive\texmf-local\tex\latex\apuntes\apuntes.cls` (y luego ejecutar `texhash` en la terminal).
   De esta forma, cualquier `.tex` de cualquier carpeta reconocerá `\documentclass{apuntes}` sin tener que copiar el archivo.

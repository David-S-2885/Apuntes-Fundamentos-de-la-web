% ==============================================================================
% apuntes.cls - Clase LaTeX para apuntes, manuales y guías académicas
% Diseñado para reutilización entre asignaturas con cambio rápido de apariencia
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{apuntes}[2026/11/09 v1.0 Clase para apuntes y manuales academicos]

% --- Opciones de tema de color ---
\newcommand{\apuntes@theme}{blue}
\DeclareOption{blue}{\renewcommand{\apuntes@theme}{blue}}
\DeclareOption{emerald}{\renewcommand{\apuntes@theme}{emerald}}
\DeclareOption{green}{\renewcommand{\apuntes@theme}{emerald}}
\DeclareOption{purple}{\renewcommand{\apuntes@theme}{purple}}
\DeclareOption{violet}{\renewcommand{\apuntes@theme}{purple}}
\DeclareOption{red}{\renewcommand{\apuntes@theme}{red}}
\DeclareOption{crimson}{\renewcommand{\apuntes@theme}{red}}
\DeclareOption{amber}{\renewcommand{\apuntes@theme}{amber}}
\DeclareOption{orange}{\renewcommand{\apuntes@theme}{amber}}
\DeclareOption{slate}{\renewcommand{\apuntes@theme}{slate}}
\DeclareOption{nord}{\renewcommand{\apuntes@theme}{slate}}

% Pasar cualquier otra opción a la clase base report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

% Cargar la clase base (por defecto estilo report)
\LoadClass{report}

% ==============================================================================
% PAQUETES BÁSICOS
% ==============================================================================
% Idioma y codificación
\RequirePackage[spanish,es-tabla,es-noquoting]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

% Geometría y espaciado de página
\RequirePackage[
  top=2.8cm,
  bottom=2.5cm,
  left=2.6cm,
  right=2.6cm,
  headheight=25pt,
  headsep=16pt,
  footskip=30pt
]{geometry}
\RequirePackage{parskip}

% Gráficos y color
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta, positioning, calc, backgrounds, fit}

% Tipografía y maquetación
\RequirePackage{microtype}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage[breakall]{truncate}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{enumitem}
\RequirePackage{listings}
\RequirePackage{amssymb}
\RequirePackage[most]{tcolorbox}
\RequirePackage{hyperref}

% ==============================================================================
% SISTEMA DE TEMAS Y PALETA DE COLORES
% ==============================================================================
% Colores comunes fijos (código, fondo, estados de alerta)
\definecolor{textdark}{RGB}{30, 41, 59}      % Gris pizarra oscuro (#1E293B)
\definecolor{bglight}{RGB}{248, 250, 252}    % Gris azulado suave (#F8FAFC)
\definecolor{bgcode}{RGB}{245, 247, 250}     % Fondo para bloques de código
\definecolor{bordergray}{RGB}{226, 232, 240} % Borde sutil (#E2E8F0)
\definecolor{alertred}{RGB}{185, 28, 28}     % Rojo alerta (#B91C1C)
\definecolor{alertgreen}{RGB}{21, 128, 61}   % Verde éxito (#15803D)
\definecolor{kwpurple}{RGB}{126, 34, 206}    % Púrpura palabras clave (#7E22CE)
\definecolor{strgreen}{RGB}{22, 101, 52}     % Verde strings
\definecolor{commentgray}{RGB}{100, 116, 139}% Gris comentarios

% Comando para aplicar temas de color predefinidos
\newcommand{\settheme}[1]{%
  \def\apuntes@selected{#1}%
  % Tema Blue (Por defecto - Azul institucional / Marino / Cian)
  \ifx\apuntes@selected\string blue
    \definecolor{primary}{RGB}{20, 52, 98}       % Azul marino institucional (#143462)
    \definecolor{secondary}{RGB}{14, 116, 144}   % Azul verdoso / Cian (#0E7490)
    \definecolor{accent}{RGB}{217, 119, 6}       % Ámbar / Dorado (#D97706)
  \fi
  % Tema Emerald (Verde bosque / Teal / Naranja cálido)
  \ifx\apuntes@selected\string emerald
    \definecolor{primary}{RGB}{19, 78, 74}       % Verde pino profundo (#134E4A)
    \definecolor{secondary}{RGB}{13, 148, 136}   % Verde azulado teal (#0D9488)
    \definecolor{accent}{RGB}{234, 88, 12}       % Naranja fuego (#EA580C)
  \fi
  % Tema Purple (Púrpura real / Violeta / Dorado)
  \ifx\apuntes@selected\string purple
    \definecolor{primary}{RGB}{76, 29, 149}      % Púrpura real oscuro (#4C1D95)
    \definecolor{secondary}{RGB}{109, 40, 217}   % Violeta vibrante (#6D28D9)
    \definecolor{accent}{RGB}{217, 119, 6}       % Ámbar dorado (#D97706)
  \fi
  % Tema Red (Burdeos / Carmesí / Oro viejo)
  \ifx\apuntes@selected\string red
    \definecolor{primary}{RGB}{136, 19, 55}      % Burdeos profundo (#881337)
    \definecolor{secondary}{RGB}{190, 18, 60}    % Rubí carmesí (#BE123C)
    \definecolor{accent}{RGB}{202, 138, 4}       % Oro viejo (#CA8A04)
  \fi
  % Tema Amber (Tierra / Ámbar oscuro / Azul contraste)
  \ifx\apuntes@selected\string amber
    \definecolor{primary}{RGB}{120, 53, 15}      % Ámbar tierra oscuro (#78350F)
    \definecolor{secondary}{RGB}{180, 83, 9}     % Cobre (#B45309)
    \definecolor{accent}{RGB}{14, 116, 144}      % Azul cian (#0E7490)
  \fi
  % Tema Slate (Nord / Pizarra minimalista / Azul glaciar)
  \ifx\apuntes@selected\string slate
    \definecolor{primary}{RGB}{30, 41, 59}       % Pizarra oscuro (#1E293B)
    \definecolor{secondary}{RGB}{71, 85, 105}    % Pizarra medio (#475569)
    \definecolor{accent}{RGB}{2, 132, 199}       % Azul cielo (#0284C7)
  \fi
}

% Aplicar tema seleccionado por opción
\settheme{\apuntes@theme}

% Comandos para sobrescribir colores individualmente de forma rápida
\newcommand{\setprimarycolor}[1]{\definecolor{primary}{#1}}
\newcommand{\setsecondarycolor}[1]{\definecolor{secondary}{#1}}
\newcommand{\setaccentcolor}[1]{\definecolor{accent}{#1}}

% ==============================================================================
% METADATOS DEL DOCUMENTO
% ==============================================================================
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\docadvisor}[1]{\def\@docadvisor{#1}}
\newcommand{\advisor}[1]{\def\@docadvisor{#1}}
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\academicdate}[1]{\def\@academicdate{#1}}
\newcommand{\docversion}[1]{\def\@docversion{#1}}
\newcommand{\docstatus}[1]{\def\@docstatus{#1}}
\newcommand{\doclicense}[1]{\def\@doclicense{#1}}
\newcommand{\shorttitle}[1]{\def\@shorttitle{#1}}
\newcommand{\subject}[1]{\def\@subject{#1}\def\@shorttitle{#1}}

% Valores por defecto
\def\@subtitle{}
\def\@degree{}
\def\@docadvisor{}
\def\@university{}
\def\@academicdate{}
\def\@docversion{1.0}
\def\@docstatus{Completo y Revisado}
\def\@doclicense{CC BY-SA 4.0}
\def\@shorttitle{\@title}
\def\@subject{\@title}

% ==============================================================================
% CONFIGURACIÓN DE HIPERVÍNCULOS (HYPERREF)
% ==============================================================================
\hypersetup{
  colorlinks=true,
  linkcolor=primary,
  citecolor=secondary,
  filecolor=secondary,
  urlcolor=secondary,
  pdfstartview={FitH}
}

% Actualizar metadatos PDF automáticamente al iniciar el documento
\AtBeginDocument{
  \hypersetup{
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfsubject={\@subject}
  }
}

% ==============================================================================
% ENCABEZADOS Y PIES DE PÁGINA (FANCYHDR)
% ==============================================================================
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{\thechapter.\ #1}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhead[L]{\textcolor{primary}{\bfseries\small \@shorttitle}}
\fancyhead[R]{\textcolor{secondary}{\small\truncate{0.55\textwidth}{\nouppercase{\rightmark}}}}
\fancyfoot[C]{\textcolor{commentgray}{\small Página \thepage}}
\renewcommand{\headrulewidth}{0.8pt}
\renewcommand{\footrulewidth}{0.4pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{secondary}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrule}{\hbox to\headwidth{\color{bordergray}\leaders\hrule height \footrulewidth\hfill}}

% Estilo para páginas iniciales de capítulo
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\textcolor{commentgray}{\small Página \thepage}}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% ==============================================================================
% FORMATO DE TÍTULOS (TITLESEC)
% ==============================================================================
\titleformat{\chapter}[display]
  {\normalfont\bfseries\color{primary}}
  {\filleft\textcolor{secondary}{\fontsize{36}{40}\selectfont CAPÍTULO \thechapter}}
  {1ex}
  {\titlerule[2pt]\vspace{1.5ex}\Huge\raggedright}
  [\vspace{1ex}{\color{secondary}\titlerule[1pt]}]

\titleformat{\section}
  {\normalfont\Large\bfseries\color{primary}}
  {\thesection}{1em}{}[\vspace{0.2ex}{\color{secondary}\titlerule[0.5pt]}]

\titleformat{\subsection}
  {\normalfont\large\bfseries\color{secondary}}
  {\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries\color{textdark}}
  {\thesubsubsection}{1em}{}

% ==============================================================================
% CAJAS DE INFORMACIÓN (TCOLORBOX)
% ==============================================================================
\newtcolorbox{definicion}[2][]{
  enhanced,
  breakable,
  colback=bglight,
  colframe=primary,
  arc=3mm,
  boxrule=0.8pt,
  leftrule=4.5pt,
  fonttitle=\bfseries\color{primary},
  title={$\blacktriangleright$ Concepto Clave: #2},
  attach title to upper=\par\vspace{0.4em},
  #1
}

\newtcolorbox{importante}[2][]{
  enhanced,
  breakable,
  colback=red!3!bglight,
  colframe=alertred,
  arc=3mm,
  boxrule=0.8pt,
  leftrule=4.5pt,
  fonttitle=\bfseries\color{alertred},
  title={$\blacktriangle$ ¡Atención / Ingeniería!: #2},
  attach title to upper=\par\vspace{0.4em},
  #1
}

\newtcolorbox{ejemplo}[2][]{
  enhanced,
  breakable,
  colback=green!3!bglight,
  colframe=alertgreen,
  arc=3mm,
  boxrule=0.8pt,
  leftrule=4.5pt,
  fonttitle=\bfseries\color{alertgreen},
  title={$\checkmark$ Ejemplo Práctico: #2},
  attach title to upper=\par\vspace{0.4em},
  #1
}

\newtcolorbox{historia}[2][]{
  enhanced,
  breakable,
  colback=accent!4!bglight,
  colframe=accent,
  arc=3mm,
  boxrule=0.8pt,
  leftrule=4.5pt,
  fonttitle=\bfseries\color{accent},
  title={$\circ$ Contexto Histórico \& Evolución: #2},
  attach title to upper=\par\vspace{0.4em},
  #1
}

\newtcolorbox{ejercicioresuelto}[2][]{
  enhanced,
  breakable,
  colback=secondary!4!bglight,
  colframe=secondary,
  arc=3mm,
  boxrule=0.8pt,
  leftrule=4.5pt,
  fonttitle=\bfseries\color{secondary},
  title={$\bigstar$ Ejercicio Resuelto: #2},
  attach title to upper=\par\vspace{0.4em},
  #1
}

% ==============================================================================
% CONFIGURACIÓN DE LISTINGS PARA CÓDIGO FUENTE
% ==============================================================================
\lstset{
  backgroundcolor=\color{bgcode},
  basicstyle=\ttfamily\footnotesize\color{textdark},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  commentstyle=\color{commentgray}\itshape,
  keepspaces=true,
  keywordstyle=\color{kwpurple}\bfseries,
  stringstyle=\color{strgreen},
  numberstyle=\tiny\color{commentgray},
  numbers=left,
  numbersep=8pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2,
  frame=single,
  rulecolor=\color{bordergray},
  frameround=tttt,
  xleftmargin=12pt,
  framexleftmargin=8pt,
  inputencoding=utf8,
  extendedchars=true,
  literate=
    {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
    {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
    {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
    {ü}{{\"u}}1 {Ü}{{\"U}}1
    {ñ}{{\~n}}1 {Ñ}{{\~N}}1 {¿}{{?`}}1 {¡}{{!`}}1
    {“}{{``}}1 {”}{{''}}1 {«}{{\guillemotleft}}1 {»}{{\guillemotright}}1
}

% Definición del lenguaje JSON
\lstdefinelanguage{json}{
  basicstyle=\ttfamily\footnotesize\color{textdark},
  stringstyle=\color{strgreen},
  numbers=left,
  numberstyle=\tiny\color{commentgray},
  stepnumber=1,
  numbersep=8pt,
  showstringspaces=false,
  breaklines=true,
  frame=single,
  backgroundcolor=\color{bgcode},
  literate=
    {:}{{{\color{primary}{:}}}}{1}
    {,}{{{\color{primary}{,}}}}{1}
    {\{}{{{\color{accent}{\{}}}}{1}
    {\}}{{{\color{accent}{\}}}}}{1}
    {[}{{{\color{accent}{[}}}}{1}
    {]}{{{\color{accent}{]}}}}{1}
    {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
    {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
    {ü}{{\"u}}1 {Ü}{{\"U}}1
    {ñ}{{\~n}}1 {Ñ}{{\~N}}1
}

% Definición de estilo para CSS
\lstdefinelanguage{css}{
  keywords={color,background,margin,padding,font,weight,display,flex,grid,width,height,top,left,right,bottom,position,border,radius,justify,align,items,content,box,sizing,direction,wrap},
  sensitive=true,
  morecomment=[s]{/*}{*/},
  morestring=[b]",
  morestring=[b]'
}

% Definición de estilo para JavaScript / Node.js
\lstdefinelanguage{javascript}{
  keywords={abstract, any, as, async, await, boolean, break, case, catch, class, const, constructor, continue, debugger, declare, default, delete, do, else, enum, export, extends, false, finally, for, from, function, get, if, implements, import, in, instanceof, interface, let, module, new, null, number, of, package, private, protected, public, readonly, require, return, set, static, string, super, switch, symbol, this, throw, true, try, type, typeof, undefined, var, void, while, with, yield},
  sensitive=true,
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]",
  morestring=[b]`
}

% ==============================================================================
% PORTADA PROFESIONAL REUTILIZABLE (\makecover o \maketitle)
% ==============================================================================
\newcommand{\makecover}{
  \begin{titlepage}
    \centering
    \vspace*{1.5cm}
    
    \ifx\@degree\@empty\else
      {\scshape\Large \@degree \par}
      \vspace{0.8cm}
    \fi
    
    \rule{\linewidth}{1.5pt}\\[0.4cm]
    {\Huge \bfseries \color{primary} \@title \par}
    \ifx\@subtitle\@empty\else
      \vspace{0.3cm}
      {\large \bfseries \color{secondary} \@subtitle \par}
    \fi
    \rule{\linewidth}{1.5pt}
    
    \vspace{2cm}
    
    \begin{tcolorbox}[
      enhanced,
      colback=bglight,
      colframe=secondary,
      arc=4mm,
      width=0.9\linewidth,
      boxrule=1pt,
      center
    ]
      \centering
      \vspace{0.3cm}
      {\large\textbf{Autor:}}\\[0.2cm]
      {\Large \color{primary} \@author}\\[0.4cm]
      \ifx\@docadvisor\@empty\else
        {\small \@docadvisor}\\[0.2cm]
      \fi
      \ifx\@university\@empty\else
        {\footnotesize \@university \ifx\@academicdate\@empty\else \ | \@academicdate\fi}
      \fi
      \vspace{0.3cm}
    \end{tcolorbox}
    
    \vfill
    
    \begin{minipage}{0.48\textwidth}
      \flushleft
      \textbf{Versión del documento:} \@docversion\\
      \textbf{Compilado:} \today
    \end{minipage}
    \hfill
    \begin{minipage}{0.48\textwidth}
      \flushright
      \textbf{Estado:} \@docstatus\\
      \textbf{Licencia:} \@doclicense
    \end{minipage}
    
    \vspace{1cm}
  \end{titlepage}
}

\renewcommand{\maketitle}{\makecover}

\endinput


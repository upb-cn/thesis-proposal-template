\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{upb-cn}[13.04.2023] 

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

% page setup
\RequirePackage[left=1in,right=1in,top=0in,bottom=1in,includehead, headheight=1in]{geometry}
\setlength{\skip\footins}{16pt plus 5pt minus 2pt}

\RequirePackage{ifthen}
\RequirePackage{kvoptions}
\RequirePackage{xparse}
\RequirePackage{marginnote}
\RequirePackage{booktabs}

% set fonts
\RequirePackage{libertine}
\renewcommand\ttdefault{cmtt}
\renewcommand{\ttfamily}{\fontfamily{cmtt}\small\selectfont}
\RequirePackage{libertinust1math}
\RequirePackage[T1]{fontenc}

% use biblatex
\RequirePackage[maxnames=999,minnames=999]{biblatex}

% define colors
\RequirePackage{graphicx,xcolor}
\definecolor{UPBUltraBlue}{RGB}{26,34,164}
\definecolor{UPBArcticBlue}{RGB}{118,206,208}
\definecolor{UPBOceanBlue}{RGB}{81,165,197}
\definecolor{UPBSkyBlue}{RGB}{52,115,190}
\definecolor{UPBSapphireBlue}{RGB}{24,28,98}
\definecolor{UPBIrisViolet}{RGB}{126,63,168}
\definecolor{UPBFuchsiaRed}{RGB}{193,56,160}
\newcommand{\headlinecolor}{\color{UPBUltraBlue}}


% set hyperlink style
\RequirePackage{hyperref}
\urlstyle{tt}
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=black,
    citecolor=black,
    anchorcolor=black, 
    menucolor=black,
    runcolor=black,
    urlcolor=UPBUltraBlue
}

% set header and footer
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\pagestyle{fancy}

\def\lheader#1{\def\@lheader{#1}}
\def\rheader#1{\def\@rheader{#1}}

\lhead{
    \ifthenelse{\value{page}=1}{
        \includegraphics[height=42pt]{./graphics/upb-logo}
    }
    {
        \@lheader
    }
}
\chead{}
\rhead{
    \ifthenelse{\value{page}=1}{
    }
    {
        \@rheader
    }
}
\lfoot{}
\cfoot{}
\rfoot{{\sf\normalsize\thepage/\pageref{LastPage}}}

% title style
\renewcommand{\maketitle}{
    {\headlinecolor\Large\sf\bfseries\noindent\@title \bigskip \\
    \color{black}\large\bfseries\@author
    \bigskip}
}

% basic document format
\linespread{1.1}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5\baselineskip plus 2pt}

\renewcommand{\section}{%
    \@startsection{section}{1}{0pt}{1ex plus -1ex minus -.2ex}%
    {1ex plus .2ex}{\sf\large\bfseries\headlinecolor}%
}

\renewcommand{\subsection}{%
    \@startsection{subsection}{2}{0pt}{1ex plus -1ex minus -.2ex}%
    {1ex plus .2ex}{\sf\normalsize\bfseries\color{black}}%
}

\renewcommand{\subsubsection}{%
    \@startsection{subsubsection}{3}{0pt}{1ex plus -1ex minus -.2ex}%
    {1ex plus .2ex}{\sf\small\bfseries\color{black}}%
}

% list style
\RequirePackage{enumitem}
\setlist[itemize,1]{nosep,label=\textbullet,left=1em}
\setlist[itemize,2]{nosep,label=-,left=1em}
\setlist[enumerate,1]{nosep,label=\arabic*.,left=1em}
\setlist[enumerate,2]{nosep,label=\alph*.,left=1em}

% colorbox
\RequirePackage{tcolorbox}
\newtcolorbox{notebox}[1][]
{
  sharp corners, 
  colback=gray!5!white, 
  boxrule=0.5pt,
  #1,
}

% caption style
\RequirePackage[labelsep=colon,font=normal,labelfont=bf]{caption}

% code blocks style
\RequirePackage{minted}
\RequirePackage{etoolbox}
\setminted{
    bgcolor=gray!5, 
    fontfamily=tt, 
    fontsize=\small,
    baselinestretch=1,
    curlyquotes=true,
    breaklines=true
}
\setmintedinline{
    bgcolor=gray!5, 
    fontfamily=tt, 
    fontsize=\small,
    baselinestretch=1,
    curlyquotes=true,
    breaklines=true
}
% \patchcmd{\minted@colorbg}{\medskip}{}{}{}
\patchcmd{\endminted@colorbg}{\medskip}{}{}{}

\renewcommand{\tt}[1]{\mintinline{text}{#1}}


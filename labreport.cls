%----------------------------------------------------------------------------------------
%	CLASS DEFINITION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{labreport}[2021/01/01 Lab Report Class File v1.0] % Class information printed in the log during every compilation

%\DeclareOption{OPONE}{ % Declare a class option to set a new command with the option value (used as a toggle later)
   %\newcommand{\classtoggle}{OPONE}
%}

%\DeclareOption{OPTWO}{ % Declare a class option to set a new command with the option value (used as a toggle later)
   %\newcommand{\classtoggle}{OPTWO}
%}

\ProcessOptions\relax % Process class options

\LoadClass[a4paper,12pt]{article} % Load the primary class with set options

%\@ifundefined{classtoggle} % Check that the \classtoggle has been defined, i.e. one of the two required class options above has been specified
%{\ClassError{example}{You have not used one of the required options}{You must specify one of the class options defined in the template file.}} % If one of the options has not been specified, quit with an error to that effect
{} % Otherwise do nothing

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

%\usepackage{ifthen} % Required for if statements to check the value of the \classtoggle command

%----------------------------------------------------------------------------------------
%	FURTHER DOCUMENT LAYOUT SPECIFICATIONS
%----------------------------------------------------------------------------------------

% Example of using the option passed to the class for changing the layout of the document by modifying margin sizes
%\ifthenelse{\equal{\classtoggle}{OPONE}} % If the OPONE option was passed to the class
%{\usepackage[top=1in, bottom=1in, left=1in, right=1in]{geometry}} % Define the margins as 1 inch on all sides
{} % Otherwise do nothing
%\ifthenelse{\equal{\classtoggle}{OPTWO}} % If the OPTWO option was passed to the class
%{\usepackage[top=2in, bottom=2in, left=2in, right=2in]{geometry}} % Define the margins as 2 inches on all sides
{} % Otherwise do nothing

\RequirePackage{etoolbox} % required for \AtEndPreamble

\newcommand*{\modulecode}[1]{\def\@modulecode{#1}}
\newcommand*{\modulename}[1]{\def\@modulename{#1}}
\newcommand*{\stage}[1]{\def\@stage{#1}}
\newcommand*{\major}[1]{\def\@major{#1}}
\newcommand*{\institution}[1]{\def\@institution{#1}}
\newcommand*{\studentnumber}[1]{\def\@studentnumber{#1}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\familyname}[1]{\def\@familyname{#1}}
\newcommand*{\reporttitle}[1]{\def\@reporttitle{#1}}
\newcommand*{\subtitle}[1]{\def\@subtitle{#1}}

\title{\textls[85]{\@institution\\\@modulecode\\\@modulename\\\@reporttitle\\\@subtitle}} % Title

%\author{\@firstname~\textsc{\@familyname}\\\@studentnumber} % Author name
\author{\@firstname~\@familyname\\\@studentnumber} % Author name

\RequirePackage{fancyhdr} % To edit and change page headers and page numbering
\fancypagestyle{myheadings}{ % Header and footer styles
    \setlength{\headheight}{14.5pt}
    \fancyhf{}
    \lhead{\small{\@firstname~\@familyname}}\chead{\small{\@modulecode}}\rhead{\small{\@studentnumber}}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0.4pt}
    \lfoot{\small{\@reporttitle}}\cfoot{}\rfoot{\small{\thepage}}
}

\AtEndPreamble{
\RequirePackage{csquotes}
\RequirePackage{caption} % Fixes issue with links to images. Should be put last
\RequirePackage{hyperref} % Set up PDF title and author
\hypersetup{
    pdftitle={\@modulecode~\@modulename~\@reporttitle~\@firstname~\@familyname~\@studentnumber},
    pdfauthor={\@firstname~\@familyname~\@studentnumber}
}}

\RequirePackage{siunitx} % Provides the \SI{}{} and \si{} commands for typesetting SI units
\RequirePackage{graphicx} % Required for the inclusion of images
\RequirePackage[citestyle=authoryear,bibstyle=authoryear,backend=biber,sorting=none,natbib]{biblatex} % Citing and bibliography style
\setlength\bibitemsep{1.5\itemsep} % Increases space between bibliography entries
\addbibresource{bibliography.bib} % Locates the .bib file where references are stored
\RequirePackage{mathtools} % Required for some maths elements 
\RequirePackage{float} % Allows for [H] positioning argument to precisely place figures
\RequirePackage[left=1.5in,right=1.5in,top=1.25in,bottom=1.5in]{geometry} % Sets page margins
\RequirePackage{url} % allows websites to be referenced
\RequirePackage[english]{babel} % English settings and conventions
\RequirePackage[bottom]{footmisc} % Forces footnote to bottom of page
\RequirePackage[nottoc,notlot,notlof,numbib]{tocbibind} % Puts references in table of contents
\setlength\parindent{0pt} % Removes all indentation from paragraphs
\usepackage[british,irish]{datetime2} % Edit \today date display
\DTMlangsetup[en-GB]{ord=raise}
\RequirePackage{pdfpages} % to include pdf pages \includepdf[pages={1}]{XXX.pdf}
\RequirePackage[protrusion=true,expansion=true,final]{microtype} % allows for better letter and word spacing resulting in better typesetting
\RequirePackage{booktabs} % nicer looking tables 
\frenchspacing % replaces 2 letter spacing after cross-reference abbreviation and before no. w/ 1 space
\usepackage{xfrac} % for "slanted" fractions
\usepackage{parskip}
\usepackage{fontspec, newunicodechar}
\usepackage[hungarian]{babel}
\usepackage{lmodern}
\usepackage[yyyymmdd]{datetime}
\renewcommand{\dateseparator}{.}

\newunicodechar{ű}{\H{u}}
\newunicodechar{ő}{\H{o}}

% Need to use MATLAB2TikZ %%% 
\usepackage{pgfplots}
\pgfplotsset{compat=1.17}
\usetikzlibrary{plotmarks}
\usetikzlibrary{arrows.meta}
\usepgfplotslibrary{patchplots}
\usepackage{grffile}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\usepackage[charter]{newtxmath}
%\usepackage[scaled=.9]{XCharter}

%\usepackage[T1]{fontenc}
%\usepackage{newtxtext,newtxmath}

\usepackage[notext]{stix}
\usepackage{step}
\usepackage[T1]{fontenc}

\RequirePackage{minted} % code listing package 
\setminted{ % style setup for minted 
    fontsize=\footnotesize, 
    baselinestretch=0.8, 
    linenos=true,
    autogobble,
    breaklines,
}

\renewcommand{\vec}[1]{\boldsymbol{\mathbf{#1}}}

\newcommand{\eqname}[1]{\tag*{#1}}% Tag equation with name

% use \inlinecode{LANGUAGE}{CODE SNIPPET} to display code with colour. 
\newcommand{\inlinecode}[2]{\mintinline[breaklines,fontsize=\small]{#1}{#2}} 

\newenvironment{longlisting}{\captionsetup{type=listing}}{} % allows for multipage and page-breaking of code listings
\RequirePackage[ruled,vlined]{algorithm2e} % algorithm package 

% fixes issue with cross reference to algorithm not going to the actual top of the caption
\let\old@algocf@pre@ruled\@algocf@pre@ruled
\renewcommand{\@algocf@pre@ruled}{%
  \Hy@raisedlink{\hyper@anchorstart{algocf.\thealgocf}\hyper@anchorend}%
  \old@algocf@pre@ruled}

\renewcommand\p@table{Tab.~\@} % changes how cross referenced tables are displayed
\renewcommand\p@figure{Fig.~\@} % changes how cross referenced figures are displayed
\renewcommand\p@section{Sec.~\@} % changes how cross referenced sections are displayed
\renewcommand\p@subsection{Subsec.~\@} % changes how cross referenced sub-sections are displayed
\renewcommand\p@subsubsection{Subsubsec.~\@} % changes how cross referenced sub-sections are displayed
\renewcommand\p@listing{List.~\@} % changes how cross referenced code listings are displayed
\renewcommand\p@equation{Eq.~\@} % changes how cross referenced equations are displayed
\renewcommand\p@algocf{Alg.~\@} % changes how cross referenced algorithms are displayed

\renewcommand{\thefootnote}{\alph{footnote}} % footnotes a, b, c, etc. 

\newcommand{\rbk}[1]{\left(#1\right)} % round brackets (parentheses)
\newcommand{\cbk}[1]{\left\{#1\right\}} % curly brackets {braces}
\newcommand{\sbk}[1]{\left[#1\right]} % square brackets [brackets]
\newcommand{\abs}[1]{\left|#1\right|} % absolute value |x|
\newcommand{\norm}[1]{\left\|#1\right\|} % norm ||x||
\newcommand{\fact}[1]{#1!} % factorial x!
\newcommand{\dx}{\mathrm{d}} % upright 'd' for differential
\newcommand\myeq{\mathrel{\overset{\makebox[0pt]{\mbox{\normalfont\tiny\sffamily def}}}{=}}} % use \myeq for equals sign with "def" over it 



\DeclareFieldFormat{year}{\mkbibparens{#1}} % puts year in brackets
\DeclareFieldFormat[software]{entrysubtype}{\mkbibbrackets{#1}} %puts software in square bracket
\DeclareFieldFormat[software]{version}{\mkbibparens{Version #1}} %puts software version in round bracket
\DeclareBibliographyDriver{software}{%  
    \printnames{author}%
    \newunit\newblock
    \printfield{year}%
    \newunit\newblock
    \printfield{title}%
    \setunit*{\addnbspace}
    \printfield{version}
    \printfield{entrysubtype}
    \newunit\newblock
    \printlist{location}%
    : \printlist{publisher}
    \newunit\newblock
    \printfield{url}
    \finentry
}

% For typesetting degree angles (not radians) w/ units after
\NewDocumentCommand{\angsi}{omom}{%
    \mbox{\ang[#1]{#2}\,\si[#3]{#4}}%
}

%% includewidthfigure:
%% \includescalefigure{\label{fig:XX}}{caption}{width}{filename}
%% - includes a figure with a given label, a short caption for the table of contents and a longer caption that describes the figure in some detail and a scale factor 'scale'
\newcommand{\includewidthfigure}[4]{
\begin{figure}[htpb]
\centering
\includegraphics[width=#3\linewidth]{#4}
\captionsetup{width=.8\linewidth} 
\caption{#2}#1
\end{figure}}

% Equation conditionals setup
\usepackage{array,tabularx,calc}

\newlength{\conditionwd}
\newenvironment{conditions}[1][where:]
  {%
   #1\tabularx{\textwidth-\widthof{#1}}[t]{
     >{$}r<{$} @{${}={}$} X@{}
   }%
  }
  {\endtabularx\\[\belowdisplayskip]}


% Fixes issue where only the year was a clickable link in citation 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareCiteCommand{\cite}
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \printtext[bibhyperref]{\usebibmacro{cite}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\DeclareCiteCommand*{\cite}
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \printtext[bibhyperref]{\usebibmacro{citeyear}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\DeclareCiteCommand{\parencite}[\mkbibparens]
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
    \printtext[bibhyperref]{\usebibmacro{cite}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\DeclareCiteCommand*{\parencite}[\mkbibparens]
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
    \printtext[bibhyperref]{\usebibmacro{citeyear}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\DeclareCiteCommand{\footcite}[\mkbibfootnote]
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
  \printtext[bibhyperref]{ \usebibmacro{cite}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\DeclareCiteCommand{\footcitetext}[\mkbibfootnotetext]
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}%
   \printtext[bibhyperref]{\usebibmacro{cite}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}

\DeclareCiteCommand{\textcite}
  {\boolfalse{cbx:parens}}
  {\usebibmacro{citeindex}%
   \printtext[bibhyperref]{\usebibmacro{textcite}}}
  {\ifbool{cbx:parens}
     {\bibcloseparen\global\boolfalse{cbx:parens}}
     {}%
   \multicitedelim}
  {\usebibmacro{textcite:postnote}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------

\endinput

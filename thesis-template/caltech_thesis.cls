\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{caltech_thesis}
              [2017/03/01 v0.3 Caltech thesis class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[letterpaper,12pt]{report}

\RequirePackage{etoolbox}

% Overleaf 28 Jan: Page geometry
\RequirePackage[paper=letterpaper, margin=1.25in, nohead, pdftex, top=1in,bottom=1in,left=1.5in,right=1.5in,marginparwidth=1.25in]{geometry}

%
% Define spacing for use on titlepage
%
\def\titleskip{\vskip 4\bigskipamount}      %% Whitespace after title
\def\authorskip{\vskip 2\bigskipamount}     %% Whitespace after author

%
% Additional titlepage definitions
%
\newcommand{\degreeaward}{\gdef\@degreeaward}
\degreeaward{Doctor of Philosophy}                  % Default is Ph.D.

\newcommand{\university}{\gdef\@university}
\university{California Institute of Technology}     % Default is Caltech

\newcommand{\unilogo}{\gdef\@unilogo}
\unilogo{caltech.png}                                  % Caltech logo

\newcommand{\address}{\gdef\@address}
\address{Pasadena, California}                      % Default is Caltech

\newcommand{\copyyear}{\gdef\@copyyear}
\newcommand{\defenddate}{\gdef\@defenddate}
% Overleaf: Updated 21 January 2016; don't put in a default year value
\copyyear{!!!!}
\defenddate{!!!!}

%
% Overleaf: added 21 January 2016
\newcommand{\orcid}[1]{\gdef\@orcid{#1}}
\orcid{xxxxx}
\newcommand{\rightsstatement}[1]{\gdef\@rightsstatement{#1}}
\rightsstatement{All rights reserved}
% The copyright page is new, must conform to CIT requirements
%
\newcommand{\makecopyright}{%
 {\parindent=0pt
 \null              % Forces rest to bottom of page
 \vfill
 \begin{center}
   \SingleSpacing
   \copyright~\@copyyear\par
   \@author\\ORCID: \@orcid\par
   \@rightsstatement\par
 \end{center}}
 \newpage
}               %% End of \makecopyright

\renewcommand{\maketitle}[1][]{%
\begin{titlingpage}
     \vspace*{\stretch{2}}
  \renewcommand\Authfont{\Gotham\Large\bfseries}
  \Gotham
   \OnehalfSpacing
   \let\footnotesize\small \let\footnoterule\relax \setcounter{page}{1}
   \vskip-\headsep
   \begin{flushleft}
     {\SingleSpacing\Gotham\bfseries\Huge\@title\par}
     \titleskip
     Thesis by\\
     {\Gotham\bfseries\large\@author\par}
     \authorskip
     {In partial fulfillment of the requirements for the degree of {\bfseries \@degreeaward} \par}
   \begin{center}

    \vspace{\stretch{2}}
       \includegraphics[width=2in]{\@unilogo} \\
       \vspace{\stretch{0.2}}
     \Gotham{\@university}\\
     \@address\par
     \authorskip
     {\Large\bfseries \@copyyear}\\
     {\normalsize Defended \@defenddate\par}
  \end{center}
   \end{flushleft}
   \vspace*{.5in}
   \pagenumbering{}
\end{titlingpage}
\renewcommand\Authfont{}
\newpage
 \pagenumbering{roman}
 \setcounter{page}{2}
 \makecopyright
}               %% End of \maketitle

\patchcmd{\@makechapterhead}{#1}{\hyphenpenalty=10000 #1}{}{}% Patch \chapter
\patchcmd{\@makeschapterhead}{#1}{\hyphenpenalty=10000 #1}{}{}% Patch \chapter*

\endinput

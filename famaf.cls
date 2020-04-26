% ----------------------------------------------------------------------------------
%
% LaTeX 2e document class for publications of the Asociación Argentina de Astronomía
%
% v2.0, 10.oct.2014
%
% ----------------------------------------------------------------------------------



% IDENTIFICATION FOR FAMAF CLASS
%=============================================================================

\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\ProvidesClass{famaf}[2020/04/25 LaTeX document class for academic exams, v0.1]

% EXTERNAL PACKAGES
%=============================================================================

\RequirePackage[spanish, activeacute, english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{verbatim}
\RequirePackage{footmisc}
\RequirePackage{tikz}    
\RequirePackage{lastpage}


%{{{
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\newif\if@longauth
\@longauthfalse
\newif\if@online
\@onlinefalse
\newif\if@rnote
\@rnotefalse
\newif\if@oldversion
\@oldversionfalse
\newif\if@letter
\@letterfalse
%}}}


% ADDITIONAL OPTIONS
%=============================================================================
%{{{

%--- Class options for Typeset
\DeclareOption{parcial} 
{
}

\DeclareOption{final}
{
}


\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
%\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
%
\DeclareOption{longauth}{\@longauthtrue}
\DeclareOption{rnote}{\@rnotetrue}
%
\let\if@runhead\iffalse

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\ProcessOptions % Process options, executes the code fore each option 

%}}}


% SET LENGTHS AND COMMANDS
%=============================================================================
%{{{

 % spacing
 \setlength\parindent{15\p@}
 \setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
 \setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
 \setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
 \setlength\headheight{12\p@}
 \setlength\headsep   {12\p@} % 
 \setlength\topskip   {10\p@}
 \setlength\footskip{30\p@}
 \setlength\maxdepth{.5\topskip}

 % margenes del texto:
 \@settopoint\textwidth
 \setlength\marginparsep {0mm}
 \setlength\marginparpush{0mm}
 \setlength\oddsidemargin {-3mm}
 \setlength\evensidemargin{-12mm}
 \setlength\marginparwidth  {48\p@}
 \setlength\topmargin{-40pt}
 % floats:
 \setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
 \setlength\textfloatsep{18\p@ \@plus 8\p@ \@minus 6\p@}
 \setlength\intextsep   {18\p@ \@plus 2\p@ \@minus 2\p@}
 \setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
 \setlength\dbltextfloatsep{18\p@ \@plus 8\p@ \@minus 6\p@}
 \setlength\@fptop{0\p@ }
 \setlength\@fpsep{12\p@ }
 \setlength\@fpbot{0\p@ \@plus 1fil}
 \setlength\@dblfptop{0\p@ }
 \setlength\@dblfpsep{12\p@ }
 \setlength\@dblfpbot{0\p@ \@plus 1fil}
 \setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
 


% Itemized lists
\def\@listi{\leftmargin\leftmargini
            \parsep \z@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep\parsep}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    \z@
              \parsep    \topsep
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    \z@
              \parsep    \topsep
              \itemsep   \parsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}


 % set margins for itemized lists
 \setlength\leftmargini  {\parindent}
 \leftmargin  \leftmargini
 \setlength\leftmarginii {\parindent}
 \setlength\leftmarginiii {\parindent} 
 %\setlength\leftmarginiii {1.87em}
 \setlength\leftmarginiv  {1.7em}
 \setlength\leftmarginv  {.5em}
 \setlength\leftmarginvi {.5em}
 \setlength  \labelsep  {.5em}
 \setlength  \labelwidth{\leftmargini}
 \addtolength\labelwidth{-\labelsep}
 \@beginparpenalty -\@lowpenalty
 \@endparpenalty   -\@lowpenalty
 \@itempenalty     -\@lowpenalty
 \renewcommand\theenumi{\@arabic\c@enumi}
 \renewcommand\theenumii{\@alph\c@enumii}
 \renewcommand\theenumiii{\@roman\c@enumiii}
 \renewcommand\theenumiv{\@Alph\c@enumiv}
 \newcommand\labelenumi{\theenumi.}
 \newcommand\labelenumii{(\theenumii)}
 \newcommand\labelenumiii{\theenumiii.}
 \newcommand\labelenumiv{\theenumiv.}
 \renewcommand\p@enumii{\theenumi}
 \renewcommand\p@enumiii{\theenumi(\theenumii)}
 \renewcommand\p@enumiv{\p@enumiii\theenumiii}

 % set labels for itemized lists
 \newcommand\labelitemi{\raisebox{.5\height}{\scalebox{0.6}{\textbullet}}\hspace{4pt}}
 \newcommand\labelitemii{\raisebox{.5\height}{\scalebox{0.6}{$\circ$}}\hspace{4pt}}
 \newcommand\labelitemiii{\normalfont$\cdot$\hspace{4pt}}
 \newcommand\labelitemiv{\normalfont$\cdot$\hspace{4pt}}


 % Enumerated lists
 \def\enumerate{\ifnum \@enumdepth >3 \@toodeep \else
 \advance\@enumdepth \@ne
 \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
 \fi
 \@ifnextchar [{\@enumeratetwo}{\@enumerateone}%
 }
 \def\@enumeratetwo[#1]{%
 \list{\csname label\@enumctr\endcsname}%
 {\settowidth\labelwidth{[#1]}
 \leftmargin\z@
 \listparindent 1em
 \usecounter{\@enumctr}
 \let\makelabel\makenewlabel}
 }
 \def\@enumerateone{%
 \list{\csname label\@enumctr\endcsname}%
 {\usecounter{\@enumctr}\itemindent 1em\listparindent 1em
 \let\makelabel\makenewlabel}}
%
 \def\labelenumi{\theenumi}
 \def\theenumi{(\roman{enumi})}
 \def\labelenumii{\theenumii}
 \def\theenumii{(\alph{enumii})}
 \def\p@enumii{\theenumi}
 \def\labelenumiii{\theenumiii}
 \def\theenumiii{(\arabic{enumiii})}
 \def\p@enumiii{\theenumi(\theenumii)}
 \def\labelenumiv{\theenumiv}
 \def\theenumiv{(\Alph{enumiv})}
 \def\p@enumiv{\p@enumiii\theenumiii}


 % description
 \def\descriptionlabel#1{\reset@font\bf #1}
 \def\description{\list{}{\labelwidth\z@
   \leftmargin \z@
   \itemindent 1em
 }}
 \let\enddescription\endlist            


%}}}

% DATA
%=============================================================================
%{{{

\gdef\journaleditorial{Asociaci\'on Argentina de Astronom\'{\i}a} % Editorial
\gdef\journalvol#1{\gdef\@journalvol{#1}} % Volume
\gdef\journalyear#1{\gdef\@journalyear{#1}} % Year
\gdef\journaleditors#1{\gdef\@journaleditors{#1}} % Editors
\gdef\journalissn#1{\gdef\@journalissn{#1}} % ISSN
\input{fleqn.clo} % Align equations to the left
\@twosidetrue % Use always two-side format
\setlength\overfullrule{0pt} % Strict overfull rule
%\@twocolumntrue % Use two column format
%
%\ProcessOptions % Process options, executes the code fore each option 




% Language-dependent definitions
% Contribution languages: 0 = Spanish / 1 = English
%

\def\abstractname{Abstract}
\def\resumenname{Resumen informe 2015}
\def\planname{Resumen plan 2016}
\def\contactname{Contacto}
\def\contentsname{Contenido}
\def\thanksname{Agradecimientos}
\def\refname{Referencias}
\def\figurename{Fig.}
\def\tablename{Tabla}
\def\partname{Parte}
\def\appendixname{Ap\'endice}

%}}}


% SETTINGS & STYLE
%=============================================================================
%{{{
%
% Page size
%
\setlength\paperheight {280mm}
\setlength\paperwidth  {210mm}
%
% Font size commands
%
\renewcommand\normalsize{\@setfontsize\normalsize\@xpt{11}}\normalsize
\newcommand\small{\@setfontsize\small\@ixpt{10}}%
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@viiipt\@ixpt} 
\newcommand\large{\@setfontsize\large\@xipt{13}}
\newcommand\Large{\@setfontsize\Large\@xivpt{16}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{20}}
\newcommand\huge{\@setfontsize\huge\@xxpt{24}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
%
% Text area size
%
\setlength{\textwidth}{174mm}
\setlength{\textheight}{240mm} 

%
% footnotes
%
\setlength\footnotesep{8\p@}
\setlength{\skip\footins}{7\p@ \@plus 4\p@ \@minus 2\p@}

\let\footnotesize\small 

\renewcommand*\@fnsymbol[1]{%
  \ensuremath{%
    \ifcase#1
    \or \star
    \or{\star}{\star}
    \or{\star}{\star}{\star}%
    \or{\star}{\star}{\star}{\star}
    \or \dagger
    \or \ddagger
    \or \mathsection
    \or \mathparagraph
    \or \|
    \or **
    \or \dagger\dagger
    \or \ddagger\ddagger
    \else \@ctrerr
    \fi
  }%
}
 
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@} 

\renewcommand{\hangfootparindent}{2em}
% Indentation for 2nd etc. paragraphs in footnotes which cosists of
% more than one paragraph
\renewcommand{\hangfootparskip}{3pt}
% Vertical space between paragraphs in multiparagraph footnotes
\renewcommand{\footnotemargin}{10pt}
% Setting left margin; this is the smallest value I can get to have
% second etc. lines indented to footnote number; zero put indentation
% to some positive value, and negative values do not help actually
%\renewcommand{\footnotelayout}{\hspace{2pt}}
% Here you can modify the spacing between the footnote number and the
% text of footnote; keep this value and \hangfootparindent value the
% same
  

%
% Page styles
%
\def\ps@examheadings
{
   \def\@oddfoot{\hfill \small pág. \thepage/\pageref{LastPage}} 
   \def\@evenfoot{\small pág. \thepage/\pageref{LastPage} \hfill}
   \def\@evenhead{\hfil\the\titlerunning\leftmark\hfil}%
   \def\@oddhead{\small\hfil\rightmark\the\authorrunning\hfil}%
   \let\@mkboth\@gobbletwo
   \let\sectionmark\@gobble
   \let\subsectionmark\@gobble 
}
%
\def\ps@firstpage
{
   \def\@oddfoot{\small \hfill pág. \thepage/\pageref{LastPage}}
   \let\@evenfoot\@empty
   \let\@evenhead\@empty
   \let\@oddhead\@empty
}

%
% tables
%
\setlength\arrayrulewidth{.4\p@}
%
% Keywords
%
\def\keywords#1{\gdef\@keywords{#1}} 
%
% institution
%
\newcounter{inst} % Institution counter
\newcounter{auth} % author counter
\newdimen\instindent
\newbox\authrun
\newtoks\authorrunning
\newbox\titrun
\newtoks\titlerunning
\let\@date\undefined




%
% Institute definition
%
\def\institute#1{\gdef\@institute{#1}}
%
% Institute names
%
\def\institutename{\par
 \begingroup
 % formato de afiliaciones
 \small
 \rmfamily
 \itshape
 \parindent=0pt
 \parskip=0pt % interlineado de afiliaciones
 \refstepcounter{inst}
 \def\and{\par\refstepcounter{inst}
 \hangindent\instindent
 \noindent
 \hbox to\instindent{\hss$^{\theinst}$\enspace}\ignorespaces}%
 %\setbox0=\vbox{\@institute}
 % use thanks to anotate author email
 \setbox0=\vbox{\def\thanks##1{}\@institute}
 \ifnum\value{inst}>9\relax\setbox0=\hbox{$^{88}$\enspace}%
                 \else\setbox0=\hbox{$^{8}$\enspace}\fi
 \instindent=\wd0\relax
 \ifnum\value{inst}=1\relax
 \else
   \setcounter{inst}{1}%
   \hangindent\instindent
   \noindent
   \hbox to\instindent{\hss$^{\theinst}$\enspace}\ignorespaces
 \fi
 \ignorespaces
 \@institute\par
 \endgroup}
%
% contact
%
\def\mail#1{\gdef\@mail{#1}}
\def\@mail{}
\def\contact#1{\gdef\@contact{#1}}
\def\@contact{}

%
% examen
%
\def\mail#1{\gdef\@mail{#1}}
\def\@mail{}
\def\examen#1{\gdef\@examen{#1}}
\def\@examen{}

%
% materia
%
\def\mail#1{\gdef\@mail{#1}}
\def\@mail{}
\def\materia#1{\gdef\@materia{#1}}
\def\@materia{}
 
 
%
% fecha
%
\def\mail#1{\gdef\@mail{#1}}
\def\@mail{}
\def\fecha#1{\gdef\@fecha{#1}}
\def\@fecha{}
 
 




 
\def\contactline{\par
\begingroup
 % formato de contacto
  \small
  \rmfamily
  \itshape
  \parindent=0pt
  \ignorespaces
  \contactname / \@contact\par
\endgroup} 



%
% Affiliation numbers
%
\def\inst#1{\unskip$^{ \text{\tiny{#1}} }$}
%
% Subtitle
%
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{}

%\def\maketitle{\twocolumn[\@maketitle]
\def\maketitle{\@maketitle
 \setcounter{footnote}{0}
 \global\let\maketitle\relax
 \global\let\@maketitle\relax
 \global\let\@author\@empty
 \global\let\@date\@empty
 \global\let\@title\@empty
 \global\let\@subtitle\@empty
 \global\let\@abstract\@empty
 \global\let\@resumen\@empty
 \global\let\@plan\@empty
 \global\let\@keywords\@empty
 \global\let\keywords\relax
 \global\let\title\relax
 \global\let\author\relax
 \global\let\abstract\relax
 \global\let\resumen\relax
 \global\let\plan\relax
 \global\let\date\relax
 \global\let\and\relax
}

\let\thanks=\footnote
\global\let\thanks\relax
\global\let\@thanks\@empty


%
% Watermark: logo
%
\usepackage{graphicx}
\newsavebox{\mygraphic}
\sbox{\mygraphic}{\includegraphics[width=2.5cm]{logo_famaf.png}} 

%
% Define header
%
\def\makeheadbox
{
   {
      \hsize=45cc
      \renewcommand{\tabcolsep}{0pt}
      \begin{tabular}{lcr}
      \small{\@materia} & \rule{12.0cm}{0pt} & 
         \setlength{\unitlength}{1pt}
         \begin{picture}(0,0) \put(-72,-10){\usebox{\mygraphic}} \end{picture} 
      \small{}\\
      %\small{Parcial 1, 29 de abril de 2020} & &\small{}\\
      \small{\@examen,~\@fecha} & &\small{}\\
      \hline \normalsize
    \end{tabular}
  }
}

\setlength\columnsep{12pt}
\setlength\columnseprule{0\p@}
 
\thispagestyle{firstpage}
\pagenumbering{arabic}
%\twocolumn
\sloppy
\flushbottom 

% Define `acknowledgement' environment
\def\acknowledgement{\par\addvspace{17pt}\tiny\rm
\trivlist\item[\hskip\labelsep
{\it\thanksname:}]}
\def\endacknowledgement{\endtrivlist\addvspace{6pt}} 



%}}}


% TITLE PAGE
%=============================================================================
%{{{
%
% Make title page
%
\def\@maketitle{
%
% Begin in new page
%
  \newpage
  \normalfont
%
% Print header
%
  \vbox to0pt{\vskip-20pt \nointerlineskip \makeheadbox\vss}
%
% Print title
%
  \nointerlineskip
  \vskip 35pt
  \begin{center}
  {
    \Large \sffamily \boldmath
    \vspace*{8pt}
    \noindent\ignorespaces
    \@title
    \vspace*{2pt}
    \par
  }

  \end{center}

  \vskip 14pt
}
%}}}


% USEFUL DEFINITIONS
%=============================================================================
%{{{
%
% Some useful astronomical definitions
%
\def\python{\hbox{\textsc{Python}}}

%
%}}}


% CLASS STRUCTURE
%=============================================================================
%{{{
\setcounter{secnumdepth}{3}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand\thesection{\@arabic\c@section.} % format section number
\renewcommand\thesubsection   {\thesection\@arabic\c@subsection.}
\renewcommand\thesubsubsection{\thesubsection\@arabic\c@subsubsection.}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
%
\def\sectcounterend{.}

%\def\@seccntformat#1{\csname the#1\endcsname\sectcounterend
%\hskip\betweenumberspace}

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \raggedright
          \hyphenpenalty \@M%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8\hskip\aftertext}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

%
% measures and setting of sections
%
\def\section{\@startsection{section}{1}{\z@}%
    {-16dd plus-4pt minus-4pt}{6dd}{\large\bfseries\sffamily}} % section format
\def\subsection{\@startsection{subsection}{2}{\z@}%
    {-16dd}{6dd}{\normalsize\sffamily}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}%
    {-16dd}{6dd}{\normalsize}}
\def\paragraph{\@startsection{paragraph}{4}{\z@}%
    {-16dd}{-1pt}{\normalsize}}

\pagestyle{examheadings}

%}}}    
   

% FLOATS
%=============================================================================
%{{{
 
 \newcounter{append}
 \setcounter{append}{0}
 \newenvironment{appendix}{\par
 \def\@hangfrom##1{\setbox\@tempboxa\hbox{{##1}}%
 \hangindent \parindent\noindent\box\@tempboxa}
 \def\@seccntformat##1{\csname theap##1\endcsname\hskip\betweenumberspace}
 \setcounter{section}{\value{append}}%
 \setcounter{subsection}{0}%
 \setcounter{figure}{0}%
 \setcounter{table}{0}%
 \newcommand\theapsection{Appendix \@Alph\c@section:}%
 \newcommand\theapsubsection{\@Alph\c@section.\@arabic\c@subsection.}%
 \newcommand\theapsubsubsection{\theapsubsection\@arabic\c@subsubsection.}%
 \renewcommand\thesection{\@Alph\c@section}%
 \renewcommand\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
 \renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}%
 \renewcommand\theequation{\@Alph\c@section.\@arabic\c@equation}%
 \renewcommand\thefigure{\@Alph\c@section.\@arabic\c@figure}%
 \renewcommand\thetable{\@Alph\c@section.\@arabic\c@table}%
 \@addtoreset{equation}{section}%
 \@addtoreset{figure}{section}%
 \@addtoreset{table}{section}%
 \def\subfigures{\stepcounter{figure}\setcounter{auth}{\value{figure}}%
 \setcounter{figure}{0}%
 \def\thefigure{\@Alph\c@section\@arabic\c@auth\alph{figure}}%
 \def\resetsubfig{
    \setcounter{figure}
    { \value{auth} }
 }
 }}
%   
{
 \setcounter{section}{0}%
 \setcounter{subsection}{0}%
 \setcounter{figure}{0}%
 \setcounter{table}{0}%
 \renewcommand\thesection{\c@section}%
 \renewcommand\thesubsection{\@arabic\c@subsection}%
 \renewcommand\thesubsubsection{\@arabic\c@subsubsection}%
 \renewcommand\theequation{\@arabic\c@equation}%
 \renewcommand\thefigure{\@arabic\c@figure}%
 \renewcommand\thetable{\@arabic\c@table}%
 \addtocounter{append}{1}
}
%
 \setlength\arraycolsep{2.5\p@}
 \setlength\tabcolsep{6\p@}
 \setlength\arrayrulewidth{.4\p@}
 \setlength\doublerulesep{2\p@}
 \setlength\tabbingsep{\labelsep}
 \skip\@mpfootins = \skip\footins
 \setlength\fboxsep{3\p@}
 \setlength\fboxrule{.4\p@}
 \renewcommand\theequation{\@arabic\c@equation}
 \newcounter{figure}
 \renewcommand\thefigure{\@arabic\c@figure}
 \def\fps@figure{tbp}
 \def\ftype@figure{1}
 \def\ext@figure{lof}
 \def\fnum@figure{\figurename\,\thefigure}
 \newenvironment{figure}
                {\@float{figure}}
                {\resetsubfig\end@float}
 \newenvironment{figure*}
                {\@dblfloat{figure}}
                {\resetsubfig\end@dblfloat}
 \let\resetsubfig\relax
 %
 \def\subfigures
 {
    \stepcounter{figure}\setcounter{auth}{\value{figure}}%
    \setcounter{figure}{0}\def\thefigure{\@arabic\c@auth\alph{figure}}%
    \def\resetsubfig
    {
       \setcounter{figure} { \value{auth} }
    }
  }
 \newcounter{table}
 \renewcommand\thetable{\@arabic\c@table}
 \def\fps@table{tbp}
 \def\ftype@table{2}
 \def\ext@table{lot}
 \def\fnum@table{\tablename~\thetable}
 \newenvironment{table}
                {\small\@float{table}}
                {\end@float}
 \newenvironment{table*}
                {\small\@dblfloat{table}}
                {\end@dblfloat}
 
 \def \@floatboxreset {%
         \reset@font
         \small % text size within tables
         \@setnobreak
         \@setminipage
 }
 
 \newlength\abovecaptionskip
 \newlength\belowcaptionskip
 \setlength\abovecaptionskip{10\p@}
 \setlength\belowcaptionskip{0\p@}
 \newcommand\leftlegendglue{}
 
 \def\fig@type{figure}
 
 \newdimen\figcapgap\figcapgap=5pt
 \newdimen\tabcapgap\tabcapgap=10pt
 
 \@ifundefined{floatlegendstyle}{\def\floatlegendstyle{
   \bf % style for legend titles (Fig., Table, ...)
 }}{}
 \def\floatcounterend{.} % separator for legend titles
 
 \long\def\@caption#1[#2]#3{\par\addcontentsline{\csname
   ext@#1\endcsname}{#1}{\protect\numberline{\csname
   the#1\endcsname}{\ignorespaces #2}}\begingroup
     \@parboxrestore
     \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
   \endgroup}
 
 \def\capstrut{\vrule\@width\z@\@height\topskip}
 \@ifundefined{captionstyle}{\def\captionstyle{
    \normalfont\small
 }}{}
 
 \long\def\@makecaption#1#2{%
 \ifx\@captype\fig@type
   \vskip\figcapgap
   \setbox\@tempboxa\hbox{{\floatlegendstyle #1\floatcounterend}
   \capstrut #2}%
   \ifdim \wd\@tempboxa >\hsize
     {\floatlegendstyle #1\floatcounterend} \capstrut #2\par
   \else
     \hbox to\hsize{\leftlegendglue\unhbox\@tempboxa\hfil}%
   \fi
 \else
   {\floatlegendstyle #1\floatcounterend} \capstrut #2\par
   \vskip\tabcapgap
 \fi} 

%}}}


% BIBLIOGRAPHY
%=============================================================================
%{{{

\setlength \labelsep {.5em} 
\newcommand\newblock{\hskip
  .11em\@plus.33em\@minus.07em} \let\@openbib@code\@empty

\newenvironment{thebibliography}[1]
{\section*{\refname}%
  \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth \advance\leftmargin\labelsep \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy \clubpenalty4000 \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m} {\def\@noitemerr {\@latex@warning{Empty
      `thebibliography' environment}}%
      \endlist}
%}}}


\endinput
%
% End of famaf.cls
%--------------------

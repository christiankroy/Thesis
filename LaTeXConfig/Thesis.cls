%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thesis LaTeX Template - THESIS CLASS FILE%
% This template has been downloaded from:
% http://www.latextemplates.com%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{LaTeXConfig/Thesis}
              [2007/22/02 v1.0
   LaTeX document class]
\def\baseclass{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}

\newcommand\Declaration[1]{
\btypeout{Declaration of Authorship}
\addtotoc{Declaration of Authorship}
\thispagestyle{plain}
\null\vfil
%\vskip 60\p@
\begin{center}{\huge\bf Declaration of Authorship\par}\end{center}
%\vskip 60\p@
{\normalsize #1}
\vfil\vfil\null
%\cleardoublepage
}

\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\year}
\usepackage{setspace}
  %\onehalfspacing
\setlength{\parindent}{0pt}
\setlength{\parskip}{2.0ex plus0.5ex minus0.2ex}
\usepackage{vmargin}

\RequirePackage[utf8]{inputenc} % Allows the use of international characters (e.g. Umlauts)

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------
\setmarginsrb  { 1.5in}  % left margin | Umass Corrected
                        { 1.5in}  % top margin
                        { 1.0in}  % right margin
                        { 1.0in}  % bottom margin
                        {  20pt}  % head height
                        {0.25in}  % head sep
                        {   9pt}  % foot height
                        { 0.3in}  % foot sep
%----------------------------------------------------------------------------------------
%\setmarginsrb  { 0.5in}  % left margin | For Good Draft printing
%                        { 0.5in}  % top margin
%                        { 0.5in}  % right margin
%                        { 0.5in}  % bottom margin
%                        {  20pt}  % head height
%                        {0.25in}  % head sep
%                        {   9pt}  % foot height
%                        { 0.3in}  % foot sep
%----------------------------------------------------------------------------------------

\raggedbottom
\setlength{\topskip}{1\topskip \@plus 5\p@}
\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.
\usepackage{fancyhdr}
\lhead[\rm\thepage]{\fancyplain{}{\sl{\rightmark}}} 
\rhead[\fancyplain{}{\sl{\leftmark}}]{\rm\thepage}
\chead{}\lfoot{}\rfoot{}\cfoot{}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\btypeout{\thechapter\space #1}\markboth{\@chapapp\ \thechapter\ #1}{\@chapapp\ \thechapter\ #1}}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\usepackage{amsmath,amsfonts,amssymb,amscd,amsthm,xspace}
\theoremstyle{plain}
\newtheorem{example}{Example}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{axiom}[theorem]{Axiom}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
\usepackage[centerlast,small,sc]{caption}
\setlength{\captionmargin}{20pt}
\newcommand{\fref}[1]{Figure~\ref{#1}}
\newcommand{\tref}[1]{Table~\ref{#1}}
\newcommand{\eref}[1]{Equation~\ref{#1}}
\newcommand{\cref}[1]{Chapter~\ref{#1}}
\newcommand{\sref}[1]{Section~\ref{#1}}
\newcommand{\aref}[1]{Appendix~\ref{#1}}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}
\usepackage{graphicx}
\usepackage{epstopdf}
\usepackage{booktabs}
\usepackage{rotating}
\usepackage{listings}
\usepackage{LaTeXConfig/lstpatch}
\lstset{captionpos=b,
        frame=tb,
        basicstyle=\scriptsize\ttfamily,
        showstringspaces=false,
        keepspaces=true}
\lstdefinestyle{matlab} {
        language=Matlab,
        keywordstyle=\color{blue},
        commentstyle=\color[rgb]{0.13,0.55,0.13}\em,
        stringstyle=\color[rgb]{0.7,0,0} }
\usepackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
   colorlinks,linkcolor={blue},citecolor={blue},urlcolor={red},
   pdfstartview={FitV},unicode,breaklinks=true]{hyperref}
\pdfstringdefDisableCommands{
   \let\\\space
}
\newcommand*{\supervisorOne}[1]{\def\supnameOne{#1}}
\newcommand*{\supervisorTwo}[1]{\def\supnameTwo{#1}}
\newcommand*{\thesistitle}[1]{\def\ttitle{#1}}
\newcommand*{\examiner}[1]{\def\examname{#1}}
\newcommand*{\degreeName}[1]{\def\degreename{#1}}
\newcommand*{\authors}[1]{\def\authornames{#1}}
\newcommand*{\addresses}[1]{\def\addressnames{#1}}
\newcommand*{\university}[1]{\def\univname{#1}}
\newcommand*{\UNIVERSITY}[1]{\def\UNIVNAME{#1}}
\newcommand*{\department}[1]{\def\deptname{#1}}
\newcommand*{\DEPARTMENT}[1]{\def\DEPTNAME{#1}}
\newcommand*{\group}[1]{\def\groupname{#1}}
\newcommand*{\GROUP}[1]{\def\GROUPNAME{#1}}
\newcommand*{\faculty}[1]{\def\facname{#1}}
\newcommand*{\FACULTY}[1]{\def\FACNAME{#1}}
\newcommand*{\subject}[1]{\def\subjectname{#1}}
\newcommand*{\keywords}[1]{\def\keywordnames{#1}}

%----------------------------------------------------------------------------------------
%	DOCUMENT VARIABLES
%	Fill in the lines below to update the thesis template
%	If you wish to cite each of the variables defined below, look at the
%	section above for the citation command e.g. \examiner{} below is
%	defined as \examname above so you cite it as \examname
%----------------------------------------------------------------------------------------

\thesistitle{"Putting the Pieces Together: Exons and piRNAs"} % Your thesis title
%-------------------------------------------------  
\supervisorOne{Melissa J. \textsc{Moore}} % You supervisor's name - this is used in the title page
\supervisorTwo{Phillip D. \textsc{Zamore}} % You supervisor's name - this is used in the title page
%-------------------------------------------------   
\degreeName{Doctor of Philosophy} % Your degree name - this is currently used in the title page and abstract
%-------------------------------------------------   
\authors{Christian K. \textsc{Roy}} % Your name - this is used in the title page and abstract
%-------------------------------------------------   
%-------------------------------------------------   
\subject{Biochemistry} 
%-------------------------------------------------   
\keywords{Alternative Splicing, piRNA, Mammalian piRNA, SeqZip, Ligation, Transcriptome, High-throughput Sequencing}
%-------------------------------------------------   
\university{\texorpdfstring{\href{http://www.umassmed.edu} % Your university's URL
                {UNIVERSITY OF MASSACHUSETTS MEDICAL SCHOOL}} % Your university's name - this is currently used in the title page
                {UNIVERSITY OF MASSACHUSETTS MEDICAL SCHOOL}}
%-------------------------------------------------   
\UNIVERSITY{\texorpdfstring{\href{http://www.umassmed.edu)} % Your university's URL
                {UNIVERSITY OF MASSACHUSETTS MEDICAL SCHOOL}} % Your university's name in capitals - this is currently used in the abstract page
                {UNIVERSITY OF MASSACHUSETTS MEDICAL SCHOOL}}
%-------------------------------------------------                
\department{\texorpdfstring{\href{http://www.umassmed.edu/bmp/index.aspx(include http://)} % Your department's URL
                {BIOCHEMISTRY AND MOLECULAR PHARMACOLOGY}} % Your department's name - used in the title page and abstract
                {BIOCHEMISTRY AND MOLECULAR PHARMACOLOGY}}
%-------------------------------------------------                
\DEPARTMENT{\texorpdfstring{\href{http://www.umassmed.edu/bmp)} % Your department's URL
                {BIOCHEMISTRY AND MOLECULAR PHARMACOLOGY}} % Your department's name in capitals - this is not currently used anywhere in the template, cite it with \DEPTNAME if you want it
                {BIOCHEMISTRY AND MOLECULAR PHARMACOLOGY}}
%-------------------------------------------------                
\group{\texorpdfstring{\href{http://www.umassmed.edu/rti/} % Your research group's URL
                {RNA THERAPEUTICS INSTITUTE}} % Your research group's name - this is currently used in the title page 
                {RNA THERAPEUTICS INSTITUTE}}
%-------------------------------------------------                
\GROUP{\texorpdfstring{\href{http://www.umassmed.edu/rti/} % Your research group's URL
                {RNA THERAPEUTICS INSTITUTE}} % Your research group's name in capitals - this is not currently used anywhere in the template, cite it with \GROUPNAME if you want it
                {RNA THERAPEUTICS INSTITUTE}}
%-------------------------------------------------                
\faculty{\texorpdfstring{\href{http://labs.umassmed.edu/moorelab/Moore_Lab_Website/home.html} % Your faculty's URL
                {Moore Lab}} % Your faculty's name - this is currently used in the abstract page
                {Moore Lab}}
%-------------------------------------------------                
\FACULTY{\texorpdfstring{\href{http://labs.umassmed.edu/moorelab/Moore_Lab_Website/home.html} % Your faculty's URL
                {MELISSA J. MOORE}} % Your faculty's name in capitals - this is not currently used anywhere in the template, cite it with \FACNAME if you want it
                {MELISSA J. MOORE}}
%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------
\newenvironment{abstract}
  {
    \btypeout{Abstract Page}
    \thispagestyle{empty}
    \null\vfil
    \begin{center}
      \setlength{\parskip}{0pt}
      {\normalsize \UNIVNAME \par} % University name in capitals
      \bigskip
      {\huge{\textit{Abstract}} \par}
      \bigskip
      %{\normalsize \facname \par} % Faculty name
      {\normalsize \deptname \par} % Department name
      \bigskip
      {\normalsize \degreename\par} % Degree name
      \bigskip
      {\normalsize\bf \@title \par} % Thesis title
      \medskip
      {\normalsize by \authornames \par} % Author name
      \bigskip
    \end{center}
    }
%----------------------------------------------------------------------------------------
{
  \vfil\vfil\vfil\null
  \cleardoublepage
}

\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}
\newcounter{dummy}
\newcommand\addtotoc[1]{
\refstepcounter{dummy}
\addcontentsline{toc}{chapter}{#1}}

\renewcommand\tableofcontents{
  \btypeout{Table of Contents}
  \addtotoc{Contents}
  \begin{spacing}{1}{
      \setlength{\parskip}{1pt}
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
      \chapter*{\contentsname
          \@mkboth{
             \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
      \@starttoc{toc}
      \if@restonecol\twocolumn\fi
     \cleardoublepage
  }\end{spacing}
}

\renewcommand\listoffigures{
  \btypeout{List of Figures}
  \addtotoc{List of Figures}
  \begin{spacing}{1}{
      \setlength{\parskip}{1pt}
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
      \chapter*{\listfigurename
        \@mkboth{\MakeUppercase\listfigurename}
                {\MakeUppercase\listfigurename}}
      \@starttoc{lof}
      \if@restonecol\twocolumn\fi
      \cleardoublepage
  }\end{spacing}
  }

\renewcommand\listoftables{
\btypeout{List of Tables}
\addtotoc{List of Tables}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
    \@starttoc{lot}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}

%\newcommand\listAbbreviations{
%\btypeout{Abbreviations}
%\addtotoc{Abbreviations}
%\begin{center}{\large{\textit{List of Abbreviations}} \par}\end{center}
%}

%\newcommand\listSymbols{
%\btypeout{Symbols}
%\addtotoc{Symbols}
%\begin{center}{\large{\textit{List of Symbols}} \par}\end{center}
%}

\newcommand\listAbbreviationsAndSymbols{
\btypeout{Abbreviations and Symbols}
\addtotoc{Abbreviations and Symbols}
\begin{center}{\large{\textit{List of Abbreviations and Symbols}} \par}\end{center}
}

\newcommand\listDefinitions{
\btypeout{Definitions}
\addtotoc{Definitions}
\begin{center}{\large{\textit{Definitions}} \par}\end{center}
}

\newcommand\acknowledgements[1]{
\btypeout{Acknowledgements}
\addtotoc{Acknowledgements}
\thispagestyle{plain}
\begin{center}{\huge{\textit{Acknowledgements}} \par}\end{center}
{\normalsize #1}
\vfil\vfil\null
}

\newcommand\prefaceSection[1]{
\btypeout{Preface}
\addtotoc{Preface}
\thispagestyle{plain}
\begin{center}{\huge{\textit{Preface}} \par}\end{center}
{\normalsize #1}
%\vfil\vfil\null
}

\newcommand\dedicatory[1]{
\btypeout{Dedication}
\addtotoc{Dedication}
\thispagestyle{plain}
\null\vfil
\vskip 60\p@
\begin{center}{\Large \sl #1}\end{center}
\vfil\null
\cleardoublepage
}

\renewcommand\backmatter{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \addtotoc{\bibname}
  \btypeout{\bibname}
  \@mainmatterfalse}
\endinput

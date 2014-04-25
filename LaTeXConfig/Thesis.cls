\ProvidesClass{LaTeXConfig/Thesis}
\LoadClass[12pt, letterpaper, oneside]{book}

%%%% FIGURES
\usepackage{graphicx}
\usepackage{epstopdf}
\usepackage[centerlast,font={footnotesize},sc]{caption}
  \setlength{\captionmargin}{20pt}
  \renewcommand{\topfraction}{0.85}
  \renewcommand{\bottomfraction}{.85}
  \renewcommand{\textfraction}{0.1}
  \renewcommand{\dbltopfraction}{.85}
  \renewcommand{\floatpagefraction}{0.75}
  \renewcommand{\dblfloatpagefraction}{.75}
\usepackage{float}  
  \floatstyle{plain} \restylefloat{figure} % Figures with Captions below
  \floatstyle{plaintop} \restylefloat{table} % Table with captions above

%%%% TABLES
\usepackage{longtable} % For long tables that span many pages. | use \begin{longtable}
\usepackage{booktabs}

%%%% ROTATED PAGES
\usepackage{pdflscape} % Rotate page; BOTH printing and viewing! \begin{landscape} \end{landscape}

%%%% FONTS
\usepackage[T1]{fontenc}   % Standardize output fonts
\usepackage{helvet} \renewcommand{\familydefault}{\sfdefault} % Pick Ariel Font  
\usepackage{selinput} % For Anna's name
  \SelectInputMappings{
  aacute={á},
  ntilde={ñ}
  }

%%%% REFERENCING AND BIBLIOGRAPHY
\usepackage[square, comma, sort&compress]{natbib}  % For Referencing
  \setlength{\bibsep}{0.0pt} % Reduce size of bibliography
\usepackage{bibentry} % For inserting Full Citation into preface
  \nobibliography* % Required to use the \usepackage(bibentry) above

%%%% COMMENTING, TODO, and REVIEW
\usepackage{soul} % Highlight things use \hl{text}
\usepackage[colorinlistoftodos]{todonotes} % To inserting Comments w/ \todo[prepend]{Comment text}
\usepackage{changebar} % For putting bar in margin for review w/ \begin{changebar} & \end{changebar}
\usepackage{lipsum} % Generate Fill text w/ \lipsum[#] where #=paragraph num

%%%% CODE INCLUSION
\usepackage{listings}
\usepackage{color}
  \definecolor{dkgreen}{rgb}{0,0.6,0} 
  \definecolor{gray}{rgb}{0.5,0.5,0.5}
  \definecolor{mauve}{rgb}{0.58,0,0.82}
  \lstset{
    frame=tb,
    language=Perl, % Change as needed locally w/ \lstset{language=LANG} where LANG=language of choice (i.e. PERL)
    aboveskip=3mm,belowskip=3mm,
    showstringspaces=false,columns=flexible,
    basicstyle={\footnotesize\ttfamily},
    numbers=none,
    numberstyle=\tiny\color{gray},
    keywordstyle=\color{blue},
    commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
    breaklines=true,breakatwhitespace=true
    tabsize=2}

%%%% WHITE SPACE
\usepackage{setspace} % For picking line spacing *within* sections
\usepackage{parskip} % For changing spacing between heads, lets me use linebreaks for spacing between paragraphs
  \setlength{\parskip}{\baselineskip}
\usepackage{vmargin} % MARGINS
  \setmarginsrb  { 1.5in}  % left margin | Umass Corrected
                 { 1.5in}  % top margin
                 { 1.0in}  % right margin
                 { 1.0in}  % bottom margin
                 {  20pt}  % head height
                 {0.25in}  % head sep
                 {   9pt}  % foot height
                 { 0.3in}  % foot sep
  \raggedbottom
  \setlength{\topskip}{1\topskip \@plus 5\p@}
  \doublehyphendemerits=10000       % No consecutive line hyphens.
  \brokenpenalty=10000              % No broken words across columns/pages.
  \widowpenalty=9999                % Almost no widows at bottom of page.
  \clubpenalty=9999                 % Almost no orphans at top of page.
  \interfootnotelinepenalty=9999    % Almost never break footnotes.

%%%% HEADERS
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}
\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
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
\usepackage{titlesec} % Center the Chapter and heading titles 
  % Make Chapter and Sections be single spacing. Also Chapter names centered
  \titleformat{\chapter}[display]
  {\singlespacing\normalfont\huge\bfseries\centering}{\chaptertitlename\ \thechapter}{20pt}{\Huge}
  \titleformat{\section}
  {\singlespacing\normalfont\Large\bfseries}{\thesection}{1em}{}
  \titleformat{\subsection}
  {\singlespacing\normalfont\large\bfseries}{\thesubsection}{1em}{}
  \titleformat{\subsubsection}
  {\singlespacing\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}

%%%% HYPERLINKING
\usepackage{hyperref}
   \hypersetup{
     pdfpagemode={UseOutlines},
     bookmarksopen=true,
     bookmarksopenlevel=0,
     bookmarksnumbered=true,
     hypertexnames=false,
     colorlinks=true,
     linkcolor={blue},
     citecolor={blue},
     urlcolor={blue},
     pdfstartview={FitV},
     unicode,
     breaklinks=true}

%%%% SYMBOLS NB: Must be loaded after `hyperref`!!
\usepackage{flexisym} % Lets me use prime symbols 


%%%% DOCUMENT VARIABLES
\newcommand*{\thesistitle}[1]{\def\ttitle{#1}}
  \thesistitle{"Putting the Pieces Together: Exons and piRNAs"} % Your thesis title

\newcommand*{\authors}[1]{\def\authornames{#1}}
  \authors{Christian K. Roy} % Your name 

\newcommand*{\keywords}[1]{\def\keywordnames{#1}}
  \keywords{Alternative Splicing, piRNA, Mammalian piRNA, SeqZip, 
            Ligation, Transcriptome, High-throughput Sequencing}  

%%%$ PDF Meta-data assignment.
\hypersetup{
  pdftitle=\ttitle,
  pdfauthor=\authornames,
  pdfkeywords=\keywordnames
}

% Format the Abstract page. Only the header, not the content
\newenvironment{abstract}
  {
    \btypeout{Abstract Page}
    \thispagestyle{empty}
    \null\vfil
    \begin{center}
      \setlength{\parskip}{0pt}
      {\normalsize UNIVERSITY OF MASSACHUSETTS MEDICAL SCHOOL \par}      \bigskip
      {\huge{\textit{Abstract}} \par}   \bigskip
      {\normalsize BIOCHEMISTRY AND MOLECULAR PHARMACOLOGY \par}      \bigskip
      {\normalsize Doctor of Philosophy \par}     \bigskip
      {\normalsize\bf \ttitle \par}     \medskip
      {\normalsize by \authornames \par}\bigskip
    \end{center}
    }

% For Table of content formatting and numbering
  \addtocounter{secnumdepth}{1}
  \setcounter{tocdepth}{6}
  \newcounter{dummy}
  \newcommand\addtotoc[1]{
    \refstepcounter{dummy}
    \addcontentsline{toc}{chapter}{#1}
    }

%% Formats the table of contents 
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

%% Formats List of Figures
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

%% Formats List of Tables
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

%% For Abbreviations and Symbols together.
\newcommand\listAbbreviationsAndSymbols{
\btypeout{Abbreviations and Symbols}
\addtotoc{Abbreviations and Symbols}
}

% Definitions
\newcommand\listDefinitions{
\btypeout{Definitions}
\addtotoc{Definitions}
}

% Acknowledgements
\newcommand\acknowledgements[1]{
\btypeout{Acknowledgements}
\addtotoc{Acknowledgements}
\thispagestyle{plain}
\begin{center}{\huge{\textit{Acknowledgements}} \par}\end{center}
{\normalsize #1}
\vfil\vfil\null
}

% Preface - to mention published works
\newcommand\prefaceSection[1]{
\btypeout{Preface}
\addtotoc{Preface}
\thispagestyle{plain}
\begin{center}{\huge{\textit{Preface}} \par}\end{center}
{\normalsize #1}
}

% Dedication
\newcommand\dedicatory[1]{
\btypeout{Dedication}
\thispagestyle{plain}
\null
  \begin{quote}
    \centering \itshape \singlespacing
    \large
    #1
    \end{quote}
\clearpage
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

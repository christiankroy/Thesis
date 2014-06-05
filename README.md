# Writing UMASS Med Thesis in LaTeX

### [Christian K Roy](christiankroy@gmail.com) ###
### 2014-04-21 ###

## Introduction

I started to write my Umass Medical school thesis in Word. After getting a few rather large figures in there, and many internal references (including Mendeley-linked references), Word started to be really slow. After just a few short days of working like this, Word would not open my ~35 mb file! Therefore I decided to use a language designed to write books with many figures and internal references—LaTeX. Below is some of the information on how this was done. My thesis itself is available on my [GitHub Repository](https://github.com/christiankroy/Thesis.git).


### Getting Setup ###

The following software options are what I used. There are many other options. For example any text editor will do in place of Sublime Text (eg. Atom, TexMate, TextWrangler). I just found Sublime text had good LaTeX integration. Also any reference manager will use, I just like Mendeley, it's free.

1. Obtain LaTeX
  * On a Mac, Download [Mactex](http://tug.org/mactex/)
2. Download [Sublime Text 2](http://www.sublimetext.com/2)
3. Download [Mendeley](http://www.mendeley.com/)

### Setting up Sublime Text 2 ###

* Install packages w/ `CMD+Shift+P`; type `Install Packages`; wait for window to come up; type in name of package
* `Monokai Extended` | Color Scheme for coding editing
* `LaTeXTools` | Adds some LaTeX functionality
* Change the cite panel format to: `"cite_panel_format": ["({keyword}) {title} - {journal}"],`
* `CheckBounce` | For spell checking. See note [here](http://www.sublimetext.com/forum/viewtopic.php?f=5&t=11692)
+ `Table Cleaner` | Useful to make the `LaTeX` tables look clean by pressing `alt + ;` that's ALT and SemiColon.
* `Markdown Extended` | Allows for Syntax Markdown Highlighting in Sublime Text

### Setting up Mendeley

1. Configure Mendeley to keep a `*.bib` your entire library synced.
2. Keep the `*bib` file of my entire library in my GitHub repro location
3. Once you bring in a reference, be sure to search with the PMID or doi in order to correct fill out the fields from the interwebs

### File and Folder Structure ###

For purposes of organization, use the following folder setup:

    Thesis
    ├── Appendices
    ├── Bibliography
    ├── Chapters
    ├── Figures
    │   ├── Chapter1
    │   │   └── IllustratorFiles
    │   ├── Chapter2
    │   │   └── IllustratorFiles
    │   ├── Chapter3
    │   │   └── IllustratorFiles
    │   ├── Chapter4
    │   │   └── IllustratorFiles
    │   └── Chapter5
    │       └── IllustratorFiles
    ├── Forms
    ├── FrontMatter
    ├── LaTeXConfig
    ├── Tables
    │       └── ExcelDocuments
    └── Writing_Fragments

Contents of each directory are explained here:

* Thesis: Contains the `Thesis.tex` file, which is the master assembly document.
* Appendicies: Put all the Appendicies here
* Bibliography: contains the `library.bib` BiBTex file with all your references. Also contains the file `apalike.bst`, which controls the formating of the printed bibliography
* Chapters: Contains, as individual `*.tex` files, the chapters of the thesis.
* Figures: Contains subdirectores, one per thesis chapter
  * Figures/Chapter# : contains the `*.eps` and converted `*.pdf` files that are actually inserted into the final document
    * Figures/Chapter#/IllustratorFiles: Contains the original `*.ai` file with all the original information for each figures.
* Forms: the necessary GSBS forms for graduating
* Front Matter: Signature pages, abbreviations, etc... All the individual elements (in `*.tex`) form that make up the FrontMatter.
* LaTeXConfig: Contains two very important files. 1) `Thesis.cls` is the `\documentclass{}` file used by the master `Thesis.tex` file. Contains important formating information for the LaTeX engine. See here for Margin and macro information. Also contains the `shortcuts.tex` file, where you can keep all the gene name macros used in the thesis.
* Tables: Contains, in LaTeX form, all the tables inserted into the document.
  *Tables/ExcelDocuments: Working with table data in LaTeX sucks - be sure to keep the original Excel sheet, and use a site like [TableGenerator](http://www.tablesgenerator.com/latex_tables#) to convert them to LaTeX.
* Writing_fragments: For all those snippets of writing that you end up not using, or may use later.

### Configuring the `*tex` files

Because you're going to break up the TeX into multiple files and folders, it is important to add a *shabang* line to the top of every `*.tex` file, mostly so Sublime Text::LaTeXTools knows where to look for the Bibliography and References.  Add the following code to the top of EVERY `*.tex` file

`% !TEX root = $ROOT/Thesis/Thesis.tex` Where `$ROOT` = the directory off your root where you thesis files are stored, and `Thesis.tex` is the name of your control thesis `*.tex` file.

### Compiling the PDF File

To do this, you need to execute the following command:

    pdflatex RoyC_Umass_Thesis.tex

But the way I usually did this was to use the built-in build command in Sublime text's LaTeXTools package.

### Font sizes beyond `documentclass()`

You get a bunch of options to change the font size within the current enviroment (e.g. `\begin{quote}...\end{quote}`

    \tiny
    \scriptsize
    \footnotesize
    \small
    \normalsize
    \large
    \Large
    \LARGE
    \huge
    \Huge

### Table of contents

I have modified the `LaTeXConfig/Thesis.cls` so that it only shows sections *UP TO AND INCLUDING* `\subsection` **ONLY** using this command: `\setcounter{tocdepth}{2}` in  the file `FrontMatter/tablesOfContent.tex`

### Symbols ###

+ To make a quote, use the characters `This is a ``quoted'' Word`. That is two back ticks followed by the word(s) to be quoted, and then two single quotes.  LaTeX will turn this into a quotes opening and closing quotes when compiled
+ Primes - use `5\textprime~` or any version therefor. The tilde at the end is required to insert a space after the prime signal. `\usepackage{flexisym}` required.
+ ~ can (and should be) inserted with `\textasciitilde`
+ ˚ can (and should be) inserted with `$\,^{\circ}`
+ ˚C inserted with `$\,^{\circ}\mathrm{C}$`
+ ΔG˚ inserted w/ `$\Delta G^{\circ}$`

### Dashes ###

`-` = dash || in LaTeX type `-`
`–` = endash || in LaTeX type `--`
`—` = emdash || in LaTeX type `---`

Options for `\textendash` and `\textemdash` limit line breaks near the dash.

### Marking Text ###

+ Highlighting = `\underline{Text}`
+ Bold = `textbf{Bold Text}`
+ Italics = `\textit{Italicized Text}`

### Inserting Comments and Todos ###

+ See this [article](http://tex.stackexchange.com/questions/68530/making-corrections-during-review-of-other-people-latex-article)
+ Insert a Figure request w/ `\missingfigure{Comment Text}`
+ Insert a Comment box w/ `\todo[prepend]{Comment text}`
+ Insert On own line w/ `\todo[inline]{Comment Text}`
+ Insert with line pointing to specific point w/ `\todo[fancyline]{Comment Text}`
+ Insert a Editing bar w/ `\begin{changebar}` and `\end{changebar}`
+ Highlight text w/ `\hl{Highlighted Text}`

### Code Folding ###

+ Sections are Flush with side
+ Subsections = 2 spaces
+ Figures/Tables = 4 Spaces
+ Everything with 2 or more spaces from the line above is folded

`CMD+K, CMD+J` Unfolds everything
`CMD+K, CMD+3` Folds Figures.
`CMD+K, CMD+2` Folds Down to Subsections.
`CMD+K, CMD+1` Folds Down to Sections.

### References ###

1. Internal by Name = `\ref{labelName}``
    + **Don't reference by number! Hard to change later!**
    + Pick a structure and stick to it!
      + Example would be :
      1. `\label{Intro:sec:piRNAs}`
      2. `\label{Intro:subsec:piRNA precursors are long}`
2. Internal tied to text = `\hyperref[labelName]{TEXT}` **NB:square brackets!**
3. External (eg. to website) = `\href{http://www.fao.index.html}{Text}`
4. Insert a bare, but click able url = `\url{http://www.place.com}`


### Designing Figures ###

* Save an Illustrator file (`.ai`)
* Do not exceed 5.75” wide x 8” high
* Always construct in Illustrator, save as `*.ai` file. This is the Master
* Always save and insert as `*.eps`.

### Inserting Figures ###

* NO PERIODS IN FIGURE FILE NAMES! LaTeX infers extension after the first period.
* Use the following code structure for inserting figures:

```TeX
    \begin{figure} % FIGURE COMMENT NAME  
      \centering  
      \includegraphics{Figures/FIGURE_PATH.eps}  
      \caption[FIGURE TOC NAME]  
      {FIGURE CAPTION TITLE \\  
        FIGURE CAPTION TEXT  
        }  
      \label{fig:FIGURE LINK NAME}  
      \end{figure}  
```

### Inserting Tables

To insert a figure, which can look really awful in LaTeX format, put into a separate file, stored in the `$ROOT/Tables` subdirectory, a `*.tex` file containing the LaTeX table information with the following structure:

```TeX
\begin{tabular}
...table LaTeX...
  \end{tabular}
```

Then, in the main text where you want the table inserted, use the following syntax:

```TeX
\begin{table} % TABLE NOTE
  \caption[TOC TITLE]
    {
     TEXT TITLE: CAPTION
     }
   \label{CHAPTER:tab:LABEL NAME}
   \input{Tables/FILENAME}
   \end{table}
```

### Make a webpage/Word Doc from thesis LaTex ###

**This does not work very well!** It generates many errors during compiling.

Drop to terminal and type:

    htlatex RoyC_Umass_Thesis.tex "-dHTML" "--interaction=nonstopmode"

Again, you will have to `enter` through *numerous* errors.

Once this is done, open HTML in Word.


### Be consistent!

Refer to [here](http://public.wsu.edu/~brians/errors/errors.html) for information.

+ watch for Compl{e/i}mentarity. You want the `e`
+ `\textit{in vivo}` and `\textit{in vitro}`
+ PIWI-piRISC
+ `5\textprime~7meG CAP`
+ poly(A)+
+ Three things: (1);(2); and (3).
+ RNA-templated DNA-DNA ligation
+ `\{Some thing Interacting with:: Something else\}`

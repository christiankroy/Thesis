# Umass Thesis in LaTeX

### [Christian K Roy](christiankroy@gmail.com) ###
### 2014-04-21 ###


### Getting Setup ###

1. Obtain a good text editor. I used Sublime Text 2 with some packages installed:
    * `Monokai Extended` | Color Scheme for coding editing
    * LaTeXTools | Adds some LaTeX functality
      * Change the cite panel format to `"cite_panel_format": ["({keyword}) {title} - {journal}"],`
    * CheckBounce | For spell checking `http://www.sublimetext.com/forum/viewtopic.php?f=5&t=11692`
    * Markdown Extended | Allows for Syntax Markdown Highlighting in Sublime Text
2. Use a Reference manage that keeps a `*.bib` file of your entire library synced.
3. Fill out the folder structure.

### File and Folder Structure ###

For purposes of organisation, use the following folder setup:

```
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
│   └── ExcelDocuments
└── Writing_Fragments
```
Contents of each directory are explained here:

* Thesis: Contains the `Thesis.tex` file, which is the master assembly document.
* Appendicies: Put all the Appendicies here
* Bibliography: contains the `library.bib` BiBTex file with all your references. Also contains the file `apalike.bst`, which controls the formating of the printed bibliography
* Chapters: Contains, as individual `*.tex` files, the chapters of the thesis.
* Figures: Contains subdirectores, one per thesis chapter
  * Figures/Chapter# : contains the `*.eps` and converted `*.pdf` files that are actually inserted into the final document
    * Figures/Chapter#/IllustratorFiles: Contains the original `*.ai` file with all the original information for each fiures.
* Forms: the necessary GSBS forms for graduating
* Front Matter: Signature pages, abbreviations, etc... All the individual elements (in `*.tex`) form that make up the FrontMatter.
* LaTeXConfig: Contains two very important files. 1) `Thesis.cls` is the `\documentclass{}` file used by the master `Thesis.tex` file. Contains important formating information for the LaTeX engine. See here for Margin and macro information. Also contains the `shortcuts.tex` file, where you can keep all the gene name macros used in the thesis.
* Tables: Contains, in LaTeX form, all the tables inserted into the document. 
  *Tables/ExcelDocuments: Working with table data in LaTeX sucks - be sure to keep the original Excel sheet, and use a site like [TableGenerator](http://www.tablesgenerator.com/latex_tables#) to convert them to LaTeX.
* Writing_fragments: For all those snippets of writing that you end up not using, or may use later.

### Setting up Sublime Text 2 ###

Because you're going to break up the TeX into multiple files and folders, it is important to add a *shabang* line to the top of every `*.tex` file, mostly so Sublime Text::LaTeXTools knows where to look for the Bibliography and References.  Add the following code to the top of EVERY `*.tex` file

`% !TEX root = $ROOT/Thesis/Thesis.tex` Where `$ROOT` = the directory off your root where you thesis files are stored, and `Thesis.tex` is the name of your control thesis `*.tex` file.


### Table of contents

I have modified the `LaTeXConfig/Thesis.cls` so that it only shows sections *UP TO AND INCLUDING* `\subsection` **ONLY** using this command: `\setcounter{tocdepth}{2}` in  the file `FrontMatter/tablesOfContent.tex`

### Symbols ###

+ To make a quote, use the characters `This is a ``quoted'' Word`. That is two backticks followed by the word(s) to be quoted, and then two single quotes.  LaTeX will turn this into a quotes openning and closing quotes when compiled
+ Primes - use `5\textprime~` or any version therefor. The tilde at the end is required to insert a space after the prime signal. `\usepackage{flexisym}` required.
+ ~ can (and should be) inserted with `\textasciitilde`
+ ˚ can (and should be) inserted with `\degree`

### Marking Text ###

+ Highlighting = `\underline{Text}`
+ Bold = `textbf{Bold Text}`
+ Italics = `\textit{Italicized Text}`

### Inserting Comments and Todos ###

+ See this article http://tex.stackexchange.com/questions/68530/making-corrections-during-review-of-other-people-latex-article
+ Insert a Figure request w/ `\missingfigure{Comment Text}`
+ Insert a Comment box w/
    * `\todo[prepend]{Comment text}`
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
    + Pick a strucutre and stick to it!
      + Example would be :
      1. `\label{Intro:sec:piRNAs}`
      2. `\label{Intro:subsec:piRNA precurors are long}`      
2. Internal tied to text = `\hyperref[labelName]{TEXT}` **NB:square brackets!**
3. External (eg. to website) = `\href{http://www.fao.index.html}{Text}`
4. Insert a bare, but clickable url = `\url{http://www.place.com}`


### Designing Figures ###

* Save an Illustrator file (`.ai`)
* Do not exceed 5.75” wide x 8” high
* Always construct in Illustrator, save as `*.ai` file. This is the Master
* Always save and insert as `*.eps` according to max dementions of margin.
  * Use of `*.eps` allows you to easily make an HTML version of the document

### Inserting Figures ###

* NO PERIODS IN FIGURE FILE NAMES! LaTeX infers extention after the first period.
*. Use the following code structure for inserting figures:

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

### Inserting Figures

To insert a figure, which can look really last in LaTeX format, put into a seperate file, stored in the `$ROOT/Tables` subdirectory, a `*.tex` file containing the LaTeX table information with the following structure:

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

Drop to terminal and type `htlatex thesis.tex`
Once this is done, open HTML in Word




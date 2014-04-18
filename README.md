Thesis
===========

My 2014 UMMS Thesis

# General notes #

### Getting Setup ###

1. Obtain a good text editor. I used Sublime Text 2 with some packages installed:
    * `Monokai Extended` | Color Scheme for coding editing
    * LaTeXTools | Adds some LaTeX functality
      * Change the cite panel format to `"cite_panel_format": ["({keyword}) {title} - {journal}"],`
    * CheckBounce | For spell checking `http://www.sublimetext.com/forum/viewtopic.php?f=5&t=11692`
    * Markdown Extended | Allows for Syntax Markdown Highlighting in Sublime Text
2. Use a Reference manage that keeps a `*.bib` file of your entire library synced.
3. Fill out the folder structure.

### Table of contents

I have modified the `LaTeXConfig/Thesis.cls` so that it only shows sections *UP TO AND INCLUDING* `\subsection` **ONLY** using this command: `\setcounter{tocdepth}{2}` in  the file `FrontMatter/tablesOfContent.tex`

### Symbols ###

+ To make a quote, use the characters `This is a ``quoted'' Word`. That is two backticks followed by the word(s) to be quoted, and then two single quotes.  LaTeX will turn this into a quotes openning and closing quotes when compiled
+ Primes - use `5\textprime~` or any version therefor. The tilde at the end is required to insert a space after the prime signal. `\usepackage{flexisym}` required.
+ ~ can (and should be) inserted with `\textasciitilde`
+ ˚ can (and should be) inserted with `\degree

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


### Figures ###

1. Always construct in Illustrator, save as `*.ai` file. This is the Master
2. Always save and insert as `*.eps` according to max dementions of margin.
3. Use of `*.eps` allows you to easily make an HTML version of the document
4. Use the following code structure for inserting figures

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

### Make a webpage/Word Doc from thesis LaTex ###

Drop to terminal and type `htlatex thesis.tex`
Once this is done, open HTML in Word




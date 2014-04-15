Thesis
===========

My 2014 UMMS Thesis

# General notes #

### Getting Setup ###

1. Obtain a good text editor. I used Sublime Text 2 with some packages installed
    * LaTeXTools | Adds some LaTeX functality
      * Change the cite panel format to `"cite_panel_format": ["({keyword}) {title} - {journal}"],`
    * CheckBounce | For spell checking `http://www.sublimetext.com/forum/viewtopic.php?f=5&t=11692`
2. Use a Reference manage that keeps a `*.bib` file of your entire library synced.
3. Fill out the folder structure.

### Symbols ###

+ To make a quote, use the characters `This is a ``quoted'' Word`. That is two backticks followed by the word(s) to be quoted, and then two single quotes.  LaTeX will turn this into a quotes openning and closing quotes when compiled
+ Primes - use `5\textprime~` or any version therefor. The tilde at the end is required to insert a space after the prime signal. `\usepackage{flexisym}` required.
+ ~ can (and should be) inserted with `\textasciitilde`
+ ˚ can (and should be) inserted with `\degree

### Marking Text ###

+ Highlighting = `\underline{Text}`
+ Bold = `textbf{Bold Text}`
+ Italics = `\textit{Italicized Text}`

### Comments ###

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
2. Internal tied to text = `\hyperref[labelName]{TEXT}` **NB:square brackets!**
3. External (eg. to website) = `\href{http://www.fao.index.html}{Text}`
4. Insert a bare, but clickable url = `\url{http://www.place.com}`


### Figures ###

1. Always construct in Illustrator, save as `*.ai` file. This is the Master
2. Always save and insert as `*.eps` according to max dementions of margin.
3. Use of `*.eps` allows you to easily make an HTML version of the document
4. Use the following code structure for inserting figures


    \begin{figure}[htbp] % FIGURE COMMENT NAME  
      \centering  
      \includegraphics{Figures/FIGURE_PATH.eps}  
      \caption[FIGURE TOC NAME]  
      {FIGURE CAPTION TITLE \\  
        FIGURE CAPTION TEXT  
        }  
      \label{fig:FIGURE LINK NAME}  
      \end{figure}  


### Make a webpage/Word Doc from thesis LaTex ###

Drop to terminal and type `htlatex thesis.tex`
Once this is done, open HTML in Word

### Chatper 1 - Introduction #

Priority of work:

1. piRNA seciton
2. Dscam1 Hattori section needs work
3. Beginning of Nucleic acid splicing section needs work

### Chapter 2 - SeqZip paper ###

+ Insert the current draft on 2014-04-18

### Chapter 3 - MolCel2013 #

+ What to do with tables[1–3] For MolCel2013?
    * Currently `\hl{table #}` in the text

### Chapter 4 - SeqZip methodology #

+ Continue filling in the experimental descriptions

### Chapter 5 - Discussion ###

+ Needs to most work!
+ Write up the SeqZip assay improvements
+ Read Papers from Akiko about single molecule Fish
    + How to apply this to the precursors? 





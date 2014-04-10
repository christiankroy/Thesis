Thesis
===========

My 2014 UMMS Thesis

# General notes #

### Getting Setup ###

1. Obtain a good text editor. I used Sublime Text 2 with some packages installed
    * LaTeXTools | Adds some LaTeX functality
    * CheckBounce | For spell checking `http://www.sublimetext.com/forum/viewtopic.php?f=5&t=11692`
2. Use a Reference manage that keeps a `*.bib` file of your entire library synced.
3. Fill out the folder structure.

### Symbols ###

+ To make a quote, use the characters `This is a ``quoted'' Word`. That is two backticks followed by the word(s) to be quoted, and then two single quotes.  LaTeX will turn this into a quotes openning and closing quotes when compiled
+ Primes - use `5\textprime~` or any version therefor. The tilde at the end is required to insert a space after the prime signal. `\usepackage{flexisym}` required.
+ ~ can (and should be) inserted with `\textasciitilde`

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

1. Internal by number = `\ref{labelName}``
2. Internal tied to text = `\hyperref[labelName]{TEXT}` **NB:square brackets!**
3. External (eg. to website) = `\href{http://www.fao.index.html}{Text}`
4. Insert a bare, but clickable url = `\url{http://www.place.com}`


### Figures ###

1. Always construct in Illustrator, save as `*.ai` file. This is the Master
2. Always save and insert as `*.eps` according to max dementions of margin.
3. Use of `*.eps` allows you to easily make an HTML version of the document

### Make a webpage from thesis LaTex ###

Drop to terminal and type `htlatex thesis.tex`

### Introduction #

+ Clean up the transitions in the introduction
    * I feel pretty good about the Locust lead in. I think I should stop working on that part now.

### Chapter 2 - SeqZip methodology #

### Chapter 3 - SeqZip paper

### Chapter 4 - MolCel2013 #

+ What to do with tables[1–3] For MolCel2013?
    * Currently 'hl{table #}' in the text

### Chapter 5 - Discussion ###

### Appendix B #
 
 piRNA resources paper.




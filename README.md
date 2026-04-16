[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
# VU Dissertation Template

This template for large LaTeX projects is perfect for PhD dissertations. It is developed with the Vrije Universiteit Amsterdam in mind.

## Installation

Press 'use this template' to start using the template in your own repository. All dependencies are on CTAN, and are included in modern distributions of MiKTeX and TeX Live.

## Setup

This template consists of four parts, split into four folders. I will explain each part in this section.

The general idea is that the dissertation is split up in several subdocuments. The benefit of doing this is that compilation of each chapter will be much faster than compiling the document every time you want to look at the output. To this end, we use the `docmute` package.

### Main

This folder only contains `thesis.tex`, which is the final complete thesis. Its only purpose is to combine the chapters (and bibliography, index, table of contents, etc.) into one final product; no actual content exists within the file. In most cases, you shouldn't put any other files here.

### Subfiles

These are the individual chapters of the dissertation. If you want to add a chapter, just duplicate another chapter, and change `%!TeX root = [filename]` to reflect the new file. Then import the file in `thesis.tex` through `\input{subfiles/filename}`. It is very important to NEVER change the preamble of the subfiles, so beyond the TeX root, you should only change the document body.


### Scripts

In this folder, we have everything technical that is included in the document. Most importantly, we have the preamble files. More information about these can be found in [the preamble section](#preamble). The takeaway should be that any changes to the preamble should be done HERE, not in the `.tex` files.

This folder also contains the [bibliography](#bibliography), [metadata](#metadata) and [accessibility](#accessibility) files. One may alter these to fit your usage case.

### Images

Here you can put all your images to be included in the document.

## Compilation

I advise compiling the files using the following recipe:
```
(lualatex -> biber ->) lualatex -> lualatex
```
The first part is only necessary for compiling the bibliography.

## Preamble

The template has two preamble files, `scripts/globalpreamble.sty` and `scripts/preamble.cls`. `globalpreamble.sty` should be used for macros and packages that do not interact with the visuals of a document, such that it can be used for non-thesis documents, such as a `beamer` presentation. `preamble.cls` defines the document class used by all thesis documents, and anything put in here should NOT be included in other documents.

You can add your own packages and macros to the preambles (in fact, it is encouraged) by adding it to the bottom of these files. Do NOT edit the preamble of subfiles, to make sure all documents share the same preamble.

## Bibliography

The bibliography is made using `biblatex`, not `natbib`. Therefore, one should use `biber` instead of `bibtex`.

The bibliography file can be found at `scripts/references.bib`.

## Index

By default, this template produces two indices. One for notation (which should list entries such as $H^\bullet(X;\mathbb{Z})$), and another for general terms (such as "Singular cohomology"). To add an entry to the index, use `\index[notation]{\(H^\bullet(X;\mathbb{Z})\)}` or `\index{Singular cohomology}`. More information about index syntaxing can be found in section 2.2 of the [makeindex documentation](https://nl.mirrors.cicku.me/ctan/indexing/makeindex/doc/makeindex.pdf), or on the [WikiBooks article on the subject](https://en.wikibooks.org/wiki/LaTeX/Indexing#Sophisticated_indexing).

I advise using the index for dissertations, since a reader may go through them nonlinearly, or forget about a term/notation last used two chapters ago. The index helps in these cases. Indices can be disabled in `main.tex` by commenting out the `\printindex` macros at the bottom. =

## `reptheorem`

This template uses `reptheorem` to repeat theorems across the document (even in different subfiles). To repeat a theorem, replace a theorem environment
```
\begin{foo}
Bar
\end{foo}
```
with
```
\begin{makethm}{foo}{thm:baz}[Baz]
Bar
\end{makethm}
```
where `foo` is the theorem type, `thm:baz` is the label (which is mandatory) and `Baz` is the theorem name. You can then repeat it in your document using
```
\repthm{thm:baz}[Alt text]
```
where the alt text will print whenever the theorem cannot be found.

The file containing all theorems is only updated when `thesis.tex` is run, so make sure to do so regularly.

For more information, see https://ctan.org/pkg/reptheorem.

## Page and font size, margins

The page size is set to 17x24 cm. This standard has no official name (though often referred to as B5, which in reality is slightly larger), but is used for all Dutch PhD dissertations. The font size is set to 12pt, since it's the font size generally recommended for accessibility reasons.

Most PhD dissertations (which I've seen) are typeset at 11pt or 12pt, but in A4 size. When the thesis is then printed, the entire page is shrunk down. This leads to an effective font size of around 9pt to 10pt. You can see this from the fact that most PhD thesis can contain about 45 lines of text on a single page, whereas this template can only take 38.

If you want your text to be smaller, change the fontsize in `preamble.cls` to 10pt, or use a package to crank it down to 9pt. I strongly advise against setting the page size to A4 to force the font size, since this will decrease the control you have over the layout of your page.

The default margins (in `preamble.cls`) are set to 2 cm, with an extra 0.69 cm on the inner margin (for binding reasons). Be sure to discuss these values with your printer; my values only approximate general advice, and I chose them specifically such that `\textheight/\textwidth` is the golden ratio (maybe it'll bring you luck!). So unless you value following in Gutenberg's biblical footsteps, please ask the professionals what these values should be.

## Metadata

This template uses `hyperxmp` to set the metadata of your document. You can find and set the metadata under `scripts/metadata.sty`.

For more information, see https://ctan.org/pkg/hyperxmp.

## Accessibility

This template can optionally be set up to be compliant with PDF/UA-2, the accessibility standard for PDFs. Please refer to the [LaTeX tagging project](https://latex3.github.io/tagging-project/documentation/usage-instructions) for more informtaion. Specifically, one should remember to tag figures, tables, and lists, and that there may be some incompatibilities with packages. Moreover, using LuaLaTeX is highly advised due for compatibility reasons. Tagging is disabled by default. One may enable it by changing `\def\@ccessibility{f}` to `\def\@ccessibility{t}` in `accessibility.sty`.

One of the most obvious changes from enabling accessibility options is that the default `hyperref` colours will change. The new colours are easier to see for colourblind people. See [the hyperref-generic documentation](https://mirrors.mit.edu/CTAN/macros/latex/contrib/pdfmanagement-testphase/hyperref-generic.pdf#subsection.0.7.2) for more information. It also describes how to revert to legacy colours if preferred.

When using accessibility mode, there are some clashes between `mathtools` and `unicode-math`. This results in some macros being defined as in `mathtools` and others as in `unicode-math`. I have disabled the warning that it produces (since it's working completely as intended). More information can be found in [this StackExchange thread](https://tex.stackexchange.com/questions/660012/warning-when-unicode-math-and-mathtools-are-loaded).

## License

[MIT](https://choosealicense.com/licenses/mit/)


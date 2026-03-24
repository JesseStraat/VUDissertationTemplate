[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
# Thesis Template

This template for large LaTeX projects is perfect for theses. It is developed with Utrecht University in mind.


## Installation

Press 'use this template' to start using the template in your own repository. All dependencies are on CTAN, and are included in modern distributions of MiKTeX and TeX Live.

## Preamble

The template has two preamble files, `globalpreamble.sty` and `preamble.cls`. `globalpreamble.sty` should be used for macros and packages that do not interact with the visuals of a document, such so it can be used for non-thesis documents, such as a `beamer` presentation, in the future. `preamble.cls` defines the document class used by all thesis documents, and anything put in here will NOT be included in other documents.

You can add your own packages and macros to the preambles (in fact, it is encouraged) by adding it to the bottom of these files. Do NOT edit the preamble of subfiles, to make sure all documents share the same preamble.

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

## Metadata

This template uses `hyperxmp` to set the metadata of your document. You can find and set the metadata under `metadata.sty`.

For more information, see https://ctan.org/pkg/hyperxmp.

## Logos

I do not own the Utrecht University logo, nor can I give anyone permission to use it. For more information, see [here](https://www.uu.nl/en/organisation/corporate-identity/guidelines/logo)

## License

For everything besides the UU logo:
[MIT](https://choosealicense.com/licenses/mit/)


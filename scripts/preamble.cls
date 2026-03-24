\LoadClass[12pt,twoside]{report}

\usepackage{imakeidx}							% Index
\usepackage{scripts/globalpreamble}
\usepackage{reptheorem}							% Theorem replication

\RequirePackage{scripts/metadata}
\RequirePackage[ocgcolorlinks]{ocgx2}			% This ensures hyperlinks aren't printed (ocgcolorlinks), while still being able to cover multiple lines (as opposed to ocgcolorlinks in hyperref)
\usepackage[a4paper,margin=2.5cm]{geometry}		% Change the shape of a page (custom margins etc.)

\usepackage{fancyhdr}							% Nicer layout
\usepackage{epigraph}							% For chapter quotes

\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\numberwithin{equation}{chapter}

\emergencystretch 2em

%%% This is about changing the headers and footers (i.e. Top and bottom of the page)
% Save chapters and sections to later add to header
\def\chaptermark#1{%
    \markboth {%
        #1}{}}%
\def\sectionmark#1{%
    \markright {%
        \ifnum \c@secnumdepth >\z@
            \thesection\ --- %
        \fi
        #1}}

% Makes index and bibliography mark normalcase
\indexsetup{headers={\indexname}{\indexname}}
\def\abx@MakeMarkcase{}
        

% Actual headers and footers %
\pagestyle{fancy}% use fancyheaders with the bar on the top
\fancyhf{} % Clear the normal style
\fancyhead[RE]{\bfseries\leftmark} % this places the section number and name in the top left
\fancyhead[RO,LE]{\bfseries\thepage} % page number
% Changing headheight to fit what's inside %
\fancyhead[LO]{\bfseries\rightmark}
\setlength{\headheight}{24pt}
\fancypagestyle{plain}{}

% Give empty pages different style %
\fancypagestyle{emptypg}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyhead[RO,LE]{\bfseries\thepage}
}
\renewcommand\cleardoublepage{%
    \clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{emptypg}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi
}

% Chapters must start on odd pages %
\@openrighttrue


% Implementing functions into actual preamble
\AtBeginDocument{\loadtheorems{main/thesis.thm}}

% Changes font of emph
\renewcommand{\emph}[1]{%
    \ifindefinition%
        \textbf{#1}%
    \else%
        \textsl{#1}%
    \fi%
}


%% ADD YOUR OWN CODE HERE %%
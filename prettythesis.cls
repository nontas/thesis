\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prettythesis}

%% ========================== Default Values ========================== %%

\newcommand*{\@supervisor}{}
\newcommand*{\@university}{}
\newcommand*{\@college}{Imperial College London}
\newcommand*{\@department}{}
\newcommand*{\@field}{}
\newcommand*{\@degree}{}
\newcommand*{\@diploma}{}
\newcommand*{\@declaration}{}

%% ========================== User Variables ========================== %%

\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\college}[1]{\gdef\@college{#1}}
\newcommand*{\department}[1]{\gdef\@department{#1}}
\newcommand*{\field}[1]{\gdef\@field{#1}}
\newcommand*{\declaration}[1]{\gdef\@declaration{#1}}

%% ========================== Class declarations ========================== %%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions
\LoadClass{memoir}

%% =========================== Packages used ============================== %%
\RequirePackage[left=4.2cm,right=4.2cm,top=2.97cm,bottom=5.94cm]{geometry}
\RequirePackage{ucs}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[british]{babel}                % To use English hyphenation.
%\usepackage{multicol,multirow}
%\usepackage{microtype}
%\usepackage{type1cm}                    % Scale Computer Modern fonts properly
%\usepackage{tocloft}
\RequirePackage[pdftex]{graphicx}
\RequirePackage[pdftex,unicode,pagebackref=true,
 %colorlinks=true,citecolor=Black,linkcolor=Black,
 colorlinks=true,citecolor=PineGreen,linkcolor=BrickRed,
 pdffitwindow=true,
 pdfpagemode=UseNone,pdfpagelabels,
 plainpages=false,breaklinks=true] { hyperref}
%\fixpdflayout
%\usepackage{memhfixc}
	
%% ============================ Page geometry ============================= %%

\setstocksize          {297mm}{210mm}         % A4 page size
\settrimmedsize{\stockheight}{\stockwidth}{*} % page same size as stock (no trim)
\setlrmarginsandblock{27mm}{26mm}{*}          % inner / outer margin
\setulmarginsandblock{40mm}{40mm}{*}          % top / bottom margin
\setheadfoot           {5mm}{15mm}            % Head height / foot skip
\setheaderspaces       {*}{5mm}{*}            % Head drop / head sep
%\setlength{\parindent} {2em}
%\setlength{\parskip}   {0.5\baselineskip}
\checkandfixthelayout                         % make sure everything adds up


% numbering of chapter, section, table, figure, and equation:
\renewcommand{\thechapter}      {\arabic{chapter}}
\renewcommand{\thesection}      {\thechapter.\arabic{section}}
\renewcommand{\thesubsection}   {\thesection.\arabic{subsection}}
\renewcommand{\thetable}        {\thechapter.\arabic{table}}
\renewcommand{\thefigure}       {\thechapter.\arabic{figure}}
\renewcommand{\theequation}     {\thechapter.\arabic{equation}}

% redefine some standard LaTeX words
\def\captionsenglish{
        \def\chaptername    {Chapter}
        \def\contentsname   {Contents}
        \def\appendixname   {Appendix}
        \def\bibname        {Bibliography}
}

%% =========================== General options ============================ %%

%\sloppy                                % suppress hyphenation
%\trimFrame                             % To use full lines for trimming
%\trimXmarks                             % To use corners for trimming
%\leavespergathering{8}					% If specific # of pages required by publisher

\maxsecnumdepth{subsection}             % Section numbering depth
\maxtocdepth{section}                   % Table of contents depth

\newcommand {\halfendline}  {\\[5pt]}   % Endlines
\newcommand {\fullendline}  {\\[11pt]}

\newcommand {\ptext}[1]     {\small #1} % text in figures slightly smaller
\def\pshlabel#1{\small #1}
\def\psvlabel#1{\small #1}

\newcommand{\tablesettings}{            % settings for a table
\renewcommand{\arraystretch}{1.3}
\renewcommand{\baselinestretch}{1.5}
\setlength\doublerulesep{0pt}
\doublerulesepcolor{black}\center
}

%% Ensure no bad boxes if page count reaches three figures
\renewcommand{\@pnumwidth}{2em}
\renewcommand{\@tocrmarg}{3em}


%% ============================= Page Style =============================== %%

\makeatletter
\setlength\midchapskip{10pt}

\makechapterstyle{combined}{
  \setlength{\midchapskip}{-60pt}
  \setlength{\afterchapskip}{2.5cm}
  \renewcommand*{\printchaptername}{}
  \renewcommand*{\chapnumfont}{\normalfont\sffamily\bfseries\fontsize{80}{0}\selectfont}
  \renewcommand*{\printchapternum}{\flushright\chapnumfont\textcolor[rgb]{.64,.79,.87}{\thechapter}}
  \renewcommand*{\chaptitlefont}{\normalfont\sffamily\Huge\bfseries}
  \renewcommand*{\printchaptertitle}[1]{%
    \raggedright\chaptitlefont\parbox[t]{\textwidth-3cm}{\raggedright##1}}
}



\makechapterstyle{TUDelft}{
\renewcommand\chapternamenum{}
\renewcommand\printchaptername{}
\renewcommand\chapnamefont{\Large\scshape\centering}
\renewcommand\printchapternum{%
\chapnamefont\null
\@chapapp\space\thechapter}
\renewcommand\printchapternonum{%
\par\vskip\midchapskip
\hrule\vskip\midchapskip}
\renewcommand\chaptitlefont{
\Huge\scshape\centering
}
\renewcommand\afterchapternum{%
\par\nobreak\vskip\midchapskip\hrule\vskip\midchapskip}
\renewcommand\afterchaptertitle{%
\par\vskip\midchapskip \hrule \nobreak\vskip\afterchapskip}
\setsecheadstyle{\Large\bfseries\raggedright}
\setsubsecheadstyle{\large\bfseries\raggedright}
}

\makepagestyle{TUDelft}
\makerunningwidth{TUDelft}{\textwidth}
\makeheadposition{TUDelft}{}{}{}{}
\makeheadrule{TUDelft}{\textwidth}{\normalrulethickness}
\makepsmarks{TUDelft}{\@ruledmarks}
\makeevenhead{TUDelft}{\normalfont\slshape\leftmark}{}{}
\makeoddhead{TUDelft}{}{}{\normalfont\slshape\rightmark}
\makeevenfoot{TUDelft}{\slshape\thepage}{}{}
\makeoddfoot{TUDelft}{}{}{\slshape\thepage}

\makepagestyle{FooterOnly}
\makerunningwidth{FooterOnly}{\textwidth}
\makeheadposition{FooterOnly}{}{}{}{}
%\makeheadrule{FooterOnly}{\textwidth}{\normalrulethickness}
\makepsmarks{FooterOnly}{\@ruledmarks}
\makeevenhead{FooterOnly}{}{}{}
\makeoddhead{FooterOnly}{}{}{}
\makeevenfoot{FooterOnly}{\slshape\thepage}{}{}
\makeoddfoot{FooterOnly}{}{}{\slshape\thepage}

\copypagestyle{TUDedication}{empty}
\makeevenfoot{TUDedication}{}{}{}
\makeoddfoot{TUDedication}{}{}{\slshape\thepage}

\copypagestyle{TUDchapter}{TUDelft}
\makeheadrule{TUDchapter}{\textwidth}{0em}
\makeoddfoot{TUDchapter}{}{}{\slshape\thepage}



%% ============================== Formatting ============================== %%

\let\thesis@frontmatter=\frontmatter
\def\frontmatter{
  \thesis@frontmatter
  \setlength{\parindent}{0em}             % Set indentation in frontmatter
  \setlength{\parskip}{0\baselineskip}
  \pagestyle{empty}
  \aliaspagestyle{chapter}{TUDelft}
  \aliaspagestyle{cleared}{TUDelft}
}


\let\thesis@mainmatter=\mainmatter
\def\mainmatter{
  \thesis@mainmatter
  \setlength{\parindent}{1em}             % Set indentation in main
  \setlength{\parskip}{0.5\baselineskip}
%  \setlength{\parskip}{0.6ex}
%  \widowpenalty=7000
%  \clubpenalty=5000
  \chapterstyle{madsen}
  \pagestyle{TUDelft}                   % Change to the pagestyle
  \aliaspagestyle{chapter}{TUDchapter}
  \aliaspagestyle{cleared}{TUDelft}
}

\let\thesis@backmatter=\backmatter
\def\backmatter{
  \thesis@backmatter
  \setlength{\parindent}{1em}             % Set indentation in backmatter
  \setlength{\parskip}{0.5\baselineskip}
  \chapterstyle{reparticle}
  \aliaspagestyle{cleared}{TUDelft}
}

%% ============================ Title Page ================================ %%

\newcommand{\titlepage}{
%\begin{titlepage}
 \par
 \clearpage
% \thispagestyle{\titlepagestyle}
 \thispagestyle{empty}
 \noindent\begin{minipage}[t]{\textwidth}
  \centering\large
  \ifx\@university\@empty \else \@university\par\fi
  \@college
  \ifx\@department\@empty \else \par Department of \@department\fi
 \end{minipage}
 \null\vfill
 \begin{center}
  {\huge\textbf \@title\par}
  \vskip 3em
  {\Large \lineskip 0.75em
  \begin{tabular}[t]{c}
   \@author
  \end{tabular}\par}
  \vskip 1.5em
  {\Large \@date \par}
  \vskip \z@ \@plus3fill
  \ifx\@supervisor\@empty \else
  {\Large Supervised by \@supervisor \par}
  \fi
  \vskip 3em
 \end{center}\par
 \noindent\begin{minipage}[b]{\textwidth}
  \centering
  Submitted in part fulfilment of the requirements for the degree of PhD in Computing
  and the Diploma of Imperial College London. 
  This thesis is entirely my own work, and, except where otherwise indicated, describes my own research.

 \end{minipage}
 \clearpage
 \thispagestyle{empty}
 \vspace*{\fill}
 \clearpage
%\end{titlepage}
}

%% ========================== Dedication page ============================= %%

\newcommand{\dedicationpage}{
\thispagestyle{empty}
\qquad
\vspace{50pt}

{\Large \textsl{
\hspace*{\fill}
\@dedicationtop \\ [0.25\baselineskip]
\hspace*{\fill}
\@dedicationmiddle \\ [0.25\baselineskip]
\hspace*{\fill}
\@dedicationbottom
}}

\vspace*{\fill}
\noindent \@support
\providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Dedication}{bm:Dedication}
\clearpage
}

\endinput

%% ======================================================================== %%

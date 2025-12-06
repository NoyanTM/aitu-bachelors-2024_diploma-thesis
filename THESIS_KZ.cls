
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{thesis_kz}[2022/01/27 v2.1 LaTeX document class for Kazakhstan PhD thesis by D.B. Nurseitov (nurseitovdb@gmail.com)]



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      Загружаем пакеты.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}			% закомментил т.к. не работает \uppercase для toc.
\RequirePackage[T2A]{fontenc}
\RequirePackage[russian]{babel}
\RequirePackage[intlimits]{amsmath}
\RequirePackage{amssymb}
%\RequirePackage{showkeys}
\RequirePackage{cite}
\RequirePackage[amsmath]{ntheorem}
\RequirePackage{soul}                   % пакет разряженных шрифтов.
%\RequirePackage[dvips]{graphicx}
%\RequirePackage{caption2}              % убрал т.к. определяется классом.
\RequirePackage{tabularx}               % Таблицы.
\RequirePackage{color}                  % Цвет.
%\RequirePackage{indentfirst}            % исправлено заменой \@afterindentfalse на \@afterindenttrue
%\RequirePackage{minted}

\ifx\pdfoutput\undefined                % подключение пакета рисунков:
\RequirePackage[dvips]{graphicx}        % LaTeX compiler
\else                                   %
\RequirePackage[pdftex]{graphicx}       % PDFLaTeX compiler
\fi                                     %

\allowdisplaybreaks

%   Определяем свой разреженный шрифт (soul).
%\sodef\so{}{2.8pt}{10pt}{9pt}

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
	\setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
	\setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
	\setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
	\setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
	\setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
	\setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
	\setlength\paperheight {\paperwidth}%
	\setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility
\@openrighttrue
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
	  \advance\leftmargin\bibindent
	  \itemindent -\bibindent
	  \listparindent \itemindent
	  \parsep \z@
	  }%
   \renewcommand\newblock{\par}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Опции пакета.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ExecuteOptions{a4paper,12pt,oneside,onecolumn,final,openright}
\ProcessOptions

\input{bk1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\if@twoside
  \def\ps@headings{%
	  \let\@oddfoot\@empty\let\@evenfoot\@empty
	  \def\@evenhead{\thepage\hfil\slshape\leftmark}%
	  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
	  \let\@mkboth\markboth
	\def\chaptermark##1{%
	  \markboth {\MakeUppercase{%
		\ifnum \c@secnumdepth >\m@ne
		  \if@mainmatter
			\@chapapp\ \thechapter. \ %
		  \fi
		\fi
		##1}}{}}%
	\def\sectionmark##1{%
	  \markright {\MakeUppercase{%
		\ifnum \c@secnumdepth >\z@
		  \thesection. \ %
		\fi
		##1}}}}
\else
  \def\ps@headings{%
	\let\@oddfoot\@empty
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
	\let\@mkboth\markboth
	\def\chaptermark##1{%
	  \markright {\MakeUppercase{%
		\ifnum \c@secnumdepth >\m@ne
		  \if@mainmatter
			\@chapapp\ \thechapter. \ %
		  \fi
		\fi
		##1}}}}
\fi
\def\ps@myheadings{%
	\let\@oddfoot\@empty\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}%
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
	\let\@mkboth\@gobbletwo
	\let\chaptermark\@gobble
	\let\sectionmark\@gobble
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Названия разделов
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\KZcontentsname{Contents}
\newcommand\chaptername{}       % Название главы должно быть пустым
\newcommand\KZbibname{Bibliography}

\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\indexname{Index}
%\newcommand\figurename{Figure}
%\newcommand\tablename{Мега таблица}
\newcommand\partname{Part}

%\renewcommand{\listingscaption}{Листинг}      % minted package

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Титульная страница.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
	{\LARGE \@title \par}%
	\vskip 3em%
	{\large
	 \lineskip .75em%
	  \begin{tabular}[t]{c}%
		\@author
	  \end{tabular}\par}%
	  \vskip 1.5em%
	{\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
	\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
	\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
	\long\def\@makefntext##1{\parindent 1em\noindent
			\hb@xt@1.8em{%
				\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
	\if@twocolumn
	  \ifnum \col@number=\@ne
		\@maketitle
	  \else
		\twocolumn[\@maketitle]%
	  \fi
	\else
	  \newpage
	  \global\@topnum\z@   % Prevents figures from going at top of page.
	  \@maketitle
	\fi
	\thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
	{\LARGE \@title \par}%
	\vskip 1.5em%
	{\large
	  \lineskip .5em%
	  \begin{tabular}[t]{c}%
		\@author
	  \end{tabular}\par}%
	\vskip 1em%
	{\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi

\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
%\newcommand\@chapapp{\chaptername}
\newcommand\@chapapp{}  % Пустое название заголовка для глав 
\newcommand\frontmatter{%
	\cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}}
\newcommand\mainmatter{%
	\cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}}
\newcommand\backmatter{%
  \if@openright
	\cleardoublepage
  \else
	\clearpage
  \fi
  \@mainmatterfalse}
\newcommand\part{%
  \if@openright
	\cleardoublepage
  \else
	\clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
	\onecolumn
	\@tempswatrue
  \else
	\@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
	\ifnum \c@secnumdepth >-2\relax
	  \refstepcounter{part}%
	  \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
	\else
	  \addcontentsline{toc}{part}{#1}%
	\fi
	\markboth{}{}%
	{\centering
	 \interlinepenalty \@M
	 \normalfont
	 \ifnum \c@secnumdepth >-2\relax
	   \huge\bfseries \partname~\thepart
	   \par
	   \vskip 20\p@
	 \fi
	 \Huge \bfseries #2\par}%
	\@endpart}
\def\@spart#1{%
	{\centering
	 \interlinepenalty \@M
	 \normalfont
	 \Huge \bfseries #1\par}%
	\@endpart}
\def\@endpart{\vfil\newpage
			  \if@twoside
				\null
				\thispagestyle{empty}%
				\newpage
			  \fi
			  \if@tempswa
				\twocolumn
			  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Теоремоподобные структуры
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\theoremseparator{.}                            % Указываем разделитель после номера теоремоподобных (ntheorem).

\newtheorem{theorem}{Theorem}[chapter]          % ВЫБОР КЛИЧЕК ДЛЯ ТЕОРЕМОПОДОБНЫХ
\newtheorem{corollary}{Corollary}[chapter]      % УТВЕРЖДЕНИЙ предлагается
\newtheorem{claim}{Claim}[chapter]        % зафиксировать для на
\newtheorem{lemma}{Lemma}[chapter]              % постоянной основе. Эти команды
\newtheorem{axiom}{Axiom}[chapter]            % устанавливают независимые
\newtheorem{definition}{Definition}[chapter]   % между собой счетчики теорем,
\newtheorem{example}{Example}[chapter]           % лемм и т.п., тело утверждения
\newtheorem{exercise}{Exercise}[chapter]      % отделяется от остального текста
\newtheorem{problem}{Problem}[chapter]           % стандартной отбивкой, заголовок
\newtheorem{hypot}{Hypothesis}[chapter]           % определяется кличкой и печатается выделенным
\newtheorem{remark}{Remark}[chapter]         % выделенным шрифтом
\newtheorem{proof}{Proof}

%   Переопределяем счетчики так, чтобы для ненулевых глав была двойная нумерация.
\renewcommand\thetheorem{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@theorem}
\renewcommand\thecorollary{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@corollary}
\renewcommand\theclaim{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@claim}
\renewcommand\thelemma{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@lemma}
\renewcommand\theaxiom{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@axiom}
\renewcommand\thedefinition{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@definition}
\renewcommand\theexample{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@example}
\renewcommand\theexercise{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@exercise}
\renewcommand\theproblem{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@problem}
\renewcommand\thehypot{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@hypot}
\renewcommand\theremark{\ifnum \c@chapter>\z@\thechapter.\fi\@arabic\c@remark}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Глава
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
\newcommand\chapter{\if@openright\clearpage\else\clearpage\fi
%%                    \thispagestyle{plain}%
					\thispagestyle{plain}%
					\global\@topnum\z@
					\@afterindenttrue   % Абзацный отступ в главе (ГОСТ 2.105 пункт 3.6)
					\secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
					   \if@mainmatter
						 \refstepcounter{chapter}%
						 \typeout{\@chapapp\space\thechapter.}%
						 \addcontentsline{toc}{chapter}%
							{\protect\rm\numberline{\thechapter}{#1}}  % Название пронумерованной главы в содержании.
							%{\protect\numberline{\chaptername\ \thechapter.\hss}\hskip 3.1em\relax #1}%
					   \else
						 \addcontentsline{toc}{chapter}{#1}%
					   \fi
					\else
					  \addcontentsline{toc}{chapter}{#1}%
					\fi
					\chaptermark{#1}%
					\addtocontents{lof}{\protect\addvspace{10\p@}}%
					\addtocontents{lot}{\protect\addvspace{10\p@}}%
					\if@twocolumn
					  \@topnewpage[\@makechapterhead{#2}]%
					\else
					  \@makechapterhead{#2}%
					  \@afterheading
					\fi}
%
%   Заголовок пронумерованной главы.
\def\@makechapterhead#1{%
%%  \vspace*{50\p@}%                                    % Без дополнительного верт.отступа перед названием нум.главы.
  {\parindent \z@ \raggedright \normalfont
%%  {\parindent \z@ \centering \normalfont
	\ifnum \c@secnumdepth >\m@ne
	  \if@mainmatter
%%        \huge\bfseries \@chapapp\space \thechapter
		\large\bfseries \@chapapp\space \thechapter\,
%%        \par\nobreak
%%        \vskip 20\p@
	  \fi
	\fi
	\interlinepenalty\@M
%%    \Huge \bfseries #1\par\nobreak
	\large \bfseries{#1}\par\nobreak       % Большой, жирный, верхний регистр. % 16.06.20 Верхний регистр убрали.
%%    \vskip 40\p@
	\vskip 1.7ex
  }}
% Ненумерованная глава.
\def\@schapter[#1]#2{\if@twocolumn
				   \@topnewpage[\@makeschapterhead{#1}]%
				 \else
				   \@makeschapterhead{#2}%
				   \@afterheading
				 \fi%
				 \addcontentsline{toc}{chapter}{\protect\rm #1}%
				 }

%   Заголовок не пронумерованной главы.
\def\@makeschapterhead#1{%
%%  \vspace*{50\p@}%                        % Без дополнительного отступа перед названием ненум.главой.
%%  {\parindent \z@ \raggedright
  {\parindent \z@ \centering
	\normalfont
	\interlinepenalty\@M
%%    \Huge \bfseries  #1\par\nobreak
	\large \bfseries{#1}\par\nobreak        % Заголовок не пронумерованных глав.
%%    \vskip 40\p@
	\vskip 1ex
  }}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Секция
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\section{\@startsection{section}{1}{22pt}                    % Отступ от левого края.
								   {1.7ex \@plus .2ex \@minus .2ex}     % Вертикальный отступ до заголовка.
								   {.01ex \@plus -.01ex}                % Вертикальный отступ после заголовка
																		% (знак минус \@minus означает печать следующего текста в подбор).
								   {\normalfont\large\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Подсекция
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\subsection{\@startsection{subsection}{2}{22pt}%
									 {1.7ex\@plus .2ex \@minus .2ex}    % Вертикальный отступ до заголовка.
									 {.01ex \@minus .01ex}              % Вертикальный отступ после заголовка.
									 {\normalfont\large\bfseries\raggedright}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Подподсекция
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
									 {1.7ex\@plus .2ex \@minus .2ex}    % Вертикальный отступ до заголовка.
									 {.01ex \@plus .01ex}               % Вертикальный отступ после заголовка.
%%                                     {\normalfont\normalsize\bfseries}}
									 {\normalfont\large\bfseries\raggedright}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Параграф
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Подпараграф
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
%                                       {3.25ex \@plus1ex \@minus .2ex}%
%                                       {-1em}%
%                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Определяем перечисления
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Список определений - с многострочной нежирной меткой 
\newenvironment{definitions}[1][3cm]{%     mdwlist package 
    \begin{basedescript}{%
        \desclabelwidth{#1} \desclabelstyle{\multilinelabel}
        \renewcommand{\makelabel}[1]{##1}%
    }%
}{%
\end{basedescript}%
}
%
%----------
% Список обозначений и сокращений 
\newenvironment{glossaries}[1][2cm]{%     mdwlist package 
    \begin{basedescript}{%
        \desclabelwidth{#1}
        \renewcommand{\makelabel}[1]{##1}%
    }%
}{%
\end{basedescript}%
}
%----------
\newcounter{KZlisti}
\renewenvironment{enumerate}
			   {\list{\arabic{KZlisti}\hfill}{
					\usecounter{KZlisti}
					\topsep 0ex
					\itemsep 0ex
					\parsep 0ex
					\itemindent 0em
					\labelwidth 1.5em
					\labelsep 0.1em
					\leftmargin 1.5em
					%\itemindent-\leftmargin
					}
			   }
			   {\endlist}
%
\renewenvironment{itemize}
				{\list{-}{
					\parsep=0mm
					\topsep=0ex
					\itemsep=0ex
					\itemindent=2.5em
					\leftmargin=0cm
					\labelsep=0.5em
					}
				}
				{\endlist}
%
\newenvironment{description}
			   {\list{}{\labelwidth\z@ \itemindent-\leftmargin
						\let\makelabel\descriptionlabel}}
			   {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
								\normalfont\bfseries #1}
\newenvironment{verse}
			   {\let\\\@centercr
				\list{}{\itemsep      \z@
						\itemindent   -1.5em%
						\listparindent\itemindent
						\rightmargin  \leftmargin
						\advance\leftmargin 1.5em}%
				\item\relax}
			   {\endlist}
\newenvironment{quotation}
			   {\list{}{\listparindent 1.5em%
						\itemindent    \listparindent
						\rightmargin   \leftmargin
						\parsep        \z@ \@plus\p@}%
				\item\relax}
			   {\endlist}
\newenvironment{quote}
			   {\list{}{\rightmargin\leftmargin}%
				\item\relax}
			   {\endlist}
\if@compatibility
\newenvironment{titlepage}
	{%
	  \cleardoublepage
	  \if@twocolumn
		\@restonecoltrue\onecolumn
	  \else
		\@restonecolfalse\newpage
	  \fi
	  \thispagestyle{empty}%
	  \setcounter{page}\z@
	}%
	{\if@restonecol\twocolumn \else \newpage \fi
	}
\else
\newenvironment{titlepage}
	{%
	  \cleardoublepage
	  \if@twocolumn
		\@restonecoltrue\onecolumn
	  \else
		\@restonecolfalse\newpage
	  \fi
	  \thispagestyle{empty}%
	  \setcounter{page}\@ne
	}%
	{\if@restonecol\twocolumn \else \newpage \fi
	 \if@twoside\else
		\setcounter{page}\@ne
	 \fi
	}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Приложения
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\appendixtag{Appendix}

\newcommand\appendix{\par
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \renewcommand\@chapapp{\appendixtag}%
    \renewcommand\thechapter{\@Alph\c@chapter}
}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

%

%   Сброс счетчика уравнений на каждой главе.
\@addtoreset {equation}{chapter}

%   Нумерация уравнений в нулевой главе (введение) одинарная,
%   в других главах №главы.№уравнения.
\renewcommand\theequation{%
	\ifnum \c@chapter>\z@%
		\thechapter.%
	\fi%
	\@arabic\c@equation
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Рисунки
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\renewcommand{\includegraphics}[2][]{\fbox{Figure \sf #2}}

\graphicspath{{figs/}}

%\renewcommand{\captionlabeldelim}{--}    % Использование точки в подписях на таблицы и рисунки (caption2).

\newcommand{\KZfigurename}{Figure}

\newcounter{figure}[chapter]
\renewcommand \thefigure
	 {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\large\KZfigurename~\thefigure}
\newenvironment{figure}
			   {\@float{figure}}
			   {\end@float}
\newenvironment{figure*}
			   {\@dblfloat{figure}}
			   {\end@dblfloat}
\newcommand{\captionlabel}{caplabel}

\long\def\KZfigurecaption#1[#2]{%
%    \par
%    \addcontentsline{\csname ext@#1\endsname}{#1}%
%        {\protect\numberline{}{\csname the@#1\endsname}{\ignorespaces #2}}%
	\begingroup
		\@parboxrestore
		\if@minipage
			\set@minipage
		\fi
		\normalsize
		\vskip 5cm
		\sbox\@tempboxa{#1}%
		\@tempboxa
%        \ifdim \wd\@tempboxa > \hsize
%            #1~--~#3\par
%        \else
%            \global \@minipagefalse
%            \hb@xt@\hsize{\box\@tempboxa\hfil}%
%        \fi
		\vskip 5cm
		%\@makecaption{\csname fnum@#1\endsname}{\ignorespaces #3}\par
	\endgroup
}

%\newif\if@cap@num
%\def\make@cap@num{\refstepcounter{figure}Рис.~\thefigure}
%\def\cap@text#1#2{\parbox[t]{#1}{\normalsize\if@cap@num\make@cap@num\ifx#2\else. \fi\fi#2}}
%\def\cap@exp#1#2[#3]{\parbox[t]{#1}{\normalsize\if@cap@num\make@cap@num. \fi#2:\\ \small #3}}
%\def\cap@box[#1]#2{\@ifnextchar[{\cap@exp{#1}{#2}}{\cap@text{#1}{#2}}}
%\def\make@cap{\@ifnextchar[{\cap@box}{\cap@box[\textwidth]}}
%\def\make@cap@nonum#1{\@cap@numfalse\make@cap}
%\def\KZcaption{\@ifnextchar*{\make@cap@nonum}{\@cap@numtrue\make@cap}}

%\setlength{\textfloatsep}{2pt}
\setlength{\intextsep}{20pt}            % Отступ между текстом и float'м (Львовский стр№330)
%\setlength{\floatsep}{-80pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Таблицы
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Определяем Y - опцию выравнивания колонок в таблице (tabularx).
\newcolumntype{Y}{>{\centering\arraybackslash}X}    % Гуссенс, Миттельбах, стр.134

% Добавляем вертикальный пробел для строк таблицы.
\setlength{\extrarowheight}{4pt}

\newcommand\KZtablename{Table}             %{\so{Таблица}}
\newcounter{table}[chapter]
\renewcommand \thetable
	 {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\large\noindent\KZtablename~\thetable}
\newenvironment{table}
			   {\@float{table}}
			   {\end@float}
\newenvironment{table*}
			   {\@dblfloat{table}}
			   {\end@dblfloat}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Подпись к таблице и рисункам
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{1.7ex\@plus .2ex \@minus .2ex}         %{10\p@}
\setlength\belowcaptionskip{1.7ex\@plus .2ex \@minus .2ex}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1~#2}%
  \ifdim \wd\@tempboxa > \hsize
	#1~--~#2\par
  \else
	\global \@minipagefalse
	\hb@xt@\hsize{\box\@tempboxa}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}          % Размер, отводимый на номер заглавия в содержании.
\newcommand\@tocrmarg{2.55em}           % Отступ справа для многострочного заглавия в содержании.
\newcommand\@dotsep{4.5}                % Густота точек в содержании.
\setcounter{tocdepth}{2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Содержание
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\tableofcontents{%
	\if@twocolumn
	  \@restonecoltrue\onecolumn
	\else
	  \@restonecolfalse
	\fi
	\@makeschapterhead{\MakeUppercase\KZcontentsname}
%    \chapter*{\uppercase{\contentsname}}
%        \@mkboth{%
%           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
%%    \@starttoc{toc}%
	\@starttoc{toc}%
	\if@restonecol\twocolumn\fi
	}
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
	\addpenalty{-\@highpenalty}%
	\addvspace{2.25em \@plus\p@}%
	\begingroup
	  \parindent \z@ \rightskip \@pnumwidth
	  \parfillskip -\@pnumwidth
	  {\leavevmode
	   \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
	   \nobreak
		 \global\@nobreaktrue
		 \everypar{\global\@nobreakfalse\everypar{}}%
	\endgroup
  \fi}
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
	\addpenalty{-\@highpenalty}%
	\vskip 0.0em \@plus\p@             % Вертикальный пробел в содержании между ненум.главами.
	\setlength\@tempdima{1.5em}%
	\begingroup
	  \parindent \z@ \rightskip \@pnumwidth
	  \parfillskip -\@pnumwidth
	  \leavevmode \bfseries
	  \advance\leftskip\@tempdima
	  \hskip -\leftskip
	  %%#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
	  #1\nobreak
	  \leaders\hbox to 0.91em {\hss.\hss}\hfil      % Заполняем многоточием.
	  \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
	  \penalty\@highpenalty
	\endgroup
  \fi
}
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\newcommand\listoffigures{%
	\if@twocolumn
	  \@restonecoltrue\onecolumn
	\else
	  \@restonecolfalse
	\fi
	\chapter*{\listfigurename
	  \@mkboth{\MakeUppercase\listfigurename}%
			  {\MakeUppercase\listfigurename}}%
	\@starttoc{lof}%
	\if@restonecol\twocolumn\fi
	}
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
	\if@twocolumn
	  \@restonecoltrue\onecolumn
	\else
	  \@restonecolfalse
	\fi
	\chapter*{\listtablename
	  \@mkboth{%
		  \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
	\@starttoc{lot}%
	\if@restonecol\twocolumn\fi
	}
\let\l@table\l@figure

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Список литературы.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Изменяем вывод команды \cite.
%\renewcommand\citeleft{/}
%\renewcommand\citeright{/}

%   Изменяем отображение цифр списка литературы.
\def\@biblabel#1{#1}    % Убираем [1] делаем просто цифру 1

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]{
	% Заголовок.
	\@makeschapterhead{\MakeUppercase\KZbibname}

	% Строка в содержании.
	\addcontentsline{toc}{chapter}{\rm\KZbibname}

	%%{\chapter*{\KZbibname
	%%   \@mkboth{\MakeUppercase\KZbibname}{\MakeUppercase\KZbibname}}%

	% Список ссылок.
	\list{\@biblabel{\@arabic\c@enumiv}}%
		   {\settowidth\labelwidth{\@biblabel{#1}}%
			\topsep 0ex     % /*
			\itemsep 0ex    % Без дополнительного вертикального отступа между записями литературы.
			\parsep 0ex     % */
			\itemindent 3em
			\leftmargin 0cm
			%\labelwidth 15mm
			\labelsep 0.5em
			%\advance\leftmargin\labelsep
			\@openbib@code
			\usecounter{enumiv}%
			\let\p@enumiv\@empty
			\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	  \sloppy
	  \clubpenalty4000
	  \@clubpenalty \clubpenalty
	  \widowpenalty4000%
	  \sfcode`\.\@m}
	 {\def\@noitemerr
	   {\@latex@warning{Empty `thebibliography' environment}}%
	  \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Предметный указатель.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newenvironment{theindex}
%               {\if@twocolumn
%                  \@restonecolfalse
%                \else
%                  \@restonecoltrue
%                \fi
%                \columnseprule \z@
%                \columnsep 35\p@
%                \twocolumn[\@makeschapterhead{\indexname}]%
%                \@mkboth{\MakeUppercase\indexname}%
%                        {\MakeUppercase\indexname}%
%                \thispagestyle{plain}\parindent\z@
%                \parskip\z@ \@plus .3\p@\relax
%                \let\item\@idxitem}
%               {\if@restonecol\onecolumn\else\clearpage\fi}
%\newcommand\@idxitem{\par\hangindent 40\p@}
%\newcommand\subitem{\@idxitem \hspace*{20\p@}}
%\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
%\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
	\parindent 1em%
	\noindent
	\hb@xt@1.8em{\hss\@makefnmark}#1}


%%\pagestyle{headings}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\endinput



%%
%% End of file `THESIS_KZ.cls'.

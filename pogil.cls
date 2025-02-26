\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pogil}[2018/11/23 Class for Formatting POGIL Exercises]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Declare Class options and set appropriate flags
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{etoolbox}

% option: handout vs. book (default: handout)
	\newbool{isbook}
	\setbool{isbook}{false}
	
	\DeclareOption{handout}{}
	\DeclareOption{book}{\setbool{isbook}{true}}

% option: student vs. instructor (default: student)
	\newbool{instructorguide}
	\setbool{instructorguide}{false}
	
	\DeclareOption{student}{}
	\DeclareOption{instructor}{\setbool{instructorguide}{true}}

% unknown options
	
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
	
% default options
	\ExecuteOptions{letter,11pt,onecolumn,twoside,openright}
	
% process options
	\ProcessOptions\relax
	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Load memoir as base class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	\LoadClass{memoir}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Load required packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%\RequirePackage[margin=1in]{geometry}
	\RequirePackage[english]{babel}
	\RequirePackage{amsmath}
	\RequirePackage{amssymb}
	\RequirePackage{extarrows}	% necessary to get decent reaction arrows
	\RequirePackage{multirow}
	\RequirePackage[version=4]{mhchem} 
	\RequirePackage{graphicx}
	\RequirePackage{hyperref}
	\RequirePackage{enumitem}
	\RequirePackage{xcolor}
	\RequirePackage{mdframed}
	\RequirePackage{fancyhdr}
	\RequirePackage{memhfixc}	% fix hyperref in memoir class
	\RequirePackage{environ}	% necessary for hiding answers in student version
	\RequirePackage[T1]{fontenc}	% necessary to display symbol for dispersity
	\RequirePackage{lmodern}	% fix use of bitmap fonts when runnign T1 encoding
	
	\ifbool{isbook}{%
	}{%
		\RequirePackage{lastpage}
	}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Store some user-defined information before \begin{document}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set up copyright info
	\newcommand{\copyrightfulltext}[1]{\csdef{copyfull}{#1}}
	\newcommand{\copyrightshort}[1]{\csdef{copyshort}{#1}}
	\newcommand{\copyrightgraphic}[1]{\csdef{copygraphic}{#1}}
	
% set up author, title, etc. info
	\renewcommand{\author}[1]{\csdef{author}{#1}}
	\newcommand{\institution}[1]{\csdef{institution}{#1}}
	\renewcommand{\title}[1]{\csdef{title}{#1}}
	\newcommand{\subtitle}[1]{\csdef{subtitle}{#1}}
	\newcommand{\version}{0.0.1}
	\renewcommand{\date}[1]{\csdef{date}{#1}}
	
	\newcommand{\thetitle}{\csuse{title}}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do some general formatting setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set up page margins

	\setlrmarginsandblock{1in}{1in}{*}
	\setulmarginsandblock{1.25in}{1.25in}{*}
	\checkandfixthelayout 

% set up paragraph formatting

	\setlength{\parindent}{0pt}
	\setlength{\parskip}{0.5em}
	\setaftersubsecskip{1.5em}
	
% set up hyperref link styles

	\hypersetup{
	  colorlinks   = true, %Colours links instead of ugly boxes
	  urlcolor     = blue, %Colour for external hyperlinks
	  linkcolor    = blue, %Colour of internal links
	  citecolor   = red %Colour of citations
	}
	
% create a useful command or two that we'll use in the exercise files

	\newcommand{\figpath}{}
	\newcommand{\labelbase}{}
	
% format headers and footers:

	\copypagestyle{fancy}{ruled}
	\makeheadrule{fancy}{\textwidth}{\normalrulethickness}
	\makefootrule{fancy}{\textwidth}{\normalrulethickness}{\footruleskip}
	
	\ifbool{isbook}{%
		\makeoddhead{fancy}{}{}{\rightmark}
		\makeevenhead{fancy}{\rightmark}{}{}
		\makeoddfoot{fancy}{\csuse{copyshort}}{}{\thepage}
		\makeevenfoot{fancy}{\thepage}{}{\csuse{copyshort}}
	}{%
		\makeoddhead{fancy}{}{\rightmark}{}
		\makeevenhead{fancy}{}{\rightmark}{}
		\makeoddfoot{fancy}{\csuse{copyshort}}{}{Page \thepage\ of \pageref{LastPage}}
		\makeevenfoot{fancy}{Page \thepage\ of \pageref{LastPage}}{}{\csuse{copyshort}}
		
		\AtBeginDocument{\pagestyle{fancy}}
	}

	
% format title page:

	% title page from https://ctan.org/pkg/titlepages - Story of Writing
	\newcommand*{\titlepage}{\begingroup
		\raggedleft
		\vspace*{\baselineskip}
		{\Huge\itshape \csuse{title}}\\[\baselineskip]
		{\large\itshape \csuse{subtitle}}\\[0.2\textheight]
		{\Large \csuse{author}}\par
		\vfill
		{\Large  \csuse{institution}}
		\vspace*{\baselineskip}
	\endgroup}
	
% format copyright page:
	\newcommand*{\copyrightpage}{\begingroup
		\makeatother
		\vspace*{5in}
		\includegraphics[width=0.2\textwidth]{\csuse{copygraphic}}

		\vspace{0.2in}
		\begin{minipage}{0.75\textwidth}
			\setlength{\parskip}{6pt}
			\csuse{copyfull}
		\end{minipage}
		\vfill
	\endgroup}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Set up environments for exercise formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% mdframed documentation is here: http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/mdframed/mdframed.pdf

% set up environment for ACTIVITY

	\newcounter{activity}[chapter]
	\newcounter{extension}	% counter for extensions
	\newcounter{model}		% counter for models within activity
	\newcounter{ctqs}	% counter for critical thinking questions within activity

	\newbool{restartctqs}

	\newenvironment{activity}[2][activity]{%
		% before code:

		\cleardoublepage		
		
		% check to see if we need to handle it as an extension
		\newbool{isextension}
		\ifstrequal{#1}{extension}
			{\setbool{isextension}{true}}
			{\setbool{isextension}{false}}
		
		%set up the correct section headers and table of contents lines
		\newcommand{\activitytitle}{#2}
		
		\newcommand{\activitylabel}{}
		\ifbool{isextension}{%
			% this is the case for extensions
			\refstepcounter{extension}
			\renewcommand{\activitylabel}{Extension~\arabic{chapter}.\arabic{activity}\alph{extension}}
		}{%
			% this is the case  for activities
			\refstepcounter{activity}
			\renewcommand{\activitylabel}{Activity~\arabic{chapter}.\arabic{activity}}
			\setcounter{extension}{0}
		}
		
		% write headers and TOC entries
		\ifbool{isbook}{%
			\section*{\activitylabel: \activitytitle}
    		\addcontentsline{toc}{section}{\activitylabel: \activitytitle}
    		\markright{\activitylabel: \activitytitle}
    	}{%
    		\section*{\activitytitle}
    		\markright{\activitytitle}
    	}
    	
		\setcounter{model}{0}
		\setcounter{ctqs}{0}
		\setbool{restartctqs}{true}
	}{%
		% after code:
	}

% set up environment for INSTRUCTOR NOTES

	\NewEnviron{instructornotes}{
		\ifbool{instructorguide}{%
			\color{red}
			\subsection*{Instructor Notes:}
			\BODY
			\clearpage
			\color{black}
			\ifbool{isbook}{%
				\section*{Activity~\arabic{chapter}.\arabic{activity}: \activitytitle}
    			}{%
    				\section*{\activitytitle}
    			}
		}{%
		}
	}

% set up environment for warmups

	\newenvironment{warmup}{%
		% before code:
		\subsection*{Warmup:}
	}{%
		% after code:
	}


% Set up environment for models

	\newenvironment{model}[1][]{%
		% before code:
		\refstepcounter{model}
		\subsection*{Model~\arabic{model}: #1}
		\begin{mdframed}[style=modelstyle]
	}{%
		% after code:
		\end{mdframed}
	}

	\mdfdefinestyle{modelstyle}{%
		linecolor=black,linewidth=1pt,%
		innermargin=0.25in,outermargin=0.25in,%
		%frametitlerule=true,%
		%frametitlebackgroundcolor=blue!20,
		%frametitlefont=\normalfont\bfseries\large,
		innertopmargin=\topskip,
	}
	
% set up environment for critical thinking questions

	\newenvironment{ctqs}{%
		% before code:
		\newcommand{\question}{\refstepcounter{ctqs}\item}
		
		\ifbool{restartctqs}{%
			\global\boolfalse{restartctqs}
			\refstepcounter{ctqs}
		}{}
		
		\subsection*{Critical Thinking Questions:}
		\begin{enumerate}[start=\arabic{ctqs}]
	}{%
		% after code:
		\end{enumerate}
	}

% Set up environment for infoboxes

	\newenvironment{infobox}{%
		% before code:
		\subsection*{Information:}
		\begin{mdframed}[style=infoboxstyle]
	}{%
		% after code:
		\end{mdframed}
	}

	\mdfdefinestyle{infoboxstyle}{%
		linecolor=blue!30,linewidth=1pt,
		innermargin=0.25in,outermargin=0.25in,
		%frametitlerule=false,
		%frametitlebackgroundcolor=blue!10,
		%frametitlealignment=\center,
		backgroundcolor=blue!10,
		innertopmargin=\topskip,
		%frametitle={Information:},
	}
	
% set up environment for exercises

	\newenvironment{exercises}{%
		\newcommand{\exercise}{\item}
		
		\subsection*{Exercises:}
		\begin{enumerate}
	}{%
		\end{enumerate}
	}
	
% set up environment for problems

	\newenvironment{problems}{%
		\newcommand{\problem}{\item}
		
		\subsection*{Problems:}
		\begin{enumerate}
	}{%
		\end{enumerate}
	}
	
% set up environment for answer spaces

	\NewEnviron{solution}[2][0pt]{
		\dimdef{\solnlength}{#1}
		\dimdef{\zerodim}{0pt}
		\ifbool{instructorguide}{%
			\ifdimequal{\solnlength}{\zerodim}{%
				\begin{minipage}[t][][c]{\linewidth}
				\setlength{\parskip}{6pt}
			}{%
				\begin{minipage}[t][#1][c]{\linewidth}
				\setlength{\parskip}{6pt}
			}
		}{%
			\begin{minipage}[t][#1][c]{\linewidth}
		}
		\ifbool{instructorguide}{%
			\color{red}
			\BODY
			\color{black}
    		}{%
    			#2
		}
		\end{minipage}
	}
	
	
	\newcommand{\answer}[1]{
		\ifbool{instructorguide}{%
			\color{red}%
			#1
		}{%
			\color{white}%
			\renewcommand{\includegraphics}[2][]{~}
			~
		}%
		\color{black}%
	}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SPECIAL SYMBOLS FOR USE IN EXERCISES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% dispersity symbol - calling it PDI for convenience in command naming
	\newcommand{\PDItext}{\textit{\DH}}
	\newcommand{\PDImath}{\text{\PDItext}}
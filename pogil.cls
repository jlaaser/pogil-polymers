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
	\DeclareOption{book}{\setbool{isbook}{false}}

% option: student vs. instructor (default: student)
	\newbool{instructorguide}
	\setbool{instructorguide}{false}
	
	\DeclareOption{student}{}
	\DeclareOption{instructor}{\setbool{instructorguide}{false}}

% unknown options
	
	\DeclareOption*{%
		\ifbool{isbook}{%
			\PassOptionsToClass{\CurrentOption}{memoir}
		}{%
			\PassOptionsToClass{\CurrentOption}{article}
		}
	}
	\ProcessOptions\relax
	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Load appropriate base class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	\ifbool{isbook}{%
		\LoadClass{memoir}
	}{%
		\LoadClass{article}
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Load required packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	\RequirePackage[margin=1in]{geometry}
	\RequirePackage[english]{babel}
	\RequirePackage{amsmath}
	\RequirePackage[version=4]{mhchem} 
	\RequirePackage{graphicx}
	\RequirePackage{hyperref}
	\RequirePackage{enumitem}
	\RequirePackage{xcolor}
	\RequirePackage{mdframed}
	
	\ifbool{isbook}{%
	}{%
		\RequirePackage{fancyhdr}
		\RequirePackage{lastpage}
	}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do some general formatting setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% set up paragraph formatting

	\setlength{\parindent}{0pt}
	\setlength{\parskip}{0.5em}
	
% set up hyperref link styles

	\hypersetup{
	  colorlinks   = true, %Colours links instead of ugly boxes
	  urlcolor     = blue, %Colour for external hyperlinks
	  linkcolor    = blue, %Colour of internal links
	  citecolor   = red %Colour of citations
	}
	
% create a useful command or two that we'll use in the exercise files

	\newcommand{\figpath}{}
	
% format headers and footers:

	\ifbool{isbook}{%
		% set up formatting for memoir class here
	}{%
		\RequirePackage{fancyhdr}
		\RequirePackage{lastpage}
	}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Set up environments for exercise formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% mdframed documentation is here: http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/mdframed/mdframed.pdf

% set up environment for ACTIVITY

	\newcounter{activity}

	\newenvironment{activity}[1][]{%
		% before code:
		\newcommand{\activitytitle}{#1}
		
		\ifbool{isbook}{%
			\refstepcounter{activity}
			\section*{Activity~\arabic{activity}: \activitytitle}
    		\addcontentsline{toc}{section}{Activity~\arabic{activity}: \activitytitle}
    	}{%
    		\section*{\activitytitle}
    	}
	}{%
		% after code:
		\clearpage
	}

% set up environment for INSTRUCTOR NOTES

	\newenvironment{intructornotes}{%
		% before code:
	}{%
		% after code:
	}

% set up environment for warmups

	\newenvironment{warmup}{%
		% before code:
	}{%
		% after code:
	}


% Set up environment for models

	\newcounter{model}[activity]

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
		rightmargin=0.25in,leftmargin=0.25in,%
		%frametitlerule=true,%
		%frametitlebackgroundcolor=blue!20,
		%frametitlefont=\normalfont\bfseries\large,
		innertopmargin=\topskip,
	}
	
% set up environment for critical thinking questions

	\newcounter{ctqs}[activity]
	\setcounter{ctqs}{1}

	\newenvironment{ctqs}{%
		% before code:
		\newcommand{\question}{\refstepcounter{ctqs}\item}
		
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
		rightmargin=0.25in,leftmargin=0.25in,
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
	
% long term goal: have answerspace break intelligently across pages, but for now, just use vspace

	\newcommand{\answerspace}[1]{\vspace{#1}}
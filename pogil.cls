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
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Set up environments for exercise formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% mdframed documentation is here: http://ctan.math.washington.edu/tex-archive/macros/latex/contrib/mdframed/mdframed.pdf

% Set up environment for models

	\mdfdefinestyle{modelstyle}{%
		linecolor=black,linewidth=1pt,%
		frametitlerule=true,%
		frametitlebackgroundcolor=blue!20,
		frametitlefont=\normalfont\bfseries\large,
		innertopmargin=\topskip,
	}
	
	\mdtheorem[style=modelstyle]{model}{Model}

% Set up environment for infoboxes

	\mdfdefinestyle{infoboxstyle}{%
		linecolor=blue!20,linewidth=1pt,
		rightmargin=0.5in,%leftmargin=0.5in,
		frametitlerule=false,
		frametitlebackgroundcolor=blue!10,
		frametitlealignment=\center,
		backgroundcolor=blue!10,
		innertopmargin=\topskip,
		frametitle={Information:},
	}
	
% long term goal: have answerspace break intelligently across pages, but for now, just use vspace

	\newcommand{\answerspace}[1]{\vspace{#1}}
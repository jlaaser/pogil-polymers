# pogil-polymers
Polymers: A Guided Inquiry
August 2020

----------------------------------------------------------
Copyright and License
----------------------------------------------------------

Current version (c) 2020 Jennifer Laaser

Except where otherwise noted, this work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

The current source for these materials is accessible on Github: https://github.com/jlaaser/pogil-polymers


---------------------------------------------------------
General Notes
---------------------------------------------------------

 - Polymers: A Guided Inquiry is intended for use in upper-level undergraduate or introductory graduate-level  courses in polymer science. These activities currently most closely track the presentation of material in Polymer Chemistry, 2nd Ed., by Paul C. Hiemenz and Timothy P. Lodge, but can easily be adapted for use with other textbooks.
 
 - This collection is a work in progress, and not all exercises have yet been evaluated in classroom use.  A summary of the current revision status of each activity is included in the Release Notes, below.
 
 - Every effort will be made to correct outstanding errors in these materials as they are found. However, if you find an issue that needs to be fixed, please create an issue in the GitHub issue tracker for this project: https://github.com/jlaaser/pogil-polymers/issues
 
 - Contributions are welcome! If you have an idea for a new exercise or want to improve an existing one, please post your suggestion in the issue tracker (above) or send me an email (below) so that we can coordinate.
 

---------------------------------------------------------
Compiling the Exercises
---------------------------------------------------------

 - The exercises are written LaTeX and can be compiled using pdflatex via the command line or your favorite TeX IDE.  If you are new to LaTeX, Texmaker (http://www.xm1math.net/texmaker/ ) is a relatively user-friendly platform to start with.
 
 - The main file is pogil-polymers.tex:
 
	- To compile the complete set of exercises, simply compile pogil-polymers.tex without any changes.
 
	- To compile a subset of the exercises, comment out (put a % sign in front of) the "\include" statements for any exercises that you want to omit from the output before compiling the pdf.  You can also re-order the exercises, chapters, and sections by changing the order of the "\include" and "\chapter" commands in the document.
 
 - This project also contains a template for a single exercise, called "single-exercise.tex":
 
	- To compile a single exercise, put the path to the exercise you want to compile into the "\include" statement in "single-exercise.tex" and run LaTeX.
	
 - By default, the activities compile as printable handouts that are ready to give to students.  To instead compile the instructor guide (which includes both solutions and implementation notes for each activity), change the \documentclass line to:
 
	- \documentclass[instructor,handout]{pogil}	% use this version to compile a single activity in single-exercise.tex
	- \documentclass[instructor,book]{pogil}	% use this version to compile the full set of activities, in pogil-polymers.tex

 - Compiled PDFs of the full set of exercises will be uploaded with each official release; see https://github.com/jlaaser/pogil-polymers/releases

---------------------------------------------------------
Contact
---------------------------------------------------------

Questions?  Interested in contributing?  You can reach the author at:

E-mail: j.laaser@pitt.edu
Web:	http://laaserlab.chem.pitt.edu/
Github:	github.com/jlaaser


---------------------------------------------------------
Release Notes
---------------------------------------------------------

Release 0.2.0 - August 10, 2020

	The following activities are complete (including the instructor guides), and have been classroom-tested and revised:
	
		Activity 1.1 - From Molecules to Polymers
		Activity 1.2 - With Increasing Size Comes Increasing Complexity
		Activity 1.3 - Molecular Weight and Dispersity
		Activity 2.1 - Introduction to Polymerization Mechanisms
		Activity 3.1 - Chemistries of Step-Growth Polymerizations
		Activity 3.2 - Degree of Polymerization in Step-Growth Polymerizations
		Extension 3.2a - Synthesis of Polymer Networks by Step-Growth Reactions
		Activity 3.3 - Equilibrium in Condensation Polymerizations
		Activity 3.4 - Molecular Weight Distributions in Step-Growth Polymerizations
		Activity 4.1 - Chemistry of Free-Radical Polymerization
		Activity 4.2 - Kinetics of Free-Radical Polymerization
		Activity 6.1 - Copolymerization
		Activity 7.1 - Elasticity of Polymer Chains
		Activity 8.1 - Elasticity of Polymer Networks
		Activity 8.2 - Viscoelasticity of Polymeric Materials
		Extension 8.2a - Small-Amplitude Oscillatory Shear Rheology
		Activity 9.1 - Regular Solutions & Flory-Huggins Theory
		Activity 9.2 - Thermodynamics of Phase Separation
		Activity 9.3 - Phase Diagrams of Polymer Solutions

	
	The following activites are complete (including the instructor guide), but have not been classroom-tested (or, have been classroom-tested but have not yet been updated following testing):
	
		n/a - none in this release
	
	The following activities are included as ``working drafts'' which contain complete student handouts but no instructor guides, and have not been classroom-tested (or, have been classroom-tested but have not yet been updated following testing):
	
		n/a - none in this release
		
---------------------------------------------------------
Acknowledgments
---------------------------------------------------------

This project is supported by the National Science Foundation under award DMR-POL 1846665.
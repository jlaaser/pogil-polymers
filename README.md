# pogil-polymers
POGIL Activities for Polymer Chemistry and Polymer Physics
unreleased version - January 2020

----------------------------------------------------------
Copyright and License
----------------------------------------------------------

Current version (c) 2020 Jennifer Laaser

Except where otherwise noted, this work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

The current source for these materials is accessible on Github: https://github.com/jlaaser/pogil-polymers


---------------------------------------------------------
General Notes
---------------------------------------------------------

 - POGIL Activities for Polymer Chemistry and Polymer Physics are intended for use in upper-level undergraduate or introductory graduate-level  courses in polymer science. These activities currently most closely track the presentation of material in Polymer Chemistry, 2nd Ed., by Paul C. Hiemenz and Timothy P. Lodge, but can easily be adapted for use with other textbooks.
 
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

unreleased - February 27, 2020

	The following activities are complete (including the instructor guides), and have been classroom-tested and revised:
	
		Activity 5 - Chemistries of Step-Growth Polymerization
		Activity 6 - Degree of Polymerization in Step-Growth Polymerizations
		Activity 7 - Equilibrium in Condensation Polymerizations
		Activity 8 - Molecular Weight Distributions in Step-Growth Polymerizations
		Activity 15 - Viscoelasticity of Polymeric Materials
		Activity 16 - Small-Amplitude Oscillatory Shear Rheology
		Activity 17 - Regular Solutions and Flory-Huggins Theory
		Activity 18 - Thermodynamics of Phase Separation
	
	The following activites are complete (including the instructor guide), but have not been classroom-tested (or, have been classroom-tested but have not yet been updated following testing):
	
		n/a - none in this release
	
	The following activities are included as ``working drafts'' which contain complete student handouts but no instructor guides, and have not been classroom-tested (or, have been classroom-tested but have not yet been updated following testing):
	
		Activity 1 - From Molecules to Polymers
		Activity 2 - With Increasing Size Comes Increasing Complexity
		Activity 3 - Molecular Weight and Dispersity
		Activity 4 - Chain-Growth and Step-Growth Polymerizations
		Activity 9 - Chemistry of Free-Radical Polymerization
		Activity 10 - Kinetics of Free-Radical Polymerization
		Activity 11 - Copolymerization
		Activity 12 - Elasticity of Polymer Chains
		Activity 13 - Synthesis of Polymer Networks
		Activity 14 - Elasticity of Polymer Networks
		Activity 19 - Phase Diagrams of Polymer Solutions

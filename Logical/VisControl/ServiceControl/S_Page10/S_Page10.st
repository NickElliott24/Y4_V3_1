(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Page10
 * File: S_Page10.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Page10
 ********************************************************************)

PROGRAM _CYCLIC

	//MENU SCREEN
	ServiceVis.P10.Status[0]	:=	HIDE	;
	ServiceVis.P10.Status[1]	:=	HIDE	;
	ServiceVis.P10.Status[2]	:=	HIDE	;
	ServiceVis.P10.Status[3]	:=	HIDE	;
	ServiceVis.P10.Status[4]	:=	HIDE	;
	ServiceVis.P10.Status[5]	:=	HIDE	;
	ServiceVis.P10.Status[6]	:=	HIDE	;
	ServiceVis.P10.Status[7]	:=	HIDE	;
	ServiceVis.P10.Status[8]	:=	HIDE	;
	ServiceVis.P10.Status[9]	:=	HIDE	;
	ServiceVis.P10.Status[10]	:=	HIDE	;

	CASE ServiceVis.P10.EnableIndex OF
		0:
			ServiceVis.P10.Status[0]	:=	SHOW	;
		1:
			ServiceVis.P10.Status[1]	:=	SHOW	;
		2:
			ServiceVis.P10.Status[2]	:=	SHOW	;
		3:
			ServiceVis.P10.Status[3]	:=	SHOW	;
		4:
			ServiceVis.P10.Status[4]	:=	SHOW	;
		5:
			ServiceVis.P10.Status[5]	:=	SHOW	;
		6:
			ServiceVis.P10.Status[6]	:=	SHOW	;
		7:
			ServiceVis.P10.Status[7]	:=	SHOW	;
		8:
			ServiceVis.P10.Status[8]	:=	SHOW	;
		9:
			ServiceVis.P10.Status[9]	:=	SHOW	;

	END_CASE

END_PROGRAM

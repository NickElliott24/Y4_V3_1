(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Page10
 * File: Page10.st
 * Author: NickE
 * Created: January 31, 2013
 ********************************************************************
 * Implementation of program Page10
 ********************************************************************)

PROGRAM _CYCLIC

	//MENU SCREEN
	Vis.P10.Status[0]	:=	HIDE	;
	Vis.P10.Status[1]	:=	HIDE	;
	Vis.P10.Status[2]	:=	HIDE	;
	Vis.P10.Status[3]	:=	HIDE	;
	Vis.P10.Status[4]	:=	HIDE	;
	Vis.P10.Status[5]	:=	HIDE	;
	Vis.P10.Status[6]	:=	HIDE	;
	Vis.P10.Status[7]	:=	HIDE	;
	Vis.P10.Status[8]	:=	HIDE	;
	Vis.P10.Status[9]	:=	HIDE	;
	Vis.P10.Status[10]	:=	HIDE	;

	CASE Vis.P10.EnableIndex OF
		0:
			Vis.P10.Status[0]	:=	SHOW	;
		1:
			Vis.P10.Status[1]	:=	SHOW	;
		2:
			Vis.P10.Status[2]	:=	SHOW	;
		3:
			Vis.P10.Status[3]	:=	SHOW	;
		4:
			Vis.P10.Status[4]	:=	SHOW	;
		5:
			Vis.P10.Status[5]	:=	SHOW	;
		6:
			Vis.P10.Status[6]	:=	SHOW	;
		7:
			Vis.P10.Status[7]	:=	SHOW	;
		8:
			Vis.P10.Status[8]	:=	SHOW	;
		9:
			Vis.P10.Status[9]	:=	SHOW	;

	END_CASE
	
END_PROGRAM

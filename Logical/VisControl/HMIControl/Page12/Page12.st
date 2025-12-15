(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Page12
 * File: Page12.st
 * Author: NickE
 * Created: January 31, 2013
 ********************************************************************
 * Implementation of program Page12
 ********************************************************************)

PROGRAM _CYCLIC

	//OPTIONS SCREEN
	Vis.P12.Status[0]	:=	HIDE	;
	Vis.P12.Status[1]	:=	HIDE	;
	Vis.P12.Status[2]	:=	HIDE	;
	Vis.P12.Status[3]	:=	HIDE	;
	Vis.P12.Status[4]	:=	HIDE	;
	Vis.P12.Status[5]	:=	HIDE	;
	Vis.P12.Status[6]	:=	HIDE	;
	Vis.P12.Status[7]	:=	HIDE	;
	Vis.P12.Status[8]	:=	HIDE	;
	Vis.P12.Status[9]	:=	HIDE	;
	Vis.P12.Status[10]	:=	HIDE	;
	Vis.P12.Status[11]	:=	HIDE	;

	CASE Vis.P12.EnableIndex OF
		0:
			Vis.P12.Status[0]	:=	SHOW	;
		1:
			Vis.P12.Status[1]	:=	SHOW	;
		2:
			Vis.P12.Status[2]	:=	SHOW	;
		3:
			Vis.P12.Status[3]	:=	SHOW	;
		4:
			Vis.P12.Status[4]	:=	SHOW	;
		5:
			Vis.P12.Status[5]	:=	SHOW	;
		6:
			Vis.P12.Status[6]	:=	SHOW	;
		7:
			Vis.P12.Status[7]	:=	SHOW	;
		8:
			Vis.P12.Status[8]	:=	SHOW	;
		9:
			Vis.P12.Status[9]	:=	SHOW	;
		10:
			Vis.P12.Status[10]	:=	SHOW	;
	END_CASE
	IF(Level.Level > OPERATOR)THEN
		Vis.P12.Status[9]	:=	SHOW	;
	END_IF
	
	IF (Control.Achieved1) THEN
		Sol20DT1.Auto	:=	FALSE	;
		Sol21DT2.Auto	:=	FALSE	;
		Sol22DT3.Auto	:=	FALSE	;
		Sol23DT4.Auto	:=	FALSE	;
	END_IF

	IF(Sol20DT1.Auto) THEN
		Sol21DT2.Auto	:=	TRUE	;
		Sol22DT3.Auto	:=	TRUE	;
		Sol23DT4.Auto	:=	TRUE	;
	ELSE
		Sol21DT2.Auto	:=	FALSE	;
		Sol22DT3.Auto	:=	FALSE	;
		Sol23DT4.Auto	:=	FALSE	;
	END_IF


	//DISABLE CHANGING BATCHING MODES UNTIL LINE IS EMPTY
	IF(Control.Empty) THEN
		Vis.P12.Status[11]	:=	SHOW	;
	END_IF

	//HIGHLIGHT SELECTED FURNACE CLEAR SIGNAL MODE COLOUR
	CASE LoadPerm.FurnClear OF
		0:
			Vis.P12.Colour[5]	:=	WHITE			;
			Vis.P12.Colour[6]	:=	DROP_UNSELECTED	;
		1:
			Vis.P12.Colour[5]	:=	DROP_UNSELECTED	;
			Vis.P12.Colour[6]	:=	WHITE			;
	END_CASE


END_PROGRAM

(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Page12
 * File: S_Page12.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Page12
 ********************************************************************)

PROGRAM _CYCLIC

	//OPTIONS SCREEN
	ServiceVis.P12.Status[0]	:=	HIDE	;
	ServiceVis.P12.Status[1]	:=	HIDE	;
	ServiceVis.P12.Status[2]	:=	HIDE	;
	ServiceVis.P12.Status[3]	:=	HIDE	;
	ServiceVis.P12.Status[4]	:=	HIDE	;
	ServiceVis.P12.Status[5]	:=	HIDE	;
	ServiceVis.P12.Status[6]	:=	HIDE	;
	ServiceVis.P12.Status[7]	:=	HIDE	;
	ServiceVis.P12.Status[8]	:=	HIDE	;
	ServiceVis.P12.Status[9]	:=	HIDE	;
	ServiceVis.P12.Status[10]	:=	HIDE	;
	ServiceVis.P12.Status[11]	:=	HIDE	;

	CASE ServiceVis.P12.EnableIndex OF
		0:
			ServiceVis.P12.Status[0]	:=	SHOW	;
		1:
			ServiceVis.P12.Status[1]	:=	SHOW	;
		2:
			ServiceVis.P12.Status[2]	:=	SHOW	;
		3:
			ServiceVis.P12.Status[3]	:=	SHOW	;
		4:
			ServiceVis.P12.Status[4]	:=	SHOW	;
		5:
			ServiceVis.P12.Status[5]	:=	SHOW	;
		6:
			ServiceVis.P12.Status[6]	:=	SHOW	;
		7:
			ServiceVis.P12.Status[7]	:=	SHOW	;
		8:
			ServiceVis.P12.Status[8]	:=	SHOW	;
		9:
			ServiceVis.P12.Status[9]	:=	SHOW	;
		10:
			ServiceVis.P12.Status[10]	:=	SHOW	;
	END_CASE
	IF(ServiceLevel.Level > OPERATOR)THEN
		ServiceVis.P12.Status[9]	:=	SHOW	;
	END_IF

	//DISABLE CHANGING BATCHING MODES UNTIL LINE IS EMPTY
	IF(Control.Empty) THEN
		ServiceVis.P12.Status[11]	:=	SHOW	;
	END_IF

	//HIGHLIGHT SELECTED FURNACE CLEAR SIGNAL MODE COLOUR
	CASE LoadPerm.FurnClear OF
		0:
			ServiceVis.P12.Colour[5]	:=	WHITE			;
			ServiceVis.P12.Colour[6]	:=	DROP_UNSELECTED	;
		1:
			ServiceVis.P12.Colour[5]	:=	DROP_UNSELECTED	;
			ServiceVis.P12.Colour[6]	:=	WHITE			;
	END_CASE

END_PROGRAM

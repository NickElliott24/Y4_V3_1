(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Page16
 * File: Page16.st
 * Author: nicke
 * Created: February 07, 2013
 ********************************************************************
 * Implementation of program Page16
 ********************************************************************)

PROGRAM _CYCLIC

	//REMOTE SCREEN
	memcpy(ADR(Vis.P16.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	Vis.P16.Colour[0]	:=	LIGHTBLUE	;
	Vis.P16.Colour[1]	:=	LIGHTBLUE	;
	Vis.P16.Colour[2]	:=	LIGHTBLUE	;
	Vis.P16.Colour[3]	:=	LIGHTBLUE	;
	Vis.P16.Colour[4]	:=	LIGHTBLUE	;
	Vis.P16.Colour[5]	:=	LIGHTBLUE	;
	Vis.P16.Colour[6]	:=	LIGHTBLUE	;
	Vis.P16.Colour[7]	:=	LIGHTBLUE	;
	Vis.P16.Colour[8]	:=	LIGHTBLUE	;
	Vis.P16.Colour[9]	:=	LIGHTBLUE	;
	Vis.P16.Colour[10]	:=	LIGHTBLUE	;
	
	CASE Vis.P16.EnableIndex OF
		0..7,9,10:
			Vis.P16.Status[Vis.P16.EnableIndex]	:=	SHOW	;
			Vis.P16.Colour[Vis.P16.EnableIndex]	:=	LIGHTBLUE_ACTIVE	;
	END_CASE
	
	IF(Control.Test) THEN
		Vis.P16.Status[8]	:=	SHOW	;
	ELSE
		Vis.P16.EnableIndex	:= LIMIT(0, Vis.P16.EnableIndex, 4);//ALTER Limit max dependent on number of IO screens, 5=6 screens ETC...
	END_IF

	//CALCULATE WHEN LAYER HAS CHANGED
	Vis.P16.Changed	:=	FALSE	;
	Vis.P16.New	:=	Vis.P16.EnableIndex	;
	IF(Vis.P16.New <> Vis.P16.Old) THEN
		Vis.P16.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(Vis.P16.Changed) THEN
		Vis.P16Layer.EnableIndex	:=	24	;
	END_IF
	Vis.P16.Old	:=	Vis.P16.EnableIndex	;

	memcpy(ADR(Vis.P16Layer.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	
	CASE Vis.P16Layer.EnableIndex OF
		0..15:
			Vis.P16Layer.Status[Vis.P16Layer.EnableIndex]	:=	SHOW	;
	END_CASE

	//Declaration to enable use of variables on screen
	X2XModule	;

END_PROGRAM

(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Page15
 * File: Page15.st
 * Author: nicke
 * Created: February 04, 2013
 ********************************************************************
 * Implementation of program Page15
 ********************************************************************)

PROGRAM _CYCLIC

	//SERVOS SCREEN
	memcpy(ADR(Vis.P15.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	Vis.P15.Colour[0]	:=	GREEN1	;
	Vis.P15.Colour[1]	:=	GREEN1	;
	Vis.P15.Colour[2]	:=	GREEN1	;
	Vis.P15.Colour[3]	:=	GREEN1	;
	Vis.P15.Colour[4]	:=	GREEN1	;
	Vis.P15.Colour[5]	:=	GREEN1	;
	Vis.P15.Colour[6]	:=	GREEN1	;
	
	CASE Vis.P15.EnableIndex OF
		0..6:
			Vis.P15.Status[Vis.P15.EnableIndex]	:=	SHOW	;
			Vis.P15.Colour[Vis.P15.EnableIndex]	:=	GREEN1_ACTIVE	;
	END_CASE
	
	IF(Control.Test) THEN
		Vis.P15.Status[8]	:=	SHOW	;
		//	ELSE
		//		Vis.P15Layer.EnableIndex	:=	24	;
	END_IF

	//CALCULATE WHEN LAYER HAS CHANGED
	Vis.P15.Changed	:=	FALSE	;
	Vis.P15.New	:=	Vis.P15.EnableIndex	;
	IF(Vis.P15.New <> Vis.P15.Old) THEN
		Vis.P15.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(Vis.P15.Changed) THEN
		Vis.P15Layer.EnableIndex	:=	24	;
	END_IF
	Vis.P15.Old	:=	Vis.P15.EnableIndex	;

	memcpy(ADR(Vis.P15Layer.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	
	CASE Vis.P15Layer.EnableIndex OF
		0..15:
			Vis.P15Layer.Status[Vis.P15Layer.EnableIndex]	:=	SHOW	;
	END_CASE

	IF(Control.Test) THEN
		TestServos	:=	TRUE	;
	ELSE
		TestServos	:=	FALSE	;
		Vis.P15Layer.Status[0]	:=	HIDE	;
		Vis.P15Layer.Status[1]	:=	HIDE	;
		Vis.P15Layer.Status[2]	:=	HIDE	;
	END_IF

	Ax1.Seek2Runtime	:=	(BOOL_TO_USINT(Ax1.Block));
	Ax2.Seek2Runtime	:=	(BOOL_TO_USINT(Ax2.Block));
	
END_PROGRAM

(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Page15
 * File: S_Page15.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Page15
 ********************************************************************)

PROGRAM _CYCLIC

	//SERVOS SCREEN
	memcpy(ADR(ServiceVis.P15.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
	ServiceVis.P15.Colour[0]	:=	GREEN1	;
	ServiceVis.P15.Colour[1]	:=	GREEN1	;
	ServiceVis.P15.Colour[2]	:=	GREEN1	;
	ServiceVis.P15.Colour[3]	:=	GREEN1	;
	ServiceVis.P15.Colour[4]	:=	GREEN1	;
	ServiceVis.P15.Colour[5]	:=	GREEN1	;
	ServiceVis.P15.Colour[6]	:=	GREEN1	;
	
	CASE ServiceVis.P15.EnableIndex OF
		0..6:
			ServiceVis.P15.Status[ServiceVis.P15.EnableIndex]	:=	SHOW	;
			ServiceVis.P15.Colour[ServiceVis.P15.EnableIndex]	:=	GREEN1_ACTIVE	;
	END_CASE
	
	IF(Control.Test) THEN
		ServiceVis.P15.Status[8]	:=	SHOW	;
		//	ELSE
		//		ServiceVis.P15Layer.EnableIndex	:=	24	;
	END_IF

	//CALCULATE WHEN LAYER HAS CHANGED
	ServiceVis.P15.Changed	:=	FALSE	;
	ServiceVis.P15.New	:=	ServiceVis.P15.EnableIndex	;
	IF(ServiceVis.P15.New <> ServiceVis.P15.Old) THEN
		ServiceVis.P15.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(ServiceVis.P15.Changed) THEN
		ServiceVis.P15Layer.EnableIndex	:=	24	;
	END_IF
	ServiceVis.P15.Old	:=	ServiceVis.P15.EnableIndex	;

	memcpy(ADR(ServiceVis.P15Layer.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
	
	CASE ServiceVis.P15Layer.EnableIndex OF
		0..15:
			ServiceVis.P15Layer.Status[ServiceVis.P15Layer.EnableIndex]	:=	SHOW	;
	END_CASE

	IF(Control.Test) THEN
	ELSE
		ServiceVis.P15Layer.Status[0]	:=	HIDE	;
		ServiceVis.P15Layer.Status[1]	:=	HIDE	;
		ServiceVis.P15Layer.Status[2]	:=	HIDE	;
	END_IF
	
END_PROGRAM

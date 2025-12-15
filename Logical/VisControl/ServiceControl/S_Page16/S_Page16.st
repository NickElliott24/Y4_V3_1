(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Page16
 * File: S_Page16.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Page16
 ********************************************************************)

PROGRAM _CYCLIC

	//REMOTE SCREEN
	memcpy(ADR(ServiceVis.P16.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
	ServiceVis.P16.Colour[0]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[1]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[2]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[3]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[4]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[5]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[6]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[7]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[8]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[9]	:=	LIGHTBLUE	;
	ServiceVis.P16.Colour[10]	:=	LIGHTBLUE	;
	
	CASE ServiceVis.P16.EnableIndex OF
		0..7,9,10:
			ServiceVis.P16.Status[ServiceVis.P16.EnableIndex]	:=	SHOW	;
			ServiceVis.P16.Colour[ServiceVis.P16.EnableIndex]	:=	LIGHTBLUE_ACTIVE	;
	END_CASE
	
	IF(Control.Test) THEN
		ServiceVis.P16.Status[8]	:=	SHOW	;
	ELSE
		ServiceVis.P16.EnableIndex	:= LIMIT(0, ServiceVis.P16.EnableIndex, 6);
	END_IF

	//CALCULATE WHEN LAYER HAS CHANGED
	ServiceVis.P16.Changed	:=	FALSE	;
	ServiceVis.P16.New	:=	ServiceVis.P16.EnableIndex	;
	IF(ServiceVis.P16.New <> ServiceVis.P16.Old) THEN
		ServiceVis.P16.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(ServiceVis.P16.Changed) THEN
		ServiceVis.P16Layer.EnableIndex	:=	24	;
	END_IF
	ServiceVis.P16.Old	:=	ServiceVis.P16.EnableIndex	;

	memcpy(ADR(ServiceVis.P16Layer.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
	
	CASE ServiceVis.P16Layer.EnableIndex OF
		0..15:
			ServiceVis.P16Layer.Status[ServiceVis.P16Layer.EnableIndex]	:=	SHOW	;
	END_CASE

END_PROGRAM

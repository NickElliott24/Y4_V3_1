(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Page14
 * File: S_Page14.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Page14
 ********************************************************************)

PROGRAM _CYCLIC

	//DRIVES SCREEN
	memcpy(ADR(ServiceVis.P14.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
	ServiceVis.P14.Colour[0]	:=	VIOLET	;
	ServiceVis.P14.Colour[1]	:=	VIOLET	;
	ServiceVis.P14.Colour[2]	:=	VIOLET	;
	ServiceVis.P14.Colour[3]	:=	VIOLET	;
	ServiceVis.P14.Colour[4]	:=	VIOLET	;
	ServiceVis.P14.Colour[5]	:=	VIOLET	;
	ServiceVis.P14.Colour[6]	:=	VIOLET	;
	
	CASE ServiceVis.P14.EnableIndex OF
		0..6:
			ServiceVis.P14.Status[ServiceVis.P14.EnableIndex]	:=	SHOW	;
			ServiceVis.P14.Colour[ServiceVis.P14.EnableIndex]	:=	VIOLET_ACTIVE	;
	END_CASE
	
	IF (Control.Achieved1) OR(Control.Test) THEN
		ServiceVis.P14.Status[8]	:=	SHOW	;
	END_IF
	
	IF(Control.Test) THEN
		ServiceVis.P14.Status[9]	:=	SHOW	;
	END_IF

	//CALCULATE WHEN LAYER HAS CHANGED
	ServiceVis.P14.Changed	:=	FALSE	;
	ServiceVis.P14.New	:=	ServiceVis.P14.EnableIndex	;
	IF(ServiceVis.P14.New <> ServiceVis.P14.Old) THEN
		ServiceVis.P14.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(ServiceVis.P14.Changed) THEN
		ServiceVis.P14Layer.EnableIndex		:=	24	;
		ServiceVis.P14Status.EnableIndex	:=	24	;
		ServiceVis.P14Help.EnableIndex		:=	24	;
	END_IF
	ServiceVis.P14.Old	:=	ServiceVis.P14.EnableIndex	;
	
	memcpy(ADR(ServiceVis.P14Layer.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
	
	CASE ServiceVis.P14Layer.EnableIndex OF
		0..19:
			ServiceVis.P14Layer.Status[ServiceVis.P14Layer.EnableIndex]	:=	SHOW	;
	END_CASE

END_PROGRAM

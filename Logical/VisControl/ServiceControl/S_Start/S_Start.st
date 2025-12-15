(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Start
 * File: S_Start.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Start
 ********************************************************************)

PROGRAM _CYCLIC

	ServiceVis.Start.ResetEnable	:= HIDE	;
	
	//STATUS LIGHTS FOR SEAMER 1
	IF(Seamers.AutoStart[1]) THEN
		ServiceVis.Start.StatusSeam1	:=	GREEN	;
	ELSE
		ServiceVis.Start.StatusSeam1	:=	GREEN_DARK	;
	END_IF
	
	IF(Seamers.Enable[1]) AND NOT(Seamers.AutoStart[1]) THEN
		ServiceVis.Start.StatusSeam1	:=	YELLOW	;
	END_IF

	IF(MS1Belt1.Trip) THEN
		ServiceVis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS2Belt2.Trip) THEN
		ServiceVis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS3Belt3.Trip) THEN
		ServiceVis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS4Belt4.Trip) THEN
		ServiceVis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS9Vac1.Trip) THEN
		ServiceVis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS11Vac3.Trip) THEN
		ServiceVis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS23Vac5.Trip) THEN
		ServiceVis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS24Vac6.Trip) THEN
		ServiceVis.Start.StatusSeam1	:=	RED	;
	END_IF

	//STATUS LIGHTS FOR SEAMER 2
	IF(Seamers.AutoStart[2]) THEN
		ServiceVis.Start.StatusSeam2	:=	GREEN	;
	ELSE
		ServiceVis.Start.StatusSeam2	:=	GREEN_DARK	;
	END_IF
	
	IF(Seamers.Enable[2]) AND NOT(Seamers.AutoStart[2]) THEN
		ServiceVis.Start.StatusSeam2	:=	YELLOW	;
	END_IF
	
	IF(MS5Belt5.Trip) THEN
		ServiceVis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS6Belt6.Trip) THEN
		ServiceVis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS7Belt7.Trip) THEN
		ServiceVis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS8Belt8.Trip) THEN
		ServiceVis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS10Vac2.Trip) THEN
		ServiceVis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS12Vac4.Trip) THEN
		ServiceVis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS25Vac7.Trip) THEN
		ServiceVis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS26Vac8.Trip) THEN
		ServiceVis.Start.StatusSeam2	:=	RED	;
	END_IF

	IF EDGEPOS(Control.EStop1) AND(Control.Test) THEN
		ServiceVis.Start.Enable	:=	HIDE	;
	END_IF

END_PROGRAM

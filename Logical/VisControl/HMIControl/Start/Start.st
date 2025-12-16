(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Start
 * File: Start.st
 * Author: nicke
 * Created: January 21, 2013
 ********************************************************************
 * Implementation of program Start
 ********************************************************************)

PROGRAM _CYCLIC

	Vis.Start.ResetEnable	:= HIDE	;
	
	//STATUS LIGHTS FOR SEAMER 1
	IF(SeamersII.AutoStart[1]) THEN
		Vis.Start.StatusSeam1	:=	GREEN	;
	ELSE
		Vis.Start.StatusSeam1	:=	GREEN_DARK	;
	END_IF
	
	IF(SeamersII.Enable[1]) AND NOT(SeamersII.AutoStart[1]) THEN
		Vis.Start.StatusSeam1	:=	YELLOW	;
	END_IF

	IF(MS1Belt1.Trip) THEN
		Vis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS2Belt2.Trip) THEN
		Vis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS3Belt3.Trip) THEN
		Vis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS4Belt4.Trip) THEN
		Vis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS9Vac1.Trip) THEN
		Vis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS11Vac3.Trip) THEN
		Vis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS23Vac5.Trip) THEN
		Vis.Start.StatusSeam1	:=	RED	;
	ELSIF(MS24Vac6.Trip) THEN
		Vis.Start.StatusSeam1	:=	RED	;
	END_IF
	
	//STATUS LIGHTS FOR SEAMER 2
	IF(SeamersII.AutoStart[2]) THEN
		Vis.Start.StatusSeam2	:=	GREEN	;
	ELSE
		Vis.Start.StatusSeam2	:=	GREEN_DARK	;
	END_IF
	
	IF(SeamersII.Enable[2]) AND NOT(SeamersII.AutoStart[2]) THEN
		Vis.Start.StatusSeam2	:=	YELLOW	;
	END_IF
	
	IF(MS5Belt5.Trip) THEN
		Vis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS6Belt6.Trip) THEN
		Vis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS7Belt7.Trip) THEN
		Vis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS8Belt8.Trip) THEN
		Vis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS10Vac2.Trip) THEN
		Vis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS12Vac4.Trip) THEN
		Vis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS25Vac7.Trip) THEN
		Vis.Start.StatusSeam2	:=	RED	;
	ELSIF(MS26Vac8.Trip) THEN
		Vis.Start.StatusSeam2	:=	RED	;
	END_IF

	Control.Auto := NOT(Control.Test) ;
	
	IF EDGEPOS(Control.EStop1) AND(Control.Test) THEN
		Control.Test	:=	FALSE	;
		Vis.Start.Enable	:=	HIDE	;
	END_IF
	
END_PROGRAM


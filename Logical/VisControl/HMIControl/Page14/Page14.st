(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Page14
 * File: Page14.st
 * Author: NickE
 * Created: January 31, 2013
 ********************************************************************
 * Implementation of program Page14
 ********************************************************************)

PROGRAM _CYCLIC

	//DRIVES SCREEN
	memcpy(ADR(Vis.P14.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	Vis.P14.Colour[0]	:=	VIOLET	;
	Vis.P14.Colour[1]	:=	VIOLET	;
	Vis.P14.Colour[2]	:=	VIOLET	;
	Vis.P14.Colour[3]	:=	VIOLET	;
	Vis.P14.Colour[4]	:=	VIOLET	;
	Vis.P14.Colour[5]	:=	VIOLET	;
	Vis.P14.Colour[6]	:=	VIOLET	;
	
	CASE Vis.P14.EnableIndex OF
		0..6:
			Vis.P14.Status[Vis.P14.EnableIndex]	:=	SHOW	;
			Vis.P14.Colour[Vis.P14.EnableIndex]	:=	VIOLET_ACTIVE	;
	END_CASE
	
	IF (Control.Test) THEN
		Vis.P14.Status[8]	:=	SHOW	;
	END_IF
	
	IF(Control.Test) THEN
		Vis.P14.Status[9]	:=	SHOW	;
	END_IF


	//CALCULATE WHEN LAYER HAS CHANGED
	Vis.P14.Changed	:=	FALSE	;
	Vis.P14.New	:=	Vis.P14.EnableIndex	;
	IF(Vis.P14.New <> Vis.P14.Old) THEN
		Vis.P14.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(Vis.P14.Changed) THEN
		Vis.P14Layer.EnableIndex	:=	24	;
		Vis.P14Status.EnableIndex	:=	24	;
		Vis.P14Help.EnableIndex		:=	24	;
		//		Vis.CalcFreq.Disp				:=	HIDE	;
	END_IF
	Vis.P14.Old	:=	Vis.P14.EnableIndex	;
	
	memcpy(ADR(Vis.P14Layer.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	
	CASE Vis.P14Layer.EnableIndex OF
		0..19:
			Vis.P14Layer.Status[Vis.P14Layer.EnableIndex]	:=	SHOW	;
//		24:
//			Vis.CalcFreq.Disp	:=	HIDE	;
	END_CASE

	IF NOT(Control.Test) THEN
		Vis.P14Layer.EnableIndex	:= 24	;
	END_IF

	memcpy(ADR(Vis.P14Status.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	
	CASE Vis.P14Status.EnableIndex OF
		0..19:
			Vis.P14Status.Status[Vis.P14Status.EnableIndex]	:=	SHOW	;
	END_CASE

	memcpy(ADR(Vis.P14Help.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	
	CASE Vis.P14Help.EnableIndex OF
		0..15:
			Vis.P14Help.Status[Vis.P14Help.EnableIndex]	:=	SHOW	;
	END_CASE

	//DISPLAY INVERTER RESET BUTTON
	FOR i := 16 TO 31 DO
		IF(SysTemp.Alarms[i])THEN
			Vis.P14.Status[23]	:=	SHOW	;
		END_IF
	END_FOR
	IF(InvReset.Auto) AND(CL1.Input.Fault) THEN
		CL1.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CS1.Input.Fault) THEN
		CS1.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CV1.Input.Fault) THEN
		CV1.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CC1.Input.Fault) THEN
		CC1.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CC2.Input.Fault) THEN
		CC2.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CS2.Input.Fault) THEN
		CS2.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CV2.Input.Fault) THEN
		CV2.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CC3.Input.Fault) THEN
		CC3.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CC4.Input.Fault) THEN
		CC4.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CB1.Input.Fault) THEN
		CB1.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CB2.Input.Fault) THEN
		CB2.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CRB.Input.Fault) THEN
		CRB.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CRE.Input.Fault) THEN
		CRE.Output.CMDD_07	:=	TRUE	;
	END_IF
	IF(InvReset.Auto) AND(CLB.Input.Fault) THEN
		CLB.Output.CMDD_07	:=	TRUE	;
	END_IF
		
END_PROGRAM

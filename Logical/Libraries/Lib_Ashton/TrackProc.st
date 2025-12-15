(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: TrackProc.st
 * Author: nicke
 * Created: June 03, 2008
 ********************************************************************
 * Implementation of library Ashton
 ********************************************************************) 

(*Process Tracking Register*)	
FUNCTION_BLOCK TrackProc

(*At EStop capture elapsed time and creat new preset time*)	
IF EDGEPOS(EStop) THEN
	PTOnEStop:= (UDINT_TO_TIME(PT_On) - ON.ET);
	PTOffEStop:= (UDINT_TO_TIME(PT_Off) - OFF.ET);
	Recover:= TRUE;
END_IF
	
IF NOT(Recover) THEN
	ONPT:= UDINT_TO_TIME(PT_On);
	OFFPT:= UDINT_TO_TIME(PT_Off);
ELSE
	ONPT:= PTOnEStop;
	OFFPT:= PTOffEStop;
END_IF

(* Check for On Start Condition*)
IF EDGEPOS(ONStart) THEN
	BeforeOn:= TRUE;
END_IF

(* Time delay before process on*)
ON( IN:= (BeforeOn AND NOT EStop), PT:= ONPT);

IF EDGEPOS(ON.Q) THEN
	Out:= TRUE;
	BeforeOn:= FALSE;
END_IF
	
(* Check for Off Start Condition*)
IF EDGEPOS(OFFStart) THEN
	BeforeOff:= TRUE;
END_IF

(* Time delay before process off*)
OFF( IN:= (BeforeOff AND NOT EStop), PT:= OFFPT);

IF EDGEPOS(OFF.Q) THEN
	Out:= FALSE;
	BeforeOff:= FALSE;
END_IF

IF (End) THEN
	BeforeOn:= FALSE;
	BeforeOff:= FALSE;
	Recover:= FALSE;
	Out:= FALSE;
END_IF

END_FUNCTION_BLOCK
(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: GrindTime.st
 * Author: nicke
 * Created: June 09, 2008
 ********************************************************************
 * Implementation of library Ashton
 ********************************************************************) 

(*Calculate grind time and length*)
FUNCTION_BLOCK GrindTime

TotMS:= TotMSIn;
TotSec:= TotSecIn;
TotMin:= TotMinIn;
TotHr:= TotHrIn;
TotDay:= TotDayIn;
ShftMS:= ShftMSIn;
ShftSec:= ShftSecIn;
ShftMin:= ShftMinIn;
ShftHr:= ShftHrIn;
ShftDay:= ShftDayIn;
TotMtrs1:= TotMtrs1In;
TotMtrs2:= TotMtrs2In;
TotFt1:= TotFt1In;
TotFt2:= TotFt2In;
ShftMtrs1:= ShftMtrs1In;
ShftMtrs2:= ShftMtrs2In;
ShftFt1:= ShftFt1In;
ShftFt2:= ShftFt2In;
	
(* Enable calculation only when not resetting*)
IF EDGEPOS(On) AND NOT(TotReset) AND NOT(ShftReset) THEN
	(*Convert Measured Length/Width into msec*)
	CurrentMS:= Measured/(Speed/60.0);
	(*Convert to UINT value to split into whole seconds and milliseconds under 1000*)
	CurrentMSUINT:= REAL_TO_UINT (CurrentMS);
	WholeSec:=CurrentMSUINT/1000;
	Calc3:=WholeSec*1000;
	WholeMSec:=CurrentMSUINT-Calc3;

	(*Add milliseconds to Total Milliseconds*)
	TotMS:=WholeMSec+TotMS;

	IF TotMS>=1000 THEN 
		TotMS:=TotMS-1000;
		TotSec:=TotSec+WholeSec+1;
	ELSE 
		TotSec:=TotSec+WholeSec;
	END_IF
	
		(*Add milliseconds to Temporary Milliseconds*)
	ShftMS:=WholeMSec+ShftMS;

	IF ShftMS>=1000 THEN
		ShftMS:=ShftMS-1000;
		ShftSec:=ShftSec+WholeSec+1;
	ELSE
		ShftSec:=ShftSec+WholeSec;
	END_IF

	(*Calculate Machine Grind Time Minutes*)
	IF TotSec >= 60 THEN
		TotMin:=TotMin + 1;
		TotSec:= TotSec-60;
	END_IF
	IF ShftSec >= 60 THEN
		ShftMin:=ShftMin + 1;
		ShftSec:= ShftSec-60;
	END_IF
	(*Calculate Machine Grind Time Hours*)
	IF TotMin >= 60 THEN
		TotHr:=TotHr + 1;
		TotMin:= TotMin-60;
	END_IF
	IF ShftMin >= 60 THEN
		ShftHr:=ShftHr + 1;
		ShftMin:=ShftMin-60;
	END_IF
	(*Calculate Machine Grind Time Days*)
	IF TotHr >= 24 THEN
		TotDay:=TotDay + 1;
		TotHr:= TotHr-24;
	END_IF
	IF ShftHr = 24 THEN
		ShftDay:=ShftDay + 1;
		ShftHr:= ShftHr-24;
	END_IF
	
	(*Calculate grind length for belt wear calculations*)
	MeasuredM:= Measured;
	MeasuredUD:= REAL_TO_UDINT(MeasuredM);
	TotMtrs1:= MeasuredUD + TotMtrs1;
	IF TotMtrs1>= 1000000000 THEN
		TotMtrs2:= TotMtrs2+1;
		TotMtrs1:= TotMtrs1 - 1000000000;
	END_IF
	
	ShftMtrs1:= MeasuredUD + ShftMtrs1;
	IF ShftMtrs1>= 1000000000 THEN
		ShftMtrs2:= ShftMtrs2+1;
		ShftMtrs1:= ShftMtrs1 - 1000000000;
	END_IF
	
	(*Calculate grind length in Feet*)
	MeasuredFt:= MeasuredM * 3048.0;
	MeasuredFtUD:= REAL_TO_UDINT (MeasuredFt);
	TotFt1:= MeasuredFtUD + TotFt1;
	IF TotFt1>= 1000000000 THEN
		TotFt2:= TotFt2+1;
		TotFt1:= TotFt1 - 1000000000;
	END_IF

	ShftFt1:= MeasuredFtUD + ShftFt1;
	IF ShftFt1>= 1000000000 THEN
		ShftFt2:= ShftFt2+1;
		ShftFt1:= ShftFt1 - 1000000000;
	END_IF

END_IF

(*Reset Total Values*)
IF TotReset = TRUE THEN
	TotMS:= 0;
	TotSec:=0;
	TotMin:=0;
	TotHr:=0;
	TotDay:=0;
	TotMtrs1:= 0;
	TotMtrs2:= 0;
	TotFt1:= 0;
	TotFt2:= 0;
END_IF
IF ShftReset = TRUE THEN
	ShftMS:=0;
	ShftSec:=0;
	ShftMin:=0;
	ShftHr:=0;
	ShftDay:=0;
	ShftMtrs1:= 0;
	ShftMtrs2:= 0;
	ShftFt1:= 0;
	ShftFt2:= 0;
END_IF

END_FUNCTION_BLOCK

(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: RunTime.st
 * Author: NickE
 * Created: June 09, 2008
 ********************************************************************
 * Implementation of library Ashton
 ********************************************************************) 

(*Calculate system run time*)
FUNCTION_BLOCK RunTime
	
(* Write retained values to Internal UINT data *)
TotMin:= TotMinIn;
TotHr:= TotHrIn;
TotDay:= TotDayIn;
TotYr:= TotYrIn;
ShftMin:= ShftMinIn;
ShftHr:= ShftHrIn;
ShftDay:= ShftDayIn;
ShftYr:= ShftYrIn;


(*Count Run Time minutes*)
Minute( IN:= On AND NOT Minute.Q, PT:= T#1m);
IF (Minute.Q) THEN 
	TotMin := TotMin+1;
	ShftMin:= ShftMin+1;
END_IF

(*Calculate Total Run Time Hours*)
IF TotMin = 60 THEN
	TotHr := TotHr+1;
	TotMin := 0;
END_IF
(*Calculate Shift Run Time Hours*)
IF ShftMin = 60 THEN
	ShftHr := ShftHr +1;
	ShftMin := 0;
END_IF
(*Calculate Total Run Time Days*)
IF TotHr = 24 THEN
	TotDay := TotDay + 1;
	TotHr := 0;
END_IF
(*Calculate Shift Run Time Days*)
IF ShftHr = 24 THEN
	ShftDay := ShftDay + 1;
	ShftHr := 0;
END_IF
(*Calculate Total Run Time Years*)
IF TotDay = 365 THEN
	TotYr := TotYr + 1;
	TotDay := 0;
END_IF;
(*Calculate Shift Run Time Years*)
IF ShftDay = 365 THEN
	ShftYr := ShftYr +1;
	ShftDay := 0;
END_IF;
(*Reset Shift Values*)
IF (ShftReset) THEN
	ShftMin:= 0;
	ShftHr:= 0;
	ShftDay:=0;
	ShftYr:=0;
END_IF;
(*Reset Total Values*)
IF TotReset = TRUE THEN
	TotMin:= 0;
	TotHr:= 0;
	TotDay:=0;
	TotYr:=0;
END_IF;

END_FUNCTION_BLOCK

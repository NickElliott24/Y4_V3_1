(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: C5Restart.st
 * Author: nicke
 * Created: June 05, 2008
 ********************************************************************
 * Implementation of library Ashton
 ********************************************************************) 

(*Calculate Restart delay for C5R*)
FUNCTION_BLOCK C5Restart
(* Calculate valus for preset *)	
Preset:= (6000/(Speed/6));
IF Preset < 3000.0 THEN
	Preset:= 1.0;
ELSE
	Preset:= (Preset - 3000.0);
END_IF

(* Delay for C5 restart *)
TON_001( IN:= Start, PT:= UDINT_TO_TIME(REAL_TO_UDINT(Preset)) );
Out:= TON_001.Q;

END_FUNCTION_BLOCK

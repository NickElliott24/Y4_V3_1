(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: Center.st
 * Author: nicke
 * Created: September 09, 2009
 ********************************************************************
 * Implementation of library Ashton
 ********************************************************************) 

(*TODO: Add your comment here*)
FUNCTION_BLOCK Center2

(*Calculate m/min*)
	Calc1:=Speed/0.06;
	(*Calculate Time required for deceleration*)
	DecTime:=Speed/50;
	(*Calculate Distance travelled during deceleration*)
	DecDist:=((Calc1/4)*DecTime);
	(*Calculate Preset TIme for Batch Centering Time Delay*)
	PTReal:=(((Centre-(WidthIn/2))-DecDist)/Calc1)*1000;
	(*Convert real value into UDINT*)
	PT:= REAL_TO_UDINT (PTReal);

END_FUNCTION_BLOCK

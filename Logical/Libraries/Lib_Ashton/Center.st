(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: Center.st
 * Author: nicke
 ********************************************************************
 * Implementation of library Ashton
 ********************************************************************) 

//CALCULATE PRESET TIME FOR CENTERING
FUNCTION_BLOCK Center

	//CALCULATE M/MIN
	Calc1 := Speed / 60 ;
	//CALCULATE TIME REQUIRED FOR ACCELERATION
	AccTime := (Calc1 * 0.5) * 100 ;
	//CALCULATE DISTANCE TRAVELLED DURING ACCELERATION AND DECELERATION
	AccDecDist := (((Calc1 / 4) * Calc1) * 2) * 1000 ;
	//CALCULATE PRESET TIME FOR BATCH CENTERING TIME DELAY
	PTReal:=(((Centre - (WidthIn / 2) - AccDecDist) / Calc1) / 10) + AccTime ;
	//CONVERT REAL VALUE INTO UDINT
	PT := REAL_TO_UDINT (PTReal) ;

END_FUNCTION_BLOCK

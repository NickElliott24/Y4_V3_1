(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: Photo.st
 * Author: nicke
 ********************************************************************
 * Implementation of library Ashton
 ********************************************************************) 

//ANTI BOUNCE INPUT FILTER
FUNCTION_BLOCK Photo
	
	//TON DelayB4ON USED TO TURN ON INTERNAL INPUT	
	//FB INPUTS
	DelayB4ON.IN := SensorIN ;
	PTON := UDINT_TO_TIME(REAL_TO_UDINT(1200/SpeedON)) ;
	IF(OverrideON = 0) THEN
		DelayB4ON.PT := PTON ;
	ELSE
		DelayB4ON.PT := OverrideON ;
	END_IF
	//CALL FB
	DelayB4ON ();
	//FB OUTPUT
	IF EDGEPOS(DelayB4ON.Q) THEN
		SensorOUT := TRUE;
	END_IF
	
	//TON DelayB4OFF USED TO TURN OFF INTERNAL INPUT
	//FB INPUTS
	DelayB4OFF.IN := NOT(SensorIN) ;
	PTOFF := UDINT_TO_TIME(REAL_TO_UDINT(1200/SpeedOFF)) ;
	IF(OverrideOFF = 0) THEN
		DelayB4OFF.PT := PTOFF ;
	ELSE
		DelayB4OFF.PT := OverrideOFF ;
	END_IF
	//CALL FB
	DelayB4OFF ();
	//FB OUTPUT
	IF EDGEPOS(DelayB4OFF.Q) THEN
		SensorOUT := FALSE;
	END_IF

	//SENSOR ELAPSED TIME - USED FOR MEASUREMENT CALCULATION
	IF EDGEPOS(SensorOUT) THEN
		Measure.Previous := clock_ms() ;
	END_IF
	IF EDGENEG(SensorOUT) THEN
		Measure.Current := clock_ms() ;
		Measure.Elapsed := TIME_TO_UDINT(Measure.Current - Measure.Previous) ;
	END_IF
	Measured := (UDINT_TO_REAL(Measure.Elapsed))*(SpeedON/60) ;

END_FUNCTION_BLOCK

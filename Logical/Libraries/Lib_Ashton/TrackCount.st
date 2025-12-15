(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: TrackCount.st
 * Author: nicke
 * Created: May 27, 2008
 ********************************************************************
 * Implementation of library Ashton
 ********************************************************************) 

(*TODO: Add your comment here*)
FUNCTION_BLOCK TrackCount
	
	Count:= 0;
	
	IF IN1 > 0 THEN
		Count:= Count + 1;
	END_IF
	IF IN2 > 0 THEN
		Count:= Count + 1;
	END_IF
	IF IN3 > 0 THEN
		Count:= Count + 1;
	END_IF
	IF IN4 > 0 THEN
		Count:= Count + 1;
	END_IF
	IF IN5 > 0 THEN
		Count:= Count + 1;
	END_IF
	IF IN6 > 0 THEN
		Count:= Count + 1;
	END_IF
	
END_FUNCTION_BLOCK

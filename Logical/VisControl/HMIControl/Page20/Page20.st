(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: P20
 * File: P20.st
 * Author: nicke
 * Created: February 08, 2013
 ********************************************************************
 * Implementation of program P20
 ********************************************************************)

PROGRAM _CYCLIC

	//ASHTON TECH SCREEN
	memcpy(ADR(Vis.P20.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	
	CASE Vis.P20.EnableIndex OF
		0..7:
			Vis.P20.Status[Vis.P20.EnableIndex]	:=	SHOW	;
	END_CASE

END_PROGRAM

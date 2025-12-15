(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Page20
 * File: S_Page20.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Page20
 ********************************************************************)

PROGRAM _CYCLIC

	//ASHTON TECH SCREEN
	memcpy(ADR(ServiceVis.P20.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
	
	CASE ServiceVis.P20.EnableIndex OF
		0..7:
			ServiceVis.P20.Status[ServiceVis.P20.EnableIndex]	:=	SHOW	;
	END_CASE

END_PROGRAM

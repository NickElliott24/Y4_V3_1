(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_ESRecover
 * File: S_ESRecover.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_ESRecover
 ********************************************************************)

PROGRAM _CYCLIC

(* Switch to EMO Recovery screen if any glass present *)
//	IF EDGEPOS(Control.EStop) AND (Control.Count > 0) THEN
//		ServiceVis.P11.EnableIndex	:= 	20	;
//		ServiceVis.Page.New	:=	P11_MIMIC	;
//	END_IF

	//ESTOP SCREEN CONTROL
	//??? ALWAYS ENSURE .EMO IS SET TO Vis. NOT ServiceVis.
	
END_PROGRAM

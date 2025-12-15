(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Filstar
 * File: FilstarCyclic.st
 * Author: nicke
 * Created: February, 2012
 ********************************************************************
 * Implementation of program Filstar
 ********************************************************************)

PROGRAM _INIT
	
Filstar.Open.IN		:=	TRUE	;
	
END_PROGRAM

PROGRAM _CYCLIC

(*Delay for filstar valve open*)
Filstar.Open.PT	:=	PresetSys.Filstar[1]	;
Filstar.Open ();
(*Filstar valve control*)
Filstar.Out	:=	Filstar.Open.M	;

IF (Filstar.Open.Q) THEN
	Filstar.Open.IN		:=	FALSE	;
	Filstar.Interval.IN	:=	TRUE	;
END_IF
(*Delay for inteval between valve open*)
Filstar.Interval.PT	:=	PresetSys.Filstar[2]	;
Filstar.Interval ();

IF (Filstar.Interval.Q) THEN
	Filstar.Interval.IN	:= 	FALSE	;
	Filstar.Open.IN		:=	TRUE	;
END_IF			

END_PROGRAM

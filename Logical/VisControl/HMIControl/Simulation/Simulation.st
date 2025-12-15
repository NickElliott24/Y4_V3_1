(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Simulation
 * File: Simulation.st
 * Author: NickE
 * Created: January 24, 2013
 ********************************************************************
 * Implementation of program Simulation
 ********************************************************************)

PROGRAM _INIT

	Control.EStop1 := TRUE ;
	Control.EStop2 := TRUE ;
	Simulation.Disp := SHOW ;
	Simulation.On := TRUE ;
	S100Reed.In := TRUE ;
	S102Reed.In := TRUE ;
	S104Reed.In := TRUE ;
	S106Reed.In := TRUE ;
	S108Reed.In := TRUE ;
	S110Reed.In := TRUE ;
	S112Reed.In := TRUE ;
	S114Reed.In := TRUE ;
	S120Reed.In := TRUE ;
	S122Reed.In := TRUE ;
	S124Reed.In := TRUE ;
	S126Reed.In := TRUE ;
	WashRun.In := TRUE ;
	CLB.Input.ETAD_02	:=	TRUE	;
	CRB.Input.ETAD_02	:=	TRUE	;

END_PROGRAM

PROGRAM _CYCLIC

	Ax1.OriginSet	:=	Control.Achieved1	;
	Ax1.Error		:=	FALSE				;
	Servo1POT.In	:= 	TRUE				;
	Servo1NOT.In	:=	TRUE				;
	Ax2.OriginSet	:=	Control.Achieved1	;
	Ax2.Error		:=	FALSE				;
	Servo2POT.In	:=	TRUE				;
	Servo2NOT.In	:=	TRUE				;
	
	IF EDGEPOS(Control.EStop2) THEN
		Control.EStop1	:=	TRUE	;
	END_IF

	IF NOT(TestAuto.In) THEN
		S30Reed.In	:= 	NOT(Sol30Pal1.Auto)	;
		S31Reed.In	:=	(Sol30Pal1.Auto)	;
		S32Reed.In	:= 	NOT(Sol31Pal2.Auto)	;
		S33Reed.In	:=	(Sol31Pal2.Auto)	;
		S34Reed.In	:= 	NOT(Sol32Pal3.Auto)	;
		S35Reed.In	:=	(Sol32Pal3.Auto)	;
		S36Reed.In	:= 	NOT(Sol33Pal4.Auto)	;
		S37Reed.In	:=	(Sol33Pal4.Auto)	;
		S52Reed.In	:= 	NOT(Sol40Datum.Auto);
		S53Reed.In	:=	(Sol40Datum.Auto)	;
	END_IF
	
END_PROGRAM


(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Page18
 * File: Page18.st
 * Author: nicke
 * Created: April 30, 2013
 ********************************************************************
 * Implementation of program Page18
 ********************************************************************)

PROGRAM _CYCLIC

(* Section to control pop up warnings for flip arms *)
(*Seamer 1 Down *)
	Vis.FlipDisp1.Runtime1	:=	HIDE	;
	Vis.FlipDisp1.Runtime2	:=	HIDE	;
	Vis.FlipDisp1.Runtime3	:=	HIDE	;
	Vis.FlipDisp1.Runtime4	:=	HIDE	;

	IF ((Ax1.Active) OR NOT(Ax1.OriginSet)) AND NOT(Ax1.Block) AND(Control.Achieved1) THEN
		Vis.FlipDisp1.Runtime1	:=	SHOW	;
		Vis.FlipDisp1.TextIndex1	:=	BOOL_TO_USINT(NOT(S100Reed.In))	;
		Vis.FlipDisp1.TextIndex2	:=	BOOL_TO_USINT(NOT(S102Reed.In))	;
		Vis.FlipDisp1.TextIndex3	:=	BOOL_TO_USINT(NOT(S104Reed.In))	;
		Vis.FlipDisp1.TextIndex4	:=	BOOL_TO_USINT(NOT(S106Reed.In))	;
		Vis.FlipDisp1.TextIndex5	:=	BOOL_TO_USINT(NOT(S108Reed.In))	;
		Vis.FlipDisp1.TextIndex6	:=	BOOL_TO_USINT(NOT(S110Reed.In))	;
		Vis.FlipDisp1.TextIndex7	:=	BOOL_TO_USINT(NOT(S112Reed.In))	;
		Vis.FlipDisp1.TextIndex8	:=	BOOL_TO_USINT(NOT(S114Reed.In))	;
		Vis.FlipDisp1.TextIndex9	:=	BOOL_TO_USINT(NOT(S116Reed.In))	;
		Vis.FlipDisp1.TextIndex10	:=	BOOL_TO_USINT(NOT(S118Reed.In))	;
		CASE Perms.FLIPARMS1 OF
			3:
				Vis.FlipDisp1.Runtime2		:=	SHOW	;
			4:
				Vis.FlipDisp1.Runtime2		:=	SHOW	;
				Vis.FlipDisp1.Runtime3		:=	SHOW	;
			5:
				Vis.FlipDisp1.Runtime2		:=	SHOW	;
				Vis.FlipDisp1.Runtime3		:=	SHOW	;
				Vis.FlipDisp1.Runtime4		:=	SHOW	;
		END_CASE
	END_IF

	(* Seamer 1 Up *)
	Vis.FlipDisp1.Runtime5	:= HIDE	;
	Vis.FlipDisp1.Runtime6	:= HIDE	;
	Vis.FlipDisp1.Runtime7	:= HIDE	;
	Vis.FlipDisp1.Runtime8	:= HIDE	;
	Vis.FlipDisp1.Runtime9	:= HIDE	;
	Vis.FlipDisp1.TextIndex11	:=	BOOL_TO_USINT(NOT(S101Reed.In))	;
	Vis.FlipDisp1.TextIndex12	:=	BOOL_TO_USINT(NOT(S103Reed.In))	;
	Vis.FlipDisp1.TextIndex13	:=	BOOL_TO_USINT(NOT(S105Reed.In))	;
	Vis.FlipDisp1.TextIndex14	:=	BOOL_TO_USINT(NOT(S107Reed.In))	;
	Vis.FlipDisp1.TextIndex15	:=	BOOL_TO_USINT(NOT(S109Reed.In))	;
	Vis.FlipDisp1.TextIndex16	:=	BOOL_TO_USINT(NOT(S111Reed.In))	;
	Vis.FlipDisp1.TextIndex17	:=	BOOL_TO_USINT(NOT(S113Reed.In))	;
	Vis.FlipDisp1.TextIndex18	:=	BOOL_TO_USINT(NOT(S115Reed.In))	;
	Vis.FlipDisp1.TextIndex19	:=	BOOL_TO_USINT(NOT(S117Reed.In))	;
	Vis.FlipDisp1.TextIndex20	:=	BOOL_TO_USINT(NOT(S119Reed.In))	;
	CASE ArmsTemp1.CheckRaised OF
		0:	(* No arms up *)
		1:	(* 1 arm up *)
			Vis.FlipDisp1.Runtime5	:= SHOW	;
		2:	(* 2 arms up *)
			Vis.FlipDisp1.Runtime5	:= SHOW	;
			Vis.FlipDisp1.Runtime6	:= SHOW	;
		3:  (* 3 arms up *)	
			Vis.FlipDisp1.Runtime5	:= SHOW	;
			Vis.FlipDisp1.Runtime6	:= SHOW	;
			Vis.FlipDisp1.Runtime7	:= SHOW	;
		4:	(* 4 arms up *)
			Vis.FlipDisp1.Runtime5	:= SHOW	;
			Vis.FlipDisp1.Runtime6	:= SHOW	;
			Vis.FlipDisp1.Runtime7	:= SHOW	;
			Vis.FlipDisp1.Runtime8	:= SHOW	;
		5:	(* 5 arms up *)
			Vis.FlipDisp1.Runtime5	:= SHOW	;
			Vis.FlipDisp1.Runtime6	:= SHOW	;
			Vis.FlipDisp1.Runtime7	:= SHOW	;
			Vis.FlipDisp1.Runtime8	:= SHOW	;
			Vis.FlipDisp1.Runtime9	:= SHOW	;
	END_CASE

	(* Seamer 2 Down *)
	Vis.FlipDisp2.Runtime1	:=	HIDE	;
	Vis.FlipDisp2.Runtime2	:=	HIDE	;
	Vis.FlipDisp2.Runtime3	:=	HIDE	;
	Vis.FlipDisp2.Runtime4	:=	HIDE	;

	IF ((Ax2.Active) OR NOT(Ax2.OriginSet)) AND NOT(Ax2.Block) AND(Control.Achieved1) THEN
		Vis.FlipDisp2.Runtime1	:=	SHOW	;
		Vis.FlipDisp2.TextIndex1	:=	BOOL_TO_USINT(NOT(S120Reed.In))	;
		Vis.FlipDisp2.TextIndex2	:=	BOOL_TO_USINT(NOT(S122Reed.In))	;
		Vis.FlipDisp2.TextIndex3	:=	BOOL_TO_USINT(NOT(S124Reed.In))	;
		Vis.FlipDisp2.TextIndex4	:=	BOOL_TO_USINT(NOT(S126Reed.In))	;
		Vis.FlipDisp2.TextIndex5	:=	BOOL_TO_USINT(NOT(S128Reed.In))	;
		Vis.FlipDisp2.TextIndex6	:=	BOOL_TO_USINT(NOT(S130Reed.In))	;
		Vis.FlipDisp2.TextIndex7	:=	BOOL_TO_USINT(NOT(S132Reed.In))	;
		Vis.FlipDisp2.TextIndex8	:=	BOOL_TO_USINT(NOT(S134Reed.In))	;
		Vis.FlipDisp2.TextIndex9	:=	BOOL_TO_USINT(NOT(S136Reed.In))	;
		Vis.FlipDisp2.TextIndex10	:=	BOOL_TO_USINT(NOT(S138Reed.In))	;
		CASE Perms.FLIPARMS2 OF				
			3:
				Vis.FlipDisp2.Runtime2	:=	SHOW	;
			4:
				Vis.FlipDisp2.Runtime2	:=	SHOW	;
				Vis.FlipDisp2.Runtime3	:=	SHOW	;
			5:
				Vis.FlipDisp2.Runtime2	:=	SHOW	;
				Vis.FlipDisp2.Runtime3	:=	SHOW	;
				Vis.FlipDisp2.Runtime4	:=	SHOW	;
		END_CASE
	END_IF

	(* Seamer 2 Up *)
	Vis.FlipDisp2.Runtime5	:= HIDE	;
	Vis.FlipDisp2.Runtime6	:= HIDE	;
	Vis.FlipDisp2.Runtime7	:= HIDE	;
	Vis.FlipDisp2.Runtime8	:= HIDE	;
	Vis.FlipDisp2.Runtime9	:= HIDE	;
	Vis.FlipDisp2.TextIndex11	:=	BOOL_TO_USINT(NOT(S121Reed.In))	;
	Vis.FlipDisp2.TextIndex12	:=	BOOL_TO_USINT(NOT(S123Reed.In))	;
	Vis.FlipDisp2.TextIndex13	:=	BOOL_TO_USINT(NOT(S125Reed.In))	;
	Vis.FlipDisp2.TextIndex14	:=	BOOL_TO_USINT(NOT(S127Reed.In))	;
	Vis.FlipDisp2.TextIndex15	:=	BOOL_TO_USINT(NOT(S129Reed.In))	;
	Vis.FlipDisp2.TextIndex16	:=	BOOL_TO_USINT(NOT(S131Reed.In))	;
	Vis.FlipDisp2.TextIndex17	:=	BOOL_TO_USINT(NOT(S133Reed.In))	;
	Vis.FlipDisp2.TextIndex18	:=	BOOL_TO_USINT(NOT(S135Reed.In))	;
	Vis.FlipDisp2.TextIndex19	:=	BOOL_TO_USINT(NOT(S137Reed.In))	;
	Vis.FlipDisp2.TextIndex20	:=	BOOL_TO_USINT(NOT(S139Reed.In))	;
	CASE ArmsTemp2.CheckRaised OF
		0:	(* No arms up *)
		1:	(* 1 arm up *)
			Vis.FlipDisp2.Runtime5	:= SHOW	;
			Vis.FlipDisp2.Runtime6	:= SHOW	;
		2:	(* 2 arms up *)
			Vis.FlipDisp2.Runtime5	:= SHOW	;
			Vis.FlipDisp2.Runtime6	:= SHOW	;
			Vis.FlipDisp2.Runtime7	:= SHOW	;
		3:  (* 3 arms up *)		
			Vis.FlipDisp2.Runtime5	:= SHOW	;
			Vis.FlipDisp2.Runtime6	:= SHOW	;
			Vis.FlipDisp2.Runtime7	:= SHOW	;
			Vis.FlipDisp2.Runtime8	:= SHOW	;
		4:	(* 4 arms up *)
			Vis.FlipDisp2.Runtime5	:= SHOW	;
			Vis.FlipDisp2.Runtime6	:= SHOW	;
			Vis.FlipDisp2.Runtime7	:= SHOW	;
			Vis.FlipDisp2.Runtime8	:= SHOW	;
			Vis.FlipDisp2.Runtime9	:= SHOW	;
	END_CASE

	//FILTER TO SHOW WARNINGS	
	Warning.Control := 3 ; 	//Enable Alarm Index selection *)
	Warning.Group := 3 ;
	Warning.Alarm := 0 ;
	Warning.Priority := 0 ;

	Warn.Timeout[0] := Track001.TimeoutOUT ;
	Warn.Timeout[1] := Track002.TimeoutOUT ;
	Warn.Timeout[2] := Track003.TimeoutOUT ;
	Warn.Timeout[3] := Track101.TimeoutOUT ;
	Warn.Timeout[4] := Track102.TimeoutOUT ;
	Warn.Timeout[5] := Track104.TimeoutOUT ;
	Warn.Timeout[6] := Track106.TimeoutOUT ;
	Warn.Timeout[7] := Track111.TimeoutOUT ;
	Warn.Timeout[8] := Track112.TimeoutOUT ;
	Warn.Timeout[9] := Track113.TimeoutOUT ;
	Warn.Timeout[10] := Track201.TimeoutOUT ;
	Warn.Timeout[11] := Track202.TimeoutOUT ;
	Warn.Timeout[12] := Track204.TimeoutOUT ;
	Warn.Timeout[13] := Track207.TimeoutOUT ;
	Warn.Timeout[14] := Track301.TimeoutOUT ;
	Warn.Timeout[15] := Track401.TimeoutOUT ;
	Warn.Timeout[16] := Track412.TimeoutOUT ;
	Warn.Timeout[17] := Track413.TimeoutOUT ;
	Warn.Timeout[18] := Track414.TimeoutOUT ;
	Warn.Timeout[19] := Track503.TimeoutOUT ;
	Warn.Timeout[20] := Track504.TimeoutOUT ;
	Warn.Timeout[21] := Track506.TimeoutOUT ;
	Warn.Timeout[22] := Track602.TimeoutOUT ;
	Warn.Timeout[23] := Track801.TimeoutOUT ;
	Warn.Timeout[24] := Track803.TimeoutOUT ;
	Warn.Timeout[25] := Track804.TimeoutOUT ;
	Warn.Timeout[26] := Track805.TimeoutOUT ;
	Warn.Timeout[27] := Track811.TimeoutOUT ;
	Warn.Timeout[28] := Track821.TimeoutOUT ;
	Warn.Timeout[29] := Track512.TimeoutOUT ;

	FOR i:= 0 TO USINT_TO_INT(Warn.iMax) DO
		IF EDGEPOS(Warn.Timeout[i]) THEN 
			Warn.Acks[i] := TRUE ;
		END_IF
	END_FOR
	
	FOR i:= 0 TO USINT_TO_INT(Warn.iMax) DO
		IF NOT(Warn.Timeout[i]) THEN
			Warn.Acks[i] := FALSE ;
		END_IF
	END_FOR

	//SET WARNING BIT ACTIVE WHEN TIMEOUT OCCURS
	FOR Warn.i:= 0 TO Warn.iMax DO
		IF Warn.Timeout[Warn.i] = TRUE THEN
			SysTemp.Warning :=  TRUE ;
			Warn.Button := SHOW ;
			EXIT;
		ELSE
			SysTemp.Warning := FALSE ;
			Warn.Button := HIDE ;
		END_IF
	END_FOR

	//Apply Warn.Block if EMO.Latch* are on
	IF EDGEPOS(EMO.Latch1) AND NOT(Warn.Block) THEN
		Warn.Block := TRUE ;
		Warn.BlockTemp := TRUE ;
	END_IF
	IF EDGEPOS(EMO.Latch2) AND NOT(Warn.Block) THEN
		Warn.Block := TRUE ;
		Warn.BlockTemp := TRUE ;
	END_IF

	IF EDGENEG(EMO.Latch1) AND NOT(EMO.Latch2) AND(Warn.BlockTemp) THEN
		Warn.Block := FALSE ;
		Warn.BlockTemp := FALSE ;
	END_IF
	IF EDGENEG(EMO.Latch2) AND NOT(EMO.Latch1) AND(Warn.BlockTemp) THEN
		Warn.Block := FALSE ;
		Warn.BlockTemp := FALSE ;
	END_IF

	//RESET ACK BITS IF TIMEOUT DISABLED 
	IF(Warn.Block) THEN
		FOR Warn.Warningi:= 0 TO Warn.iMax DO
			Warn.Acks[Warn.Warningi]:= FALSE;
		END_FOR
	END_IF

	Warn.AckDisp	:= 	HIDE	;
	IF(SysTemp.Warning) THEN
		FOR Warn.Warningi:= 0 TO Warn.iMax DO
			IF (Warn.Acks[Warn.Warningi] = TRUE) THEN
				Warn.AckDisp	:= 	SHOW	;
				EXIT;
			ELSE
				Warn.AckDisp	:= 	HIDE	;
			END_IF
		END_FOR
	END_IF
		
	IF EDGEPOS(Warn.Ack) THEN
		Warn.Acks[Warn.Warningi]	:=	0	;
	END_IF

	//EVENTS
	SysTemp.Events[0] := Control.Start ;
	SysTemp.Events[1] := Control.Stop ;
	SysTemp.Events[2] := Control.EStop1 AND Control.Empty ;
	SysTemp.Events[3] := Control.EStop1 AND NOT Control.Empty ;
	SysTemp.Events[4] := Seamers.Enable[1] ;
	SysTemp.Events[5] := Seamers.Enable[2] ;
	SysTemp.Events[8] := Seamers.AutoStart[0] ;
	SysTemp.Events[9] := Seamers.AutoStart[1] ;
	SysTemp.Events[10] := Seamers.AutoStart[2] ;
	SysTemp.Events[13] := Control.Achieved1 ;
	SysTemp.Events[14] := Control.Achieved2 ;
	SysTemp.Events[15] := Reset.Count ;
	SysTemp.Events[16] := Pause.Active ;

END_PROGRAM

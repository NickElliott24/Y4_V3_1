(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Page18
 * File: S_Page18.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Page18
 ********************************************************************)

PROGRAM _CYCLIC

(* Section to control pop up warnings for flip arms *)
(*Seamer 1 Down *)
	ServiceVis.FlipDisp1.Runtime1	:=	HIDE	;
	ServiceVis.FlipDisp1.Runtime2	:=	HIDE	;
	ServiceVis.FlipDisp1.Runtime3	:=	HIDE	;
	ServiceVis.FlipDisp1.Runtime4	:=	HIDE	;

	IF ((Ax1.Active) OR NOT(Ax1.OriginSet)) AND NOT(Ax1.Block) AND(Control.Achieved1) THEN
		ServiceVis.FlipDisp1.Runtime1	:=	SHOW	;
		ServiceVis.FlipDisp1.TextIndex1	:=	BOOL_TO_USINT(NOT(S100Reed.In))	;
		ServiceVis.FlipDisp1.TextIndex2	:=	BOOL_TO_USINT(NOT(S102Reed.In))	;
		ServiceVis.FlipDisp1.TextIndex3	:=	BOOL_TO_USINT(NOT(S104Reed.In))	;
		ServiceVis.FlipDisp1.TextIndex4	:=	BOOL_TO_USINT(NOT(S106Reed.In))	;
		ServiceVis.FlipDisp1.TextIndex5	:=	BOOL_TO_USINT(NOT(S108Reed.In))	;
		ServiceVis.FlipDisp1.TextIndex6	:=	BOOL_TO_USINT(NOT(S110Reed.In))	;
		ServiceVis.FlipDisp1.TextIndex7	:=	BOOL_TO_USINT(NOT(S112Reed.In))	;
		ServiceVis.FlipDisp1.TextIndex8	:=	BOOL_TO_USINT(NOT(S114Reed.In))	;
		ServiceVis.FlipDisp1.TextIndex9	:=	BOOL_TO_USINT(NOT(S116Reed.In))	;
		ServiceVis.FlipDisp1.TextIndex10	:=	BOOL_TO_USINT(NOT(S118Reed.In))	;
		CASE Perms.FLIPARMS1 OF
			3:
				ServiceVis.FlipDisp1.Runtime2		:=	SHOW	;
			4:
				ServiceVis.FlipDisp1.Runtime2		:=	SHOW	;
				ServiceVis.FlipDisp1.Runtime3		:=	SHOW	;
			5:
				ServiceVis.FlipDisp1.Runtime2		:=	SHOW	;
				ServiceVis.FlipDisp1.Runtime3		:=	SHOW	;
				ServiceVis.FlipDisp1.Runtime4		:=	SHOW	;
		END_CASE
	END_IF

	(* Seamer 1 Up *)
	ServiceVis.FlipDisp1.Runtime5	:= HIDE	;
	ServiceVis.FlipDisp1.Runtime6	:= HIDE	;
	ServiceVis.FlipDisp1.Runtime7	:= HIDE	;
	ServiceVis.FlipDisp1.Runtime8	:= HIDE	;
	ServiceVis.FlipDisp1.Runtime9	:= HIDE	;
	ServiceVis.FlipDisp1.TextIndex11	:=	BOOL_TO_USINT(NOT(S101Reed.In))	;
	ServiceVis.FlipDisp1.TextIndex12	:=	BOOL_TO_USINT(NOT(S103Reed.In))	;
	ServiceVis.FlipDisp1.TextIndex13	:=	BOOL_TO_USINT(NOT(S105Reed.In))	;
	ServiceVis.FlipDisp1.TextIndex14	:=	BOOL_TO_USINT(NOT(S107Reed.In))	;
	ServiceVis.FlipDisp1.TextIndex15	:=	BOOL_TO_USINT(NOT(S109Reed.In))	;
	ServiceVis.FlipDisp1.TextIndex16	:=	BOOL_TO_USINT(NOT(S111Reed.In))	;
	ServiceVis.FlipDisp1.TextIndex17	:=	BOOL_TO_USINT(NOT(S113Reed.In))	;
	ServiceVis.FlipDisp1.TextIndex18	:=	BOOL_TO_USINT(NOT(S115Reed.In))	;
	ServiceVis.FlipDisp1.TextIndex19	:=	BOOL_TO_USINT(NOT(S117Reed.In))	;
	ServiceVis.FlipDisp1.TextIndex20	:=	BOOL_TO_USINT(NOT(S119Reed.In))	;
	CASE ArmsTemp2.CheckRaised OF
		0:	(* No arms up *)
		1:	(* 1 arm up *)
			ServiceVis.FlipDisp1.Runtime5	:= SHOW	;
		2:	(* 2 arms up *)
			ServiceVis.FlipDisp1.Runtime5	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime6	:= SHOW	;
		3:  (* 3 arms up *)	
			ServiceVis.FlipDisp1.Runtime5	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime6	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime7	:= SHOW	;
		4:	(* 4 arms up *)
			ServiceVis.FlipDisp1.Runtime5	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime6	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime7	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime8	:= SHOW	;
		5:	(* 5 arms up *)
			ServiceVis.FlipDisp1.Runtime5	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime6	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime7	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime8	:= SHOW	;
			ServiceVis.FlipDisp1.Runtime9	:= SHOW	;
	END_CASE

	(* Seamer 2 Down *)
	ServiceVis.FlipDisp2.Runtime1	:=	HIDE	;
	ServiceVis.FlipDisp2.Runtime2	:=	HIDE	;
	ServiceVis.FlipDisp2.Runtime3	:=	HIDE	;
	ServiceVis.FlipDisp2.Runtime4	:=	HIDE	;

	IF ((Ax2.Active) OR NOT(Ax2.OriginSet)) AND NOT(Ax2.Block) AND(Control.Achieved1) THEN
		ServiceVis.FlipDisp2.Runtime1	:=	SHOW	;
		ServiceVis.FlipDisp2.TextIndex1	:=	BOOL_TO_USINT(NOT(S120Reed.In))	;
		ServiceVis.FlipDisp2.TextIndex2	:=	BOOL_TO_USINT(NOT(S122Reed.In))	;
		ServiceVis.FlipDisp2.TextIndex3	:=	BOOL_TO_USINT(NOT(S124Reed.In))	;
		ServiceVis.FlipDisp2.TextIndex4	:=	BOOL_TO_USINT(NOT(S126Reed.In))	;
		ServiceVis.FlipDisp2.TextIndex5	:=	BOOL_TO_USINT(NOT(S128Reed.In))	;
		ServiceVis.FlipDisp2.TextIndex6	:=	BOOL_TO_USINT(NOT(S130Reed.In))	;
		ServiceVis.FlipDisp2.TextIndex7	:=	BOOL_TO_USINT(NOT(S132Reed.In))	;
		ServiceVis.FlipDisp2.TextIndex8	:=	BOOL_TO_USINT(NOT(S134Reed.In))	;
		ServiceVis.FlipDisp2.TextIndex9	:=	BOOL_TO_USINT(NOT(S136Reed.In))	;
		ServiceVis.FlipDisp2.TextIndex10	:=	BOOL_TO_USINT(NOT(S138Reed.In))	;
		CASE Perms.FLIPARMS2 OF				
			3:
				ServiceVis.FlipDisp2.Runtime2	:=	SHOW	;
			4:
				ServiceVis.FlipDisp2.Runtime2	:=	SHOW	;
				ServiceVis.FlipDisp2.Runtime3	:=	SHOW	;
			5:
				ServiceVis.FlipDisp2.Runtime2	:=	SHOW	;
				ServiceVis.FlipDisp2.Runtime3	:=	SHOW	;
				ServiceVis.FlipDisp2.Runtime4	:=	SHOW	;
		END_CASE
	END_IF

	(* Seamer 2 Up *)
	ServiceVis.FlipDisp2.Runtime5	:= HIDE	;
	ServiceVis.FlipDisp2.Runtime6	:= HIDE	;
	ServiceVis.FlipDisp2.Runtime7	:= HIDE	;
	ServiceVis.FlipDisp2.Runtime8	:= HIDE	;
	ServiceVis.FlipDisp2.Runtime9	:= HIDE	;
	ServiceVis.FlipDisp2.TextIndex11	:=	BOOL_TO_USINT(NOT(S121Reed.In))	;
	ServiceVis.FlipDisp2.TextIndex12	:=	BOOL_TO_USINT(NOT(S123Reed.In))	;
	ServiceVis.FlipDisp2.TextIndex13	:=	BOOL_TO_USINT(NOT(S125Reed.In))	;
	ServiceVis.FlipDisp2.TextIndex14	:=	BOOL_TO_USINT(NOT(S127Reed.In))	;
	ServiceVis.FlipDisp2.TextIndex15	:=	BOOL_TO_USINT(NOT(S129Reed.In))	;
	ServiceVis.FlipDisp2.TextIndex16	:=	BOOL_TO_USINT(NOT(S131Reed.In))	;
	ServiceVis.FlipDisp2.TextIndex17	:=	BOOL_TO_USINT(NOT(S133Reed.In))	;
	ServiceVis.FlipDisp2.TextIndex18	:=	BOOL_TO_USINT(NOT(S135Reed.In))	;
	ServiceVis.FlipDisp2.TextIndex19	:=	BOOL_TO_USINT(NOT(S137Reed.In))	;
	ServiceVis.FlipDisp2.TextIndex20	:=	BOOL_TO_USINT(NOT(S139Reed.In))	;
	CASE ArmsTemp2.CheckRaised OF
		0:	(* No arms up *)
		1:	(* 1 arm up *)
			ServiceVis.FlipDisp2.Runtime5	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime6	:= SHOW	;
		2:	(* 2 arms up *)
			ServiceVis.FlipDisp2.Runtime5	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime6	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime7	:= SHOW	;
		3:  (* 3 arms up *)		
			ServiceVis.FlipDisp2.Runtime5	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime6	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime7	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime8	:= SHOW	;
		4:	(* 4 arms up *)
			ServiceVis.FlipDisp2.Runtime5	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime6	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime7	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime8	:= SHOW	;
			ServiceVis.FlipDisp2.Runtime9	:= SHOW	;
	END_CASE
	
END_PROGRAM

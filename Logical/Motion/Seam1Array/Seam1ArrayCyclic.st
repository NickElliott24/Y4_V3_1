(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Seam1Array
 * File: Seam1ArrayCyclic.st
 * Author: Nicke
 * Created: February, 2012
 ********************************************************************
 * Implementation of program Seam1Array
 ********************************************************************)

PROGRAM _INIT

(* Reset search to READY *)
Ax1.Pattern	:= 	READY	;

END_PROGRAM

PROGRAM _CYCLIC
(* cyclic program *)

(* Limit Speed and position of axis*)
	axis1basic.ParaPosition	:= 	LIMIT(Ax1P.AbsMin, axis1basic.ParaPosition, Ax1P.AbsMax)	;
	axis1basic.ParaVelocity	:= 	LIMIT(0, axis1basic.ParaVelocity, 10000)	;

	Ax1.Sensors	:= 	0	; (* Arrange sensor array into a value for determining search pattern *)

IF NOT(Ax1.Active) AND (Control.Achieved1) THEN
	Ax1.Pattern				:= 	READY	;
	Ax1.Count				:= 	0		;
	Ax1.Seek1				:= 	FALSE	;
	Ax1.Seek2				:= 	FALSE	;
	Ax1.SeekFin				:= 	FALSE	;
	Ax1.Text				:=	0		;
	Ax1.StartCheck			:=	FALSE	;
	axis1basic.MoveAbsolute	:= 	FALSE	;
END_IF

IF ((EDGEPOS(Ax1.Seek1) OR EDGEPOS(Ax1.Seek2)) AND (Ax1.Pattern = READY) AND NOT(Ax1.Block)) THEN
	Ax1.Seek2	:= 	FALSE	;
	IF (S81Photo.In) THEN
		Ax1.Sensors	:= 	Ax1.Sensors + 1	;
	END_IF
	IF (S82Photo.In) THEN
 		Ax1.Sensors	:= 	Ax1.Sensors + 2	;
	END_IF
	IF (S83Photo.In) THEN
 		Ax1.Sensors	:= 	Ax1.Sensors + 4	;
	END_IF
	IF (S84Photo.In) THEN
 		Ax1.Sensors	:= 	Ax1.Sensors + 8	;
	END_IF

	IF(axis1basic.ActPosition <= Ax1P.FRAbsMin) AND(Ax1.Sensors = 0) THEN
		Ax1.Sensors	:= 	1	;
	END_IF
	
	CASE Ax1.Sensors OF (* Determine type of search pattern from sensors *)
	0,8: 
		Ax1.Pattern				:= 	FAST_REV		;
		Ax1.Text				:= 	1				;		
		axis1basic.ParaPosition	:= 	Ax1P.FRAbsMin	;
		axis1basic.ParaVelocity	:= 	Ax1P.FastSpeed	;
		axis1basic.MoveAbsolute	:= 	TRUE			;
	1,9: 
		Ax1.Pattern				:= 	SLOW_REV								;
		Ax1.Text				:= 	2										;
		axis1basic.ParaPosition	:= 	axis1basic.ActPosition - Ax1P.SlowDist	;
		axis1basic.ParaVelocity	:= 	Ax1P.SlowSpeed							;
		IF (axis1basic.ParaPosition < Ax1P.AbsMin) THEN (* If calculated position is outside operating area, substitute minimum position for calculated value *)
			axis1basic.ParaPosition	:= 	Ax1P.AbsMin	;
		END_IF
		axis1basic.MoveAbsolute	:= 	TRUE		;
	2,3,10,11: 
		Ax1.Pattern				:= 	CHECK									;
		Ax1.Text				:= 	3										;
		Ax1.StartCheck			:=	TRUE	;
		axis1basic.ParaPosition	:= 	axis1basic.ActPosition + Ax1P.FCDist	; (* Forward direction for search *) 
		axis1basic.ParaVelocity	:= 	Ax1P.FCSpeed							;
		IF (axis1basic.ParaPosition > (Ax1P.AbsMax + 200)) THEN (* If calculated position is outside operating area, substitute maximum position for calculated value *)
				axis1basic.ParaPosition	:= 	(Ax1P.AbsMax + 200)	;
		END_IF
		axis1basic.MoveAbsolute	:= 	TRUE		;
	4..7:	
		Ax1.Pattern				:= 	SLOW_FWD								;
		Ax1.Text				:= 	4										;
		axis1basic.ParaPosition	:= 	axis1basic.ActPosition + Ax1P.SlowDist	;
		axis1basic.ParaVelocity	:= 	Ax1P.SlowSpeed							;
		IF axis1basic.ParaPosition > Ax1P.AbsMax THEN (* If calculated position is outside operating area, substitute maximum position for calculated value *)
			axis1basic.ParaPosition	:= 	Ax1P.AbsMax	;
		END_IF
		axis1basic.MoveAbsolute	:= 	TRUE		;
	12..15:	
		Ax1.Pattern				:= 	FAST_FWD		;
		Ax1.Text				:= 	5				;
		axis1basic.ParaPosition	:= 	Ax1P.FFAbsMax	;
		axis1basic.ParaVelocity	:= 	Ax1P.FastSpeed	;
		axis1basic.MoveAbsolute	:= 	TRUE			;
	
	END_CASE

END_IF

(* Cancel movement at EMO *)
IF EDGEPOS(Control.EStop1) AND NOT(axis1basic.StatusDisabled) THEN
	Ax1.Pattern		:= 	0		;
	Ax1.Count		:= 	0		;
//	axis1basic.Stop	:= 	TRUE	;
	axis1basic.MoveAbsolute	:=	FALSE	;
END_IF

CASE Ax1.Pattern OF
FAST_REV: (**** FAST_ REV Search Pattern ****)
	IF EDGEPOS(S81Photo.In) THEN (* Check for Rev sensor rising edge *)
		axis1basic.ParaPosition	:= 	axis1basic.ActPosition - Ax1P.RevFeed	;
		IF(axis1basic.ParaPosition < Ax1P.AbsMin) THEN
			axis1basic.ParaPosition	:=	Ax1P.AbsMin	;
		END_IF
		axis1basic.MoveAbsolute	:= 	TRUE									;
	END_IF
	
SLOW_REV: (**** SLOW_REV Search Pattern ****)
	IF EDGEPOS(S82Photo.In) THEN (* Check for Edge sensor rising edge *)	
		axis1basic.ParaPosition	:= 	axis1basic.ActPosition + Ax1P.SlowAdj1	;
		IF(axis1basic.ParaPosition < Ax1P.AbsMin) THEN
			axis1basic.ParaPosition	:=	Ax1P.AbsMin	;
		END_IF
		axis1basic.MoveAbsolute	:= 	TRUE									;
		axis1basic.ParaVelocity	:= 	Ax1P.FCSpeed							;
	END_IF

CHECK: (**** CHECK Search Pattern ****)	
	IF EDGENEG(S82Photo.In) THEN (* Check for Edge sensor rising edge *)	
		Ax1.CheckPosition		:= 	axis1basic.ActPosition					;
		Ax1.StartCheck			:=	FALSE	;
		axis1basic.ParaPosition	:= 	axis1basic.ActPosition - Ax1P.SlowAdj3	;
		IF(axis1basic.ParaPosition > Ax1P.AbsMax) THEN
			axis1basic.ParaPosition	:=	Ax1P.AbsMax	;
		END_IF
		axis1basic.MoveAbsolute	:= 	TRUE									;
	END_IF
	IF EDGENEG(axis1basic.StatusMotionDiscrete) AND NOT(Ax1.StartCheck) THEN
		Ax1.Count	:= 	Ax1.Count + 1	;
	END_IF

SLOW_FWD: (**** SLOW_FWD Search Pattern ****)
	IF EDGENEG(S83Photo.In) THEN (* Check for Edge sensor rising edge *)	
		axis1basic.ParaPosition	:= 	axis1basic.ActPosition - Ax1P.SlowAdj2	;
		IF(axis1basic.ParaPosition > Ax1P.AbsMax) THEN
			axis1basic.ParaPosition	:=	Ax1P.AbsMax	;
		END_IF
		axis1basic.ParaVelocity	:= 	Ax1P.FCSpeed							;	
		axis1basic.MoveAbsolute	:= 	TRUE									;
	END_IF
	
FAST_FWD: (**** FAST_FWD Search Pattern ****)
	IF EDGENEG(S84Photo.In) THEN (* Check for Fwd sensor falling edge *)
		axis1basic.ParaPosition	:= 	axis1basic.ActPosition + Ax1P.FwdFeed	;
		IF(axis1basic.ParaPosition > Ax1P.AbsMax) THEN
			axis1basic.ParaPosition	:=	Ax1P.AbsMax	;
		END_IF
		axis1basic.MoveAbsolute	:= 	TRUE									;
	END_IF

END_CASE

IF EDGENEG(axis1basic.StatusMotionDiscrete) AND (Ax1.Pattern > READY) THEN (* Reset Search Pattern *)	
	Ax1.Pattern		:= 	READY	;
	Ax1.Text		:= 	0		;
	Ax1.Seek2		:= 	TRUE	;
	Ax1.StartCheck	:=	FALSE	;
	CASE Ax1.Count OF
		2: 	Ax1.Count	:= 	0						;
			Ax1.SeekFin	:= 	TRUE					;
			Ax1.Seek2	:= 	FALSE					;
			Ax1.Measure	:= 	axis1basic.ActPosition	;
	END_CASE
END_IF

(*Enable screen reset button during drive error*)
IF (Ax1.Error) THEN
	Ax1.ResetEnable	:= 	SHOW	;
ELSE
	Ax1.ResetEnable	:= 	HIDE	;
END_IF

(* If actual position is outside operating area then stop output *)
IF ((axis1basic.ActPosition > (Ax1P.AbsMax + 100)) OR (axis1basic.ActPosition < (Ax1P.AbsMin - 200))) AND (Ax1.OriginSet) AND NOT(axis1basic.StatusDisabled) THEN
	axis1basic.Stop	:= 	TRUE	;
END_IF

(* Copy actual positon for flip up arm calculations *)
ArmsTemp1.ActPos	:=	axis1basic.ActPosition	;

END_PROGRAM

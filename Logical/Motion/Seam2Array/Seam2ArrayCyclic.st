(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Seam2Array
 * File: Seam2ArrayCyclic.st
 * Author: NickE
 * Created: February, 2012
 ********************************************************************
 * Implementation of program Seam2Array
 ********************************************************************)

PROGRAM _INIT

(* Reset search to READY *)
Ax2.Pattern	:= 	READY	;

END_PROGRAM

PROGRAM _CYCLIC		
(* cyclic program *)
	
(* Limit Speed and position of axis*)
	axis2basic.ParaPosition	:= 	LIMIT(Ax2P.AbsMin, axis2basic.ParaPosition, Ax2P.AbsMax)	;
	axis2basic.ParaVelocity	:= 	LIMIT(0, axis2basic.ParaVelocity, 10000)	;
		
	Ax2.Sensors	:= 	0	; (* Arrange sensor array into a value for determining search pattern *)		

	IF NOT(Ax2.Active) AND (Control.Achieved1) THEN
	Ax2.Pattern				:= 	READY	;
	Ax2.Count				:= 	0		;
	Ax2.Seek1				:= 	FALSE	;
	Ax2.Seek2				:= 	FALSE	;
	Ax2.SeekFin				:= 	FALSE	;
	Ax2.Text				:=	0		;
	Ax2.StartCheck			:=	FALSE	;
	axis2basic.MoveAbsolute	:= 	FALSE	;
END_IF

IF ((EDGEPOS(Ax2.Seek1) OR EDGEPOS(Ax2.Seek2)) AND (Ax2.Pattern = READY) AND NOT(Ax2.Block)) THEN		
	Ax2.Seek2	:= 	FALSE	;	
	IF (S91Photo.In) THEN	
		Ax2.Sensors	:= 	Ax2.Sensors + 1	;
	END_IF	
	IF (S92Photo.In) THEN	
 		Ax2.Sensors	:= 	Ax2.Sensors + 2	;
	END_IF	
	IF (S93Photo.In) THEN	
 		Ax2.Sensors	:= 	Ax2.Sensors + 4	;
	END_IF	
	IF (S94Photo.In) THEN	
 		Ax2.Sensors	:= 	Ax2.Sensors + 8	;
	END_IF	

	IF(axis2basic.ActPosition <= Ax2P.FRAbsMin) AND(Ax2.Sensors = 0) THEN
		Ax2.Sensors	:= 	1	;
	END_IF
		
	CASE Ax2.Sensors OF (* Determine type of search pattern from sensors *)	
	0,8: 	
		Ax2.Pattern				:= 	FAST_REV		;
		Ax2.Text				:= 	1				;
		axis2basic.ParaPosition	:= 	Ax2P.FRAbsMin	;
		axis2basic.ParaVelocity	:= 	Ax2P.FastSpeed	;
		axis2basic.MoveAbsolute	:= 	TRUE			;
	1,9: 	
		Ax2.Pattern				:= 	SLOW_REV								;
		Ax2.Text				:= 	2										;
		axis2basic.ParaPosition	:= 	axis2basic.ActPosition - Ax2P.SlowDist	;
		axis2basic.ParaVelocity	:= 	Ax2P.SlowSpeed							;
		IF (axis2basic.ParaPosition < Ax2P.AbsMin) THEN (* If calculated position is outside operating area, substitute minimum position for calculated value *)
			axis2basic.ParaPosition	:= 	Ax2P.AbsMin	;
		END_IF	
		axis2basic.MoveAbsolute	:= 	TRUE	;	
	2,3,10,11: 		
		Ax2.Pattern				:= 	CHECK									;	
		Ax2.Text				:= 	3										;	
		Ax2.StartCheck			:=	TRUE									;
		axis2basic.ParaPosition	:= 	axis2basic.ActPosition + Ax2P.FCDist	; (* Forward direction for search *) 
		axis2basic.ParaVelocity	:= 	Ax2P.FCSpeed							;	
		IF (axis2basic.ParaPosition > (Ax2P.AbsMax + 200)) THEN (* If calculated position is outside operating area, substitute maximum position for calculated value *)
				axis2basic.ParaPosition	:= 	(Ax2P.AbsMax + 200)	;
		END_IF
		axis2basic.MoveAbsolute	:= 	TRUE	;	
	4..7:		
		Ax2.Pattern				:= 	SLOW_FWD								;	
		Ax2.Text				:= 	4										;	
		axis2basic.ParaPosition	:= 	axis2basic.ActPosition + Ax2P.SlowDist	;	
		axis2basic.ParaVelocity	:= 	Ax2P.SlowSpeed							;	
		IF axis2basic.ParaPosition > Ax2P.AbsMax THEN (* If calculated position is outside operating area, substitute maximum position for calculated value *)	
			axis2basic.ParaPosition	:= 	Ax2P.AbsMax	;
		END_IF
		axis2basic.MoveAbsolute	:= 	TRUE	;
	12..15:	
		Ax2.Pattern				:= 	FAST_FWD		;
		Ax2.Text				:= 	5				;
		axis2basic.ParaPosition	:= 	Ax2P.FFAbsMax	;
		axis2basic.ParaVelocity	:= 	Ax2P.FastSpeed	;
		axis2basic.MoveAbsolute	:= 	TRUE			;
	END_CASE	
		
END_IF

(* Cancel movement and capture position at EMO *)
IF EDGEPOS(Control.EStop1) AND NOT(axis2basic.StatusDisabled) THEN
	Ax2.Pattern		:= 	0		;
	Ax2.Count		:= 	0		;
//	axis2basic.Stop	:= 	TRUE	;
	axis2basic.MoveAbsolute	:=	FALSE	;
END_IF

CASE Ax2.Pattern OF		
FAST_REV: (**** FAST_ REV Search Pattern ****)		
	IF EDGEPOS(S91Photo.In) THEN (* Check for Rev sensor rising edge *)	
		axis2basic.ParaPosition	:= 	axis2basic.ActPosition - Ax2P.RevFeed	;
		IF(axis2basic.ParaPosition < Ax2P.AbsMin) THEN
			axis2basic.ParaPosition	:=	Ax2P.AbsMin	;
		END_IF
		axis2basic.MoveAbsolute	:= 	TRUE									;
	END_IF	
		
SLOW_REV: (**** SLOW_REV Search Pattern ****)		
	IF EDGEPOS(S92Photo.In) THEN (* Check for Edge sensor rising edge *)	
		axis2basic.ParaPosition	:= 	axis2basic.ActPosition + Ax2P.SlowAdj1	;
		IF(axis2basic.ParaPosition < Ax2P.AbsMin) THEN
			axis2basic.ParaPosition	:=	Ax2P.AbsMin	;
		END_IF
		axis2basic.MoveAbsolute	:= 	TRUE									;
		axis2basic.ParaVelocity	:= 	Ax2P.FCSpeed							;	
	END_IF	
		
CHECK: (**** CHECK Search Pattern ****)		
	IF EDGENEG(S92Photo.In) THEN (* Check for Edge sensor rising edge *)	
		Ax2.CheckPosition		:= 	axis2basic.ActPosition					;
		axis2basic.ParaPosition	:= 	axis2basic.ActPosition - Ax2P.SlowAdj3	;
		Ax2.StartCheck			:=	FALSE	;
		IF(axis2basic.ParaPosition > Ax2P.AbsMax) THEN
			axis2basic.ParaPosition	:=	Ax2P.AbsMax	;
		END_IF
		axis2basic.MoveAbsolute	:= 	TRUE									;
	END_IF	
	IF EDGENEG(axis2basic.StatusMotionDiscrete) AND NOT(Ax2.StartCheck) THEN	
		Ax2.Count	:= 	Ax2.Count + 1	;
	END_IF	
		
SLOW_FWD: (**** SLOW_FWD Search Pattern ****)		
	IF EDGENEG(S93Photo.In) THEN (* Check for Edge sensor rising edge *)	
		axis2basic.ParaPosition	:= 	axis2basic.ActPosition - Ax2P.SlowAdj2	;
		IF(axis2basic.ParaPosition > Ax2P.AbsMax) THEN
			axis2basic.ParaPosition	:=	Ax2P.AbsMax	;
		END_IF
		axis2basic.ParaVelocity	:= 	Ax2P.FCSpeed							;	
		axis2basic.MoveAbsolute	:= 	TRUE									;
	END_IF	
		
FAST_FWD: (**** FAST_FWD Search Pattern ****)		
	IF EDGENEG(S94Photo.In) THEN (* Check for Fwd sensor falling edge *)	
		axis2basic.ParaPosition	:= 	axis2basic.ActPosition + Ax2P.FwdFeed	;
		IF(axis2basic.ParaPosition > Ax2P.AbsMax) THEN
			axis2basic.ParaPosition	:=	Ax2P.AbsMax	;
		END_IF
		axis2basic.MoveAbsolute	:= 	TRUE									;
	END_IF		
			
END_CASE			
			
IF EDGENEG(axis2basic.StatusMotionDiscrete) AND (Ax2.Pattern > READY) THEN (* Reset Search Pattern *)			
	Ax2.Pattern	:= 	READY	;		
	Ax2.Text	:= 	0		;		
	Ax2.Seek2	:= 	TRUE	;	
	Ax1.StartCheck	:=	FALSE	;	
	CASE Ax2.Count OF		
		2:	Ax2.Count	:= 	0						;
			Ax2.SeekFin	:= 	TRUE					;
			Ax2.Seek2	:= 	FALSE					;
			Ax2.Measure	:= 	axis2basic.ActPosition	;
	END_CASE		
END_IF

(*Enable screen reset button during drive error*)
IF (Ax2.Error) THEN
	Ax2.ResetEnable	:= 	SHOW	;
ELSE
	Ax2.ResetEnable	:= 	HIDE	;
END_IF

	IF (Ax3.Error) THEN
		Ax3.ResetEnable	:= 	SHOW	;
	ELSE
		Ax3.ResetEnable	:= 	HIDE	;
	END_IF

(* If actual position is outside operating area then stop output *)
IF ((axis2basic.ActPosition > (Ax2P.AbsMax + 100)) OR (axis2basic.ActPosition < (Ax2P.AbsMin - 200))) AND (Ax2.OriginSet) AND NOT(axis2basic.StatusDisabled) THEN
	axis2basic.Stop	:= 	TRUE	;
END_IF

(* Copy actual positon for flip up arm calculations *)
ArmsTemp2.ActPos	:=	axis2basic.ActPosition	;

END_PROGRAM


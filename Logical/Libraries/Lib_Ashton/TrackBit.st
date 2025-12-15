(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: TrackBit.st
 * Author: nicke
 ********************************************************************)

//TRACKING BIT CONTROLS
FUNCTION_BLOCK TrackBit

	//VISUALISATION DISPLAY CONTROLS 0=SHOW, 1 =HIDE
	Disp	:=	FB_SHOW	;
	IF(FixedIN.ESClearing) THEN
		ESDisp	:=	FB_SHOW	;
	ELSE
		ESDisp	:=	FB_HIDE	;
	END_IF

	//OUTPUT CONDITIONS
	Active	:=	TRUE	;
	IF NOT((RunBlock) OR(TimeoutOUT))  THEN
		RunOUT	:=	TRUE	;
		CASE Analog OF
			0:
				SpeedOUT	:=	Speed	;
				IF(SpeedMatchEN) THEN
					SpeedOUT	:=	SpeedMatch	;
				END_IF
			ELSE
				SpeedOUT	:=	SpeedAnalog	;
		END_CASE
	ELSE
		RunOUT	:=	FALSE	;
		SpeedOUT	:=	0.0	;
	END_IF
	IF NOT(SolBlock) THEN
		SolOUT	:=	TRUE	;
	ELSE
		SolOUT	:=	FALSE	;
	END_IF

	//DELAYS
	DelayTON.PT	:= 	DelayPT	;
	DelayTON ();
	//TRACK DELAY
	IF(FixedIN.Control) AND NOT(FixedIN.ESClear) THEN
		IF(TrackDelayEN) THEN
			IF NOT(RunBlock) THEN
				DelayTON.IN	:= 	TRUE	;
			ELSE
				DelayTON.IN	:=	FALSE	;
			END_IF
			IF(DelayTON.Q) THEN
				Done	:=	TRUE	;
			END_IF
		END_IF
	END_IF
		
	//TIMEOUT CONDITIONS
	IF(FixedIN.Control) THEN
		IF(TimeoutEN) AND NOT(FixedIN.ESClear) THEN
			IF NOT((TimeoutBlock) OR(RunBlock) OR(SolBlock)) THEN
				DelayTON.IN	:= 	TRUE	;

				TimeoutOUT	:= 	DelayTON.Q	;
				IF(TimeoutACK) OR(TimeoutACKLatch) THEN
					TimeoutOUT	:=	FALSE	;
					TimeoutACKLatch	:=	TRUE	;
				END_IF
			ELSE
				TimeoutOUT	:=	FALSE	;
			END_IF
		ELSE
			TimeoutOUT	:=	FALSE	;
		END_IF
	END_IF
	
	IF(TimeoutOUT) THEN
		RunOUT := FALSE	;
	END_IF

	//DONE CONDITIONS
	IF(DoneIN) AND((FixedIN.Control) OR(FixedIN.EMOStart)) AND NOT(FixedIN.ESClear)  THEN
		Done := TRUE ;
	END_IF

	IF NOT(FixedIN.Control) THEN
		RunOUT := FALSE ;
		TimeoutOUT	:=	FALSE	;
	END_IF	
	
END_FUNCTION_BLOCK

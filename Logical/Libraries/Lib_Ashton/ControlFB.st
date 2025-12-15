
(* TODO: Add your comment here *)
FUNCTION_BLOCK ControlFB

	//CONTROL CIRCUIT START
	IF(Start)THEN
		BuzzerTON.IN := TRUE;
	END_IF

	//EITHER STOP BUTTON OR STANDBY DELAY DONE SET LATCH
	IF(Stop) OR(StandbyTON.Q)THEN
		StopLatch := TRUE ;
	END_IF

	//WHEN LATCH SET, WAIT FOR LINE EMPTY TO RESET CONTROL READY 
	IF(StopLatch) AND(Empty)THEN
		StopDone := TRUE ;
	ELSE
		StopDone := FALSE ;
	END_IF

	//RESET CONDITIONS - ESTOP BUTTONS, TEST MODE, STOP BUTTON OR STANDBY
	IF((EStop1) AND(EStop2)) OR(Test) OR(StopDone)THEN
		BuzzerTON.IN := FALSE ;
		IF NOT(EStopStartTON.IN) THEN
			Achieved1 := FALSE ;
			Achieved2 := FALSE ;
		END_IF
		StopLatch := FALSE ;
		Buzzer := FALSE ;
	ELSE
		IF(EStop1) THEN
			BuzzerTON.IN := FALSE ;
			IF NOT(EStopStartTON.IN) THEN
				Achieved1 := FALSE ;
				Achieved2 := FALSE ;
			END_IF
		END_IF
	END_IF

	//BUZZER WARNING ON CONTROL START AND ALARM
	BuzzerTON.PT := BuzzerPT ;
	BuzzerTON();

	//BUZZER CONTROL AT CONTROL START
	IF EDGEPOS(BuzzerTON.IN)THEN
		Buzzer := TRUE ;
	END_IF

	IF EDGEPOS(BuzzerTON.Q)THEN
		Buzzer := FALSE	;
	END_IF

	//BUZZER CONTROL ON ALARM
	IF EDGEPOS(Alarm)THEN
		Buzzer := TRUE ;
	ELSIF EDGENEG(Alarm)THEN
		Buzzer := FALSE	;
	END_IF

	//BUZZER DISABLE OVERRIDE
	IF (BuzzBlock)THEN
		Buzzer := FALSE	;
	END_IF

	//CONTROL CIRCUITS
	IF(BuzzerTON.Q) THEN
		IF NOT(EStop1)THEN
			Achieved1 := TRUE ;
		END_IF
		IF NOT(EStop2)THEN
			Achieved2 := TRUE ;
		END_IF
	END_IF

	//CONTROL ON LAMPS
	OnLmp1 := Achieved1 ;
	OnLmp2 := Achieved2	;

	//STANDBY DELAY FOR ENERGY SAVING
	IF(Empty) AND(Achieved1) AND(Achieved2) AND NOT(ESClear) AND NOT(StandbyBlock) THEN
		StandbyTON.IN := TRUE ;
	ELSE
		StandbyTON.IN := FALSE	;
	END_IF

	StandbyTON.PT := StandbyPT	;
	StandbyTON ();

	IF EDGEPOS(Stop) OR(StandbyTON.Q)THEN
		StopLatch	:= 	TRUE	;
	END_IF

	//USE CALCULATED NUMBER OF BITS TO DETERMINE WHEN STOP LATCH FINISHES
		FOR i := 0 TO 19 DO
		IF CountIN[i] = TRUE THEN
			Empty := FALSE ;
			EXIT ;
		ELSE
			Empty := TRUE ;
		END_IF
	END_FOR
	
	//LIGHTSTACK CONTROL	
	//GENERATE 1 SEC PULSE FLAG, 0.5 SEC ON, 0.5 SEC OFF.
	TSecON.IN := NOT(TSecOFF.Q)	;
	TSecON.PT := t#500ms ;
	TSecON ();

	TSecOn := TSecON.Q ;
	TSecOFF.IN := TSecOn ;
	TSecOFF.PT := t#500ms ;
	TSecOFF ();

	TSecOff := NOT(TSecOn) ;

	//RED LAMP CONTROL CONDITIONS
	Red[0] := NOT(Achieved1)	;
	Red[1] := (Achieved1) AND(Alarm) AND(TSecOn) ;
	Red[2] := (Achieved1) AND(Warning) AND(TSecOn)	;
	FOR i:= 0 TO 2 DO
		IF (Red[i] = TRUE) THEN
			RedLmp := TRUE ;
			EXIT;
		ELSE
			RedLmp := FALSE ;
		END_IF
	END_FOR

	//YELLOW LAMP CONTROL CONDITIONS
	Yel[0] := (Achieved1) AND(StopLatch) AND(TSecOn) ;
	Yel[1] := (Achieved1) AND(ESClear) ;
	Yel[2] := (Achieved1) AND(Warning) AND(TSecOff) ;
	FOR i:= 0 TO 2 DO
		IF (Yel[i] = TRUE) THEN
			YelLmp := TRUE	;
			EXIT;
		ELSE
			YelLmp := FALSE	;
		END_IF
	END_FOR

	//GREEN LAMP CONTROL CONDITIONS
	Grn[0] := (Achieved1) AND NOT(ESClear) AND NOT(Paused) ;
	Grn[1] := (Achieved1) AND(TSecOff) AND(Paused) ;
	FOR i:= 0 TO 2 DO
		IF (Grn[i] = TRUE) THEN
			GrnLmp := TRUE ;
			EXIT;
		ELSE
			GrnLmp := FALSE	;
		END_IF
	END_FOR

	//ENABLE CONDITIONS FOR TRACKING
	//AT ESTOP LATCH BIT TO ALLOW FOR MOVEMENT OF GLASS ON CONVEYORS AND PALLETS
	IF(EDGEPOS(EStop1))THEN
		EStopStartTON.IN := TRUE ;
	END_IF

	EStopStartTON.PT := T#2s ;
	EStopStartTON ();
	
	IF EDGEPOS(EStopStartTON.Q)THEN
		EStopStartTON.IN := FALSE ;
	END_IF
	
	Auto;
	
END_FUNCTION_BLOCK

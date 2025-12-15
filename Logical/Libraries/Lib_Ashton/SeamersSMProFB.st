
(* Seamers start up control SMPro *)
FUNCTION_BLOCK SeamersSMProFB

	//ENABLE AUTO START SEQUENCE BUTTON ON SCREEN
	IF(Enable[1]) AND(Enable[2]) AND NOT(AutoStart[1]) AND NOT(AutoStart[2]) THEN
		StartAllDisp := FB_SHOW ;
	ELSE
		StartAllDisp := FB_HIDE ;
	END_IF

	//START AUTO SEQUENCE DURING NORMAL START UP
	IF EDGEPOS(AutoStart[0]) AND NOT(ESClear) THEN
		Latch := TRUE ;
	END_IF

	//START AUTO SEQUENCE AFTER EMO RECOVERY
	IF EDGEPOS(AutoStart[0]) AND(ESClear) AND(ControlIN) THEN
		LatchES := TRUE ;
	END_IF

	//RESET AUTO SEQUENCE BY TURNING OFF ENABLE FOR ALL SEAMERS
	IF NOT(Enable[1]) OR NOT(Enable[2]) THEN
		Latch := FALSE ;
		LatchES := FALSE ;
	END_IF

	//RESET AUTO START
	IF NOT(Enable[1]) THEN
		AutoStart[1] := FALSE ;
	END_IF
	IF NOT(Enable[2]) THEN
		AutoStart[2] := FALSE ;
	END_IF

	//RESET AUTO SEQUENCE AT END OF NORMAL STARTUP
	IF (Vac4TON.Q) AND (Latch) THEN
		Latch := FALSE ;
	END_IF
	//RESET AUTO SEQUENCE AT END OF EMO RESTART
	IF (Vac1TON.Q) AND (LatchES) THEN
		LatchES := FALSE ;
	END_IF
	
	//-------------------------------------------------------------------------
	//ON CONDITIONS FOR SEAMER 1 AUTO START SEQUENCE
	IF(Enable[1])THEN
		IF (EDGEPOS(Latch)) OR(EDGENEG(Starting2) AND(LatchES)) THEN
			AutoStart[1] := TRUE ;
		END_IF
	END_IF

	IF EDGEPOS(AutoStart[1]) AND NOT(Starting2) THEN
		Starting1 := TRUE ;
	END_IF
	
	//SEAMER 1 MOTORS AND PUMP START CONTROL
	IF (AutoStart[1]) AND(Enable[1]) AND(ControlIN) THEN
		Belt1TON.IN := TRUE ;
		IF (Extract2TON.Q) THEN
			Starting1 := FALSE ;
		END_IF
	ELSE
		Belt1TON.IN := FALSE ;
		Belt2TON.IN := FALSE ;
		Belt3TON.IN := FALSE ;
		Belt4TON.IN := FALSE ;
		Belt9TON.IN := FALSE ;
		Belt10TON.IN := FALSE ;
		IF NOT(TransportMode) THEN
			Vac1TON.IN := FALSE ;
			Vac2TON.IN := FALSE ;
		END_IF
		ED1TON.IN := FALSE ;
		ED2TON.IN := FALSE ;
		Extract1TON.IN := FALSE ;
		Extract2TON.IN := FALSE ;
		Starting1 := FALSE ;
	END_IF
	
	//AUTO START SEQUENCE
	Belt1TON.PT := BeltsPT ;
	Belt1TON ();

	Belt2TON.IN := Belt1TON.Q ;
	Belt2TON.PT := BeltsPT ;
	Belt2TON ();

	Belt3TON.IN := Belt2TON.Q ;
	Belt3TON.PT := BeltsPT ;
	Belt3TON ();

	Belt4TON.IN := Belt3TON.Q ;
	Belt4TON.PT := BeltsPT ;
	Belt4TON ();

	Belt9TON.IN := Belt4TON.Q ;
	Belt9TON.PT := BeltsPT ;
	Belt9TON ();
	
	Belt10TON.IN := Belt9TON.Q ;
	Belt10TON.PT := BeltsPT ;
	Belt10TON ();
	
	CASE BOOL_TO_INT(TransportMode) OF
		0:
			Vac1TON.IN := Belt9TON.Q ;
		1:
			Vac1TON.IN := TRUE ;
	END_CASE
	Vac1TON.PT := VacPT	;
	Vac1TON ();

	Vac2TON.IN := Vac1TON.Q ;
	Vac2TON.PT := VacPT	;
	Vac2TON ();
		
	ED1TON.IN := Vac2TON.Q	;
	ED1TON.PT := EDPT	;
	ED1TON ();
	
	ED2TON.IN := ED1TON.Q	;
	ED2TON.PT := EDPT	;
	ED2TON ();
	
	Extract1TON.IN := ED2TON.Q	;
	Extract1TON.PT := ExtractionPT	;
	Extract1TON ();

	Extract2TON.IN := Extract1TON.Q	;
	Extract2TON.PT := ExtractionPT	;
	Extract2TON ();
	
	//OUTPUTS
	IF (Enable[1]) THEN
		BeltOUT[1] := Belt1TON.IN ;
		BeltOUT[2] := Belt2TON.IN ;
		BeltOUT[3] := Belt3TON.IN ;
		BeltOUT[4] := Belt4TON.IN ;
		BeltOUT[9] := Belt9TON.IN ;
		BeltOUT[10] := Belt10TON.IN ;
		VacOUT[1] := Vac1TON.IN OR VacStopTON.IN ;
		VacOUT[2] := Vac2TON.IN OR VacStopTON.IN ;
		EDOUT[1] := ED1TON.IN AND EDOn ;
		EDOUT[2] := ED2TON.IN AND EDOn ;
		ExtractionOUT[1] := Extract1TON.IN ;
		ExtractionOUT[2] := Extract2TON.IN ;
	ELSE
		BeltOUT[1] := FALSE ;
		BeltOUT[2] := FALSE ;
		BeltOUT[3] := FALSE ;
		BeltOUT[4] := FALSE ;
		BeltOUT[9] := FALSE ;
		BeltOUT[10] := FALSE ;
		VacOUT[1] := FALSE ;
		VacOUT[2] := FALSE ;
		EDOUT[1] := FALSE ;
		EDOUT[2] := FALSE ;
		ExtractionOUT[1] := FALSE ;
		ExtractionOUT[2] := FALSE ;
	END_IF

	//AutoStart[1] RESET CONDITIONS
	IF EDGEPOS(AutoStart[1]) AND(Starting2) THEN
		AutoStart[1] := FALSE ;
	END_IF
	IF EDGENEG(AutoStart[1]) OR EDGENEG(Enable[1]) OR NOT(Enable[1]) AND(AutoStart[1]) THEN
		AutoStart[1] := FALSE ;
	END_IF
	IF NOT(ControlIN) OR(Detension) AND(AutoStart[1]) THEN
		AutoStart[1]	:= 	FALSE	;
	END_IF
	IF(AutoStart[1]) THEN
		FOR i:= 1 TO 12 DO
			IF Trips[i] = TRUE THEN
				AutoStart[1]	:= 	FALSE	;
				EXIT				;
			END_IF
		END_FOR
	END_IF

	//DoneOUT[1] CONDITIONS
	IF EDGENEG(Starting1) AND (AutoStart[1]) AND(Enable[1]) THEN
		DoneOUT[1] := TRUE ;
	END_IF
	IF NOT(Starting1) AND NOT(AutoStart[1]) AND(Enable[1]) THEN
		DoneOUT[1] := FALSE ;
	END_IF
	IF NOT(Enable[1]) THEN
		DoneOUT[1] := TRUE ;
	END_IF
	
	//-------------------------------------------------------------------------
	//ON CONDITIONS FOR SEAMER 2 AUTO START SEQUENCE
	IF(Enable[2])THEN
		IF(EDGENEG(Starting1) AND(Latch)) OR(EDGEPOS(LatchES) AND(Enable[2])) THEN
			AutoStart[2] := TRUE ;
		END_IF
	END_IF

	IF EDGEPOS(AutoStart[2]) AND NOT(Starting1) THEN
		Starting2 := TRUE ;
	END_IF
	
	//SEAMER 2 MOTORS AND PUMP START CONTROL
	IF (AutoStart[2]) AND(Enable[2]) AND(ControlIN) THEN
		Belt5TON.IN := TRUE ;
		IF (Extract4TON.Q) THEN
			Starting2 := FALSE ;
		END_IF
	ELSE
		Belt5TON.IN := FALSE ;
		Belt6TON.IN := FALSE ;
		Belt7TON.IN := FALSE ;
		Belt8TON.IN := FALSE ;
		Belt11TON.IN := FALSE ;
		Belt12TON.IN := FALSE ;
		IF NOT(TransportMode) THEN
			Vac3TON.IN := FALSE ;
			Vac4TON.IN := FALSE ;
		END_IF
		ED3TON.IN := FALSE ;
		ED4TON.IN := FALSE ;
		Extract3TON.IN := FALSE ;
		Extract4TON.IN := FALSE ;
		Starting2 := FALSE ;
	END_IF
	
	//AUTO START SEQUENCE
	Belt5TON.PT := BeltsPT ;
	Belt5TON ();

	Belt6TON.IN := Belt5TON.Q ;
	Belt6TON.PT := BeltsPT ;
	Belt6TON ();

	Belt7TON.IN := Belt6TON.Q ;
	Belt7TON.PT := BeltsPT ;
	Belt7TON ();

	Belt8TON.IN := Belt7TON.Q ;
	Belt8TON.PT := BeltsPT ;
	Belt8TON ();

	Belt11TON.IN := Belt8TON.Q ;
	Belt11TON.PT := BeltsPT ;
	Belt11TON ();
	
	Belt12TON.IN := Belt11TON.Q ;
	Belt12TON.PT := BeltsPT ;
	Belt12TON ();
	
	CASE BOOL_TO_INT(TransportMode) OF
		0:
			Vac3TON.IN := Belt12TON.Q ;
		1:
			Vac3TON.IN := Vac2TON.Q ;
	END_CASE
	Vac3TON.PT := VacPT	;
	Vac3TON ();
	
	Vac4TON.IN := Vac3TON.Q ;
	Vac4TON.PT := VacPT	;
	Vac4TON ();

	ED3TON.IN := Vac4TON.Q	;
	ED3TON.PT := EDPT	;
	ED3TON ();
	
	ED4TON.IN := ED3TON.Q	;
	ED4TON.PT := EDPT	;
	ED4TON ();
	
	Extract3TON.IN := ED4TON.Q	;
	Extract3TON.PT := ExtractionPT	;
	Extract3TON ();
	
	Extract4TON.IN := Extract3TON.Q	;
	Extract4TON.PT := ExtractionPT	;
	Extract4TON ();
	
	//OUTPUTS
	IF (Enable[2]) THEN
		BeltOUT[5] := Belt5TON.IN ;
		BeltOUT[6] := Belt6TON.IN ;
		BeltOUT[7] := Belt7TON.IN ;
		BeltOUT[8] := Belt8TON.IN ;
		BeltOUT[11] := Belt11TON.IN ;
		BeltOUT[12] := Belt12TON.IN ;
		VacOUT[3] := Vac3TON.IN OR VacStopTON.IN ;
		VacOUT[4] := Vac4TON.IN OR VacStopTON.IN ;
		EDOUT[3] := ED3TON.IN AND EDOn ;
		EDOUT[4] := ED4TON.IN AND EDOn ;
		ExtractionOUT[3] := Extract3TON.IN ;
		ExtractionOUT[4] := Extract4TON.IN ;
	ELSE
		BeltOUT[5] := FALSE ;
		BeltOUT[6] := FALSE ;
		BeltOUT[7] := FALSE ;
		BeltOUT[8] := FALSE ;
		BeltOUT[11] := FALSE ;
		BeltOUT[12] := FALSE ;
		VacOUT[3] := FALSE ;
		VacOUT[4] := FALSE ;
		EDOUT[3] := FALSE ;
		EDOUT[4] := FALSE ;
		ExtractionOUT[3] := FALSE ;
		ExtractionOUT[4] := FALSE ;
	END_IF

	//AutoStart[2] RESET CONDITIONS
	IF EDGEPOS(AutoStart[2]) AND(Starting1) AND(AutoStart[2]) THEN
		AutoStart[2] := FALSE ;
	END_IF
	IF EDGENEG(AutoStart[2]) OR EDGENEG(Enable[2]) OR NOT(Enable[2]) AND(AutoStart[2]) THEN
		AutoStart[2] := FALSE ;
	END_IF
	IF NOT(ControlIN) OR(Detension) AND(AutoStart[2]) THEN
		AutoStart[2]	:= 	FALSE	;
	END_IF
	IF(AutoStart[2]) THEN
		FOR i:= 13 TO 24 DO
			IF Trips[i] = TRUE THEN
				AutoStart[2]	:= 	FALSE	;
				EXIT				;
			END_IF
		END_FOR
	END_IF

	//DoneOUT[2] CONDITIONS
	IF EDGENEG(Starting2) AND (AutoStart[2]) AND(Enable[2]) THEN
		DoneOUT[2] := TRUE ;
	END_IF
	IF NOT(Starting2) AND NOT(AutoStart[2]) AND(Enable[2]) THEN
		DoneOUT[2] := FALSE ;
	END_IF
	IF NOT(Enable[2]) THEN
		DoneOUT[2] := TRUE ;
	END_IF
	
	//-------------------------------------------------------------------------
	//TRANSPORT ONLY MODE - ENABLE VACUUM PUMPS ONLY
	IF(TransportMode) AND(ControlIN) THEN
		VacOUT[1] := TRUE ;
		VacOUT[2] := Vac1TON.Q ;
		VacOUT[3] := Vac2TON.Q ;
		VacOUT[4] := Vac3TON.Q ;
		Enable[1] := FALSE ;
		Enable[2] := FALSE ;
		Enable[3] := FALSE ;
		Enable[4] := FALSE ;
	END_IF
	
	IF EDGENEG(TransportMode) THEN
		VacOUT[1] := FALSE	;
		VacOUT[2] := FALSE	;
		VacOUT[3] := FALSE	;
		VacOUT[4] := FALSE	;
	END_IF

	//RUN VACUUM PUMPS AFTER CONTROL OFF TO ENSURE DRY AIR PASSING THROUGH
	IF EDGENEG(ControlIN) AND((Enable[1]) OR(Enable[2]) OR(Enable[3]) OR(Enable[4])) THEN
		VacStopTON.IN := TRUE ;
		VacOUT[1] := TRUE ;
		VacOUT[2] := TRUE ;
		VacOUT[3] := TRUE ;
		VacOUT[4] := TRUE ;
	END_IF

	//DELAY BEFORE VACUUM PUMP STOP
	VacStopTON.PT := VacsStopPT ;
	VacStopTON ();

	IF(VacStopTON.Q) THEN
		VacStopTON.IN := FALSE ;
	END_IF
	
	//WATER CONTROL
	//START CONDITIONS FOR WATER PUMPS
	PumpOUT[1] := FALSE ;
	PumpOUT[2] := FALSE ;
	IF (AutoStart[1]) OR(AutoStart[2]) THEN
		IF(ControlIN) AND NOT(Pump1TON.Q) THEN
			PumpOUT[1] := TRUE ;
		ELSE
			PumpOUT[1] := FALSE ;
		END_IF
		IF (ControlIN) AND NOT(Pump2TON.Q) THEN
			PumpOUT[2] := TRUE ;
		ELSE
			PumpOUT[2] := FALSE ;
		END_IF
	END_IF

	//FLOAT SWITCH CONTROL OF WATER PUMP
	Pump1TON.IN := NOT(Float[1]) ;
	Pump1TON.PT := PumpPT[1] ;
	Pump1TON ();
	
	Pump2TON.IN := NOT(Float[2]) ;
	Pump2TON.PT := PumpPT[1] ;
	Pump2TON ();

	//SCAVENGE PUMP
	IF (AutoStart[1]) OR(AutoStart[2]) OR(PumpOUT[0]) THEN
		Pump3TON.IN := TRUE ;
	ELSE
		Pump3TON.IN := FALSE ;
	END_IF
	//DELAY BEFORE SCAVENGE PUMP STARTS
	Pump3TON.PT	:= PumpPT[3] ;
	Pump3TON ();

	IF (Pump3TON.Q) AND NOT (Pump4TON.Q) THEN
		PumpOUT[0]	:= 	TRUE	;
	ELSE
		PumpOUT[0]	:= 	FALSE	;
	END_IF
	
	//DELAY BEFORE SCAVENGE PUMP STOP
	Pump4TON.PT	:= PumpPT[4] ;
	Pump4TON ();

	IF NOT(AutoStart[1]) AND NOT(AutoStart[2]) THEN
		Pump4TON.IN := TRUE ;
	ELSE
		Pump4TON.IN := FALSE ;
	END_IF
		
END_FUNCTION_BLOCK


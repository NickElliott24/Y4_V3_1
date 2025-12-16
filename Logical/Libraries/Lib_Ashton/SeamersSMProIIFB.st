(********************************************************************
* COPYRIGHT ASHTON INDUSTRIAL SALES LTD. OCT 2024
********************************************************************
* LIBRARY: Lib_Ashton
* FILE: SeamersSMProIIFB.st
* AUTHOR: NE
********************************************************************
* IMPLEMENTATION OF LIBRARY Lib_Ashton
 ********************************************************************)

//SEAMERS START UP AUTO SEQUENCE AND CONTROL SMPRO
FUNCTION_BLOCK SeamersSMProIIFB

	//ENABLE AUTO START SEQUENCE BUTTON ON SCREEN
	IF(Enable[1]) AND(Enable[2]) AND NOT(AutoStart[1]) AND NOT(AutoStart[2])THEN
		StartAllDisp := FB_SHOW;
	ELSE
		StartAllDisp := FB_HIDE;
	END_IF

	//=========================================================
	// sequenced start of seamer 1 process motors and pumps
	//=========================================================
	CASE AutoStart1 OF
		//=======================================================
		SS_Reset:
			Belt1TON.IN := FALSE;
			Belt2TON.IN := FALSE;
			Belt3TON.IN := FALSE;
			Belt4TON.IN := FALSE;
			Belt9TON.IN := FALSE;
			Belt10TON.IN := FALSE;
			Vac1TON.IN := FALSE;
			Vac2TON.IN := FALSE;
			Extract1TON.IN := FALSE;
			Extract2TON.IN := FALSE;
			BeltOUT[1] := FALSE;
			BeltOUT[2] := FALSE;
			BeltOUT[3] := FALSE;
			BeltOUT[4] := FALSE;
			BeltOUT[9] := FALSE;
			BeltOUT[10] := FALSE;
			VacOUT[1] := FALSE;
			VacOUT[2] := FALSE;
			ExtractionOUT[1] := FALSE;
			ExtractionOUT[2] := FALSE;
			Latch := FALSE;
			DoneOUT[1] := FALSE;

			IF NOT(Enable[1]) THEN
				DoneOUT[1] := TRUE;
			END_IF
      
			IF(AutoStart[0]) AND(LatchES) AND(AutoStart2 = SS_Started) THEN
				AutoStart[1] := TRUE;
			ELSIF(AutoStart[0]) AND(Control.Achieved) THEN
				AutoStart[1] := TRUE;
				Latch := TRUE;
			END_IF
      
			IF(TransportMode)THEN
				AutoStart1 := SS_VacuumPump1;
			ELSE
				AutoStart1 := SS_Ready;
			END_IF
		//=======================================================
		SS_Ready:
			IF(AutoStart[1])THEN
				AutoStart1 := SS_BeltMotor1;
			END_IF
		//=======================================================
		SS_BeltMotor1:
			BeltOUT[1] := TRUE;
			Belt1TON.IN := TRUE;
			IF (Belt1TON.Q)THEN
				AutoStart1 := SS_BeltMotor2;
			END_IF
		//=======================================================
		SS_BeltMotor2:
			BeltOUT[2] := TRUE;
			Belt2TON.IN := TRUE;
			IF(Belt2TON.Q)THEN
				AutoStart1 := SS_BeltMotor3;
			END_IF
		//=======================================================
		SS_BeltMotor3:
			BeltOUT[3] := TRUE;
			Belt3TON.IN := TRUE;
			IF (Belt3TON.Q)THEN
				AutoStart1 := SS_BeltMotor4;
			END_IF
		//=======================================================
		SS_BeltMotor4:
			BeltOUT[4] := TRUE;
			Belt4TON.IN := TRUE;
			IF(Intercept1 < ID_Open) AND((AutoStart2 = SS_Reset) OR(AutoStart2 = SS_BeltMotor4) OR(AutoStart2 = SS_Started))THEN
				IF(Belt4TON.Q)THEN
					AutoStart1 := SS_VacuumPump1;
				END_IF
			END_IF
		//=======================================================
		SS_VacuumPump1:
			VacOUT[1] := TRUE;
			Vac1TON.IN := TRUE;
			IF (Vac1TON.Q)THEN
				AutoStart1 := SS_VacuumPump2;
			END_IF
		//=======================================================
		SS_VacuumPump2:
			VacOUT[2] := TRUE;
			Vac2TON.IN := TRUE;
			IF(Vac2TON.Q)THEN
				IF(Shaker)THEN
					AutoStart1 := SS_Extraction1;
				ELSE
					AutoStart1 := SS_Started;
					IF(TransportMode)THEN
						AutoStart1 := SS_TransportMode;
						AutoStart2 := SS_VacuumPump1;
					ELSE
						AutoStart1 := SS_Started;
					END_IF
				END_IF
				IF(Latch)THEN
					AutoStart2 := SS_Reset;
					AutoStart[2] := TRUE;
				END_IF
			END_IF
		//=======================================================
		SS_Extraction1:
			ExtractionOUT[1] := TRUE;
			Extract1TON.IN := TRUE;
			IF(Extract1TON.Q)THEN
				AutoStart1 := SS_Extraction2;
			END_IF;
		//=======================================================
		SS_Extraction2:
			ExtractionOUT[2] := TRUE;
			Extract2TON.IN := TRUE;
			IF(Extract2TON.Q)THEN
				AutoStart1 := SS_Started;
			END_IF;
		//=======================================================
		SS_Started:
			DoneOUT[1] := TRUE;
			AutoStart[0] := FALSE;
			IF NOT((Enable[1]) OR (AutoStart[1]))THEN
				AutoStart1 := SS_Reset;
			END_IF
		
			IF(AutoStart2 > SS_Reset)THEN
				Latch := FALSE;
			END_IF
		
			//stop/start extraction when shaking
			ExtractionOUT[1] := NOT(Shaker);
			ExtractionOUT[2] := NOT(Shaker);
		//=======================================================
		SS_TransportMode:
	
	END_CASE
	
	Belt1TON.PT := PresetSys.Belt;
	Belt1TON ();
	Belt2TON.PT := PresetSys.Belt;
	Belt2TON ();
	Belt3TON.PT := PresetSys.Belt;
	Belt3TON ();
	Belt4TON.PT := PresetSys.Belt;
	Belt4TON ();
	Vac1TON.PT := PresetSys.Vac;
	Vac1TON ();
	Vac2TON.PT := PresetSys.Vac;
	Vac2TON ();
	Extract1TON.PT := PresetSys.Extraction;
	Extract1TON ();
	Extract2TON.PT := PresetSys.Extraction;
	Extract2TON ();

	// reset if motor starter trip detected
	IF(AutoStart[1])THEN
		FOR i:= 0 TO 9 DO
			IF(Trips[i])THEN
				AutoStart1 := SS_Reset;
				EXIT;
			END_IF
		END_FOR
	END_IF

	// reset sequence if buttons changed on terminal
	IF NOT(Enable[1]) OR NOT(Control.Achieved) OR(Detension)THEN
		AutoStart[1] := FALSE;
		AutoStart[0] := FALSE;
	END_IF
	
	IF NOT(AutoStart[1]) AND NOT(TransportMode)THEN
		AutoStart[1] := FALSE;
		AutoStart1 := SS_Reset;
	END_IF
	
	IF(TransportMode) AND NOT(Control.Achieved)THEN
		AutoStart[1] := FALSE;
		AutoStart1 := SS_Reset;
	END_IF

	//=========================================================
	// sequenced start of seamer 2 process motors and pumps
	//=========================================================
	CASE AutoStart2 OF
		//=======================================================
		SS_Reset:
			Belt5TON.IN := FALSE;
			Belt6TON.IN := FALSE;
			Belt7TON.IN := FALSE;
			Belt8TON.IN := FALSE;
			Belt11TON.IN := FALSE;
			Belt12TON.IN := FALSE;
			Vac3TON.IN := FALSE;
			Vac4TON.IN := FALSE;
			Extract3TON.IN := FALSE;
			Extract4TON.IN := FALSE;
			BeltOUT[5] := FALSE;
			BeltOUT[6] := FALSE;
			BeltOUT[7] := FALSE;
			BeltOUT[8] := FALSE;
			BeltOUT[11] := FALSE;
			BeltOUT[12] := FALSE;
			VacOUT[3] := FALSE;
			VacOUT[4] := FALSE;
			ExtractionOUT[3] := FALSE;
			ExtractionOUT[4] := FALSE;
			LatchES := FALSE;
			DoneOUT[2] := FALSE;

			IF NOT(Enable[2]) THEN
				DoneOUT[2] := TRUE;
			END_IF
      
			IF(AutoStart[0]) AND(Control.ESClear)THEN
				AutoStart[2] := TRUE;
				LatchES := TRUE;
			ELSIF(Latch) AND(AutoStart1 = SS_Started)THEN
				AutoStart[2] := TRUE;
			END_IF
			IF(TransportMode)THEN
				AutoStart2 := SS_VacuumPump1;
			ELSE
				AutoStart2 := SS_Ready;
			END_IF
		//=======================================================
		SS_Ready:
			IF(AutoStart[2])THEN
				AutoStart2 := SS_BeltMotor1;
			END_IF
		//=======================================================
		SS_BeltMotor1:
			BeltOUT[5] := TRUE;
			Belt5TON.IN := TRUE;
			IF (Belt5TON.Q)THEN
				AutoStart2 := SS_BeltMotor2;
			END_IF
		//=======================================================
		SS_BeltMotor2:
			BeltOUT[6] := TRUE;
			Belt6TON.IN := TRUE;
			IF(Belt6TON.Q)THEN
				AutoStart2 := SS_BeltMotor3;
			END_IF
		//=======================================================
		SS_BeltMotor3:
			BeltOUT[7] := TRUE;
			Belt7TON.IN := TRUE;
			IF (Belt7TON.Q)THEN
				AutoStart2 := SS_BeltMotor4;
			END_IF
		//=======================================================
		SS_BeltMotor4:
			BeltOUT[8] := TRUE;
			Belt8TON.IN := TRUE;
			IF(Intercept2 < ID_Open) AND((AutoStart1 = SS_Reset) OR(AutoStart1 = SS_BeltMotor4) OR(AutoStart1 = SS_Started))THEN
				IF(Belt8TON.Q)THEN
					AutoStart2 := SS_VacuumPump1;
				END_IF
			END_IF
		//=======================================================
		SS_VacuumPump1:
			VacOUT[3] := TRUE;
			Vac3TON.IN := TRUE;
			IF (Vac3TON.Q)THEN
				AutoStart2 := SS_VacuumPump2;
			END_IF
		//=======================================================
		SS_VacuumPump2:
			VacOUT[4] := TRUE;
			IF(Vac4TON.Q)THEN
				IF(Shaker)THEN
					AutoStart2 := SS_Extraction1;
				ELSE
					AutoStart2 := SS_Started;
					IF(TransportMode)THEN
						AutoStart2 := SS_TransportMode;
					ELSE
						AutoStart2 := SS_Started;
					END_IF
				END_IF
				IF(LatchES)THEN
					AutoStart1 := SS_Reset;
				END_IF
			END_IF
		//=======================================================
		SS_Extraction1:
			ExtractionOUT[3] := TRUE;
			Extract3TON.IN := TRUE;
			IF(Extract3TON.Q)THEN
				AutoStart2 := SS_Extraction2;
			END_IF;
		//=======================================================
		SS_Extraction2:
			ExtractionOUT[4] := TRUE;
			Extract4TON.IN := TRUE;
			IF(Extract4TON.Q)THEN
				AutoStart2 := SS_Started;
			END_IF;
		//=======================================================
		SS_Started:
			DoneOUT[2] := TRUE;
			AutoStart[0] := FALSE;
			IF NOT((Enable[1]) OR (AutoStart[1]) OR(Enable[2]) OR (AutoStart[2]))THEN
				AutoStart2 := SS_Reset;
			END_IF
		
			IF(AutoStart1 > SS_Reset)THEN
				LatchES := FALSE;
			END_IF
		
			//stop/start extraction when shaking
			ExtractionOUT[3] := NOT(Shaker);
			ExtractionOUT[4] := NOT(Shaker);
		//=======================================================
		SS_TransportMode:
	
	END_CASE

	Belt5TON.PT := PresetSys.Belt;
	Belt5TON ();
	Belt6TON.PT := PresetSys.Belt;
	Belt6TON ();
	Belt7TON.PT := PresetSys.Belt;
	Belt7TON ();
	Belt8TON.PT := PresetSys.Belt;
	Belt8TON ();
	Vac3TON.PT := PresetSys.Vac;
	Vac3TON ();
	Vac4TON.IN := TRUE;
	Vac4TON.PT := PresetSys.Vac;
	Vac4TON ();
	Extract3TON.PT := PresetSys.Extraction;
	Extract3TON ();
	Extract4TON.PT := PresetSys.Extraction;
	Extract4TON ();
	
	// reset if motor starter trip detected
	IF(AutoStart[2])THEN
		FOR i:= 10 TO 19 DO
			IF(Trips[i])THEN
				AutoStart2 := SS_Reset;
				EXIT;
			END_IF
		END_FOR
	END_IF

	// reset sequence if buttons changed on terminal
	IF NOT(Enable[2]) OR NOT(Control.Achieved) OR(Detension)THEN
		AutoStart[2] := FALSE;
		AutoStart[0] := FALSE;
	END_IF
	
	IF NOT(AutoStart[2]) AND NOT(TransportMode)THEN
		AutoStart[2] := FALSE;
		AutoStart2 := SS_Reset;
	END_IF
	
	IF(TransportMode) AND NOT(Control.Achieved)THEN
		AutoStart[2] := FALSE;
		AutoStart2 := SS_Reset;
	END_IF

	//==========================================
	// vacuum pumop run on control after control off
	//==========================================
	CASE VacuumRunOn OF
		//=======================================================
		VR_Idle:
			IF(Control.Achieved) THEN
				VacuumRunOn := VR_Done;
			END_IF
			VacStopTON.IN := FALSE;
		//=======================================================
		VR_Running:
			VacOUT[1] := TRUE;
			VacOUT[2] := TRUE;
			VacOUT[3] := TRUE;
			VacOUT[4] := TRUE;
			VacStopTON.IN := TRUE;
			VacStopTON.PT := PresetSys.VacsStop;
			IF(VacStopTON.Q)THEN
				VacuumRunOn := VR_Idle;
			END_IF
		//=======================================================
		VR_Done:
			VacStopTON.IN := FALSE;
			IF NOT(Control.Achieved) AND((Enable[1]) OR(Enable[2])) THEN
				VacuumRunOn := VR_Running;
			END_IF;
      
	END_CASE;

	VacStopTON ();

	//WATER CONTROL
	//START CONDITIONS FOR WATER PUMPS
	PumpOUT[1] := FALSE;
	PumpOUT[2] := FALSE;
	IF (AutoStart[1]) OR(AutoStart[2]) OR(PumpOUT[0])THEN
		IF(Control.Achieved) AND NOT(Pump1TON.Q)THEN
			PumpOUT[1] := TRUE;
		ELSE
			PumpOUT[1] := FALSE;
		END_IF
		IF (Control.Achieved) AND NOT(Pump2TON.Q)THEN
			PumpOUT[2] := TRUE;
		ELSE
			PumpOUT[2] := FALSE;
		END_IF
	END_IF

	//FLOAT SWITCH CONTROL OF WATER PUMP
	Pump1TON.IN := NOT(Float[1]);
	Pump1TON.PT := PresetSys.Water[1];
	Pump1TON ();
	
	Pump2TON.IN := NOT(Float[2]);
	Pump2TON.PT := PresetSys.Water[1];
	Pump2TON ();

	//SCAVENGE PUMP
	IF (AutoStart[1]) OR(AutoStart[2]) OR(PumpOUT[0]) THEN
		Pump3TON.IN := TRUE ;
	ELSE
		Pump3TON.IN := FALSE ;
	END_IF
	//DELAY BEFORE SCAVENGE PUMP STARTS
	Pump3TON.PT	:= PresetSys.Water[3] ;
	Pump3TON ();

	IF (Pump3TON.Q) AND NOT (Pump4TON.Q) THEN
		PumpOUT[0]	:= 	TRUE	;
	ELSE
		PumpOUT[0]	:= 	FALSE	;
	END_IF
	
	//DELAY BEFORE SCAVENGE PUMP STOP
	Pump4TON.PT	:= PresetSys.Water[4] ;
	Pump4TON ();

	IF NOT(AutoStart[1]) AND NOT(AutoStart[2]) THEN
		Pump4TON.IN := TRUE ;
	ELSE
		Pump4TON.IN := FALSE ;
	END_IF
	//SPRAY NOZZLE VALVE
	IF (AutoStart[1]) OR(AutoStart[2])THEN
		ValveOUT[1] := TRUE;
	ELSE
		ValveOUT[1] := FALSE;
	END_IF
	
	//SCAVENGE PUMP VALVE
	//DELAY BEFORE SCAVENGE PUMP STARTS
	Scavenge.Open.PT := PresetSys.Water[3];
	Scavenge.Open ();
	
	//VALVE OPEN
	ValveOUT[2] := Scavenge.Open.M;
	
	IF(Scavenge.Open.Q)THEN
		Scavenge.Open.IN := FALSE;
		Scavenge.Interval.IN := TRUE;
	END_IF
	
	//DELAY FOR INTERVAL BETWEEN VALVE OPENING
	IF EDGEPOS(Control.Achieved)THEN
		Scavenge.Open.IN := FALSE;
		Scavenge.Interval.IN := TRUE;
	END_IF
	IF NOT(Control.Achieved)THEN
		Scavenge.Open.IN := FALSE;
		Scavenge.Interval.IN := FALSE;
	END_IF
	IF(Scavenge.Open.PT = t#0ms)THEN
		Scavenge.Open.IN := FALSE;
		Scavenge.Interval.IN := FALSE;
		ValveOUT[2] := FALSE;
	END_IF
		
	Scavenge.Interval.PT := PresetSys.Water[4];
	Scavenge.Interval ();
	
	IF(Scavenge.Interval.Q)THEN
		Scavenge.Interval.IN := FALSE;
		Scavenge.Open.IN := TRUE;
	END_IF
		
	BackGround.AutoStart := AutoStart;
	BackGround.Enable := Enable;
	BackGround.ED := EDOn;

	//=========================================================
	// delay for intercept draining
	//=========================================================
	CASE Intercept1 OF
		//=======================================================
		ID_Idle:
			InterceptInterval1TON.IN := FALSE;
			InterceptOpen1TON.IN := FALSE;
			IF(AutoStart1 >= SS_Started)THEN
				Intercept1 := ID_Interval;
			END_IF
		//=======================================================
		ID_Interval:
			InterceptOpen1TON.IN := FALSE;
			InterceptInterval1TON.IN := TRUE;
			IF(InterceptInterval1TON.Q)THEN
				IF NOT(SeekBlock[1])THEN
					DoneOUT[1] := FALSE;
				END_IF
				IF NOT(SeekBlock[1])THEN
					AutoStart1 := SS_BeltMotor4;
					Vac1TON.IN := FALSE;
					Vac2TON.IN := FALSE;
					VacOUT[1] := FALSE;
					VacOUT[2] := FALSE;
					Intercept1 := ID_Open;
				END_IF
			END_IF
		//=======================================================
		ID_Open:
			InterceptInterval1TON.IN := FALSE;
			InterceptOpen1TON.IN := TRUE;
			IF(InterceptOpen1TON.Q)THEN
				Intercept1 := ID_Interval;
			END_IF    
	END_CASE
 
	InterceptInterval1TON.PT := InterceptInterval;
	InterceptInterval1TON ();
	InterceptOpen1TON.PT := InterceptOpen;
	InterceptOpen1TON ();

	IF NOT(Control.Achieved) OR(AutoStart1 = SS_Reset)THEN
		Intercept1 := ID_Idle;
	END_IF

	//=========================================================
	// delay for intercept draining
	//=========================================================
	CASE Intercept2 OF
		//=======================================================
		ID_Idle:
			InterceptInterval2TON.IN := FALSE;
			InterceptOpen2TON.IN := FALSE;
			IF(AutoStart2 >= SS_Started)THEN
				Intercept2 := ID_Interval;
			END_IF
		//=======================================================
		ID_Interval:
			InterceptOpen2TON.IN := FALSE;
			InterceptInterval2TON.IN := TRUE;
			IF(InterceptInterval2TON.Q)THEN
				IF NOT(SeekBlock[2]) THEN
					DoneOUT[2] := FALSE;
				END_IF
				IF NOT(SeekBlock[2])THEN
					AutoStart2 := SS_BeltMotor4;
					Vac3TON.IN := FALSE;
					Vac4TON.IN := FALSE;
					VacOUT[3] := FALSE;
					VacOUT[4] := FALSE;
					Intercept2 := ID_Open;
				END_IF
			END_IF
		//=======================================================
		ID_Open:
			InterceptInterval2TON.IN := FALSE;
			InterceptOpen2TON.IN := TRUE;
			IF(InterceptOpen2TON.Q)THEN
				Intercept2 := ID_Interval;
			END_IF    
	END_CASE

	InterceptInterval2TON.PT := InterceptInterval;
	InterceptInterval2TON ();
	InterceptOpen2TON.PT := InterceptOpen;
	InterceptOpen2TON ();

	IF NOT(Control.Achieved) OR(AutoStart2 = SS_Reset)THEN
		Intercept2 := ID_Idle;
	END_IF

END_FUNCTION_BLOCK


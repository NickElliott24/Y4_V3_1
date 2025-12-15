(********************************************************************
* COPYRIGHT ASHTON INDUSTRIAL SALES LTD. 2024
********************************************************************
* LIBRARY: Lib_Ashton
* FILE:  NozzleControl.st
* AUTHOR: NE
********************************************************************
* IMPLEMENTATION OF LIBRARY Lib_Ashton
 ********************************************************************)

//SPRAY NOZZLE CONTROL
FUNCTION_BLOCK NozzleControl

	// SPRAY NOZZLE START UP CONTROL STOP
	Nozzle.PurgeCount := NozzlePerm.PurgeCount;
	Nozzle.VacuumStopDelay := UDINT_TO_DINT(VacuumStopDelay/20);
	Nozzle.NozzleOpenDelay := NozzlePerm.OpenDelay/20;
	CASE Nozzle.Seq OF
		NC_Idle:
			Spray := FALSE;
			Nozzle.CountPurge := 0;
			IF(AutoStart)THEN
				Nozzle.Seq := NC_Open;
				Nozzle.Delay := 0;
			END_IF
		NC_Open:
			Spray := TRUE;
			Nozzle.Delay := Nozzle.Delay + 1;
			IF(Nozzle.Delay > 25)THEN
				Nozzle.Seq := NC_Close;
				Nozzle.Delay := 0;
			END_IF
		NC_Close:
			Spray := FALSE;
			Nozzle.Delay := Nozzle.Delay + 1;
			IF(Nozzle.Delay > 25)THEN
				Nozzle.CountPurge := Nozzle.CountPurge + 1;
				IF(Nozzle.CountPurge >= Nozzle.PurgeCount)THEN
					Nozzle.Seq := NC_CleanDone;
					IdleOpenTON.IN := FALSE;
					IdleIntervalTON.IN := TRUE;
				ELSE
					Nozzle.Seq := NC_Open;
					Nozzle.Delay := 0;
				END_IF
			END_IF
		NC_CleanDone:
			//LINE RUNNING SPRAY CONTROL
			Spray := FALSE;
			FOR TrackIndex := 0 TO 6 DO
				IF(Track[TrackIndex])THEN
					Spray := TRUE; 
					SequenceIO := IO_IDLE;
					IdleIntervalTON.IN := FALSE;
					IdleOpenTON.IN := FALSE;
					EXIT;
				ELSE
					//DELAY FOR VALVE OPENING WHEN IDLE
					CASE SequenceIO OF
						IO_IDLE:
							SequenceIO := IO_INTERVAL;
							IdleIntervalTON.IN := FALSE;
							IdleOpenTON.IN := FALSE;
						IO_INTERVAL:
							Spray := FALSE;
							IdleIntervalTON.IN := TRUE;
							IdleOpenTON.IN := FALSE;
							IF(IdleIntervalTON.Q)THEN
								SequenceIO := IO_OPEN;
							END_IF
						IO_OPEN:
							Spray := TRUE;
							IdleIntervalTON.IN := FALSE;
							IdleOpenTON.IN := TRUE;
							IF(IdleOpenTON.Q)THEN
								SequenceIO := IO_INTERVAL;
							END_IF
					END_CASE
				END_IF
			END_FOR
			CASE PreTracking OF
				0:
				1:
					Spray := (PreTrack[1]) AND NOT(PreTrack[0]);
				2:
					Spray := (PreTrack[1] OR PreTrack[2]) AND NOT(PreTrack[0]);
			END_CASE
			//WAIT FOR CONTROL STOP
			IF NOT(Control)THEN
				Nozzle.Delay := 0;
				Nozzle.Seq := NC_ControlStop1;
			END_IF
			IF NOT(AutoStart)THEN
				Nozzle.Seq := NC_ControlStop2;
			END_IF
		NC_ControlStop1:
			Spray := TRUE;
			Nozzle.Delay := Nozzle.Delay + 1;
			IF(Nozzle.Delay > Nozzle.VacuumStopDelay)THEN
				Nozzle.Delay := 0;
				Nozzle.Seq := NC_ControlStop2;
			END_IF
		NC_ControlStop2:
			Spray := TRUE;
			Nozzle.Delay := Nozzle.Delay + 1;
			IF(Nozzle.Delay > Nozzle.NozzleOpenDelay)THEN
				Nozzle.Delay := 0;
				Nozzle.Seq := NC_Idle;
			END_IF
			ControlStop := ControlStop + 1;
	END_CASE
	IdleOpenTON.PT := t#30s;
	IdleOpenTON ();
	IdleIntervalTON.PT := t#1m;
	IdleIntervalTON ();
	IF(TransportMode)THEN
		Spray := FALSE;
	END_IF
	
END_FUNCTION_BLOCK

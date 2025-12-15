(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ESRecover
 * File: ESRecover.st
 * Author: NE
 ********************************************************************)

PROGRAM _CYCLIC

    //SET ESCLEAR BIT IF GLASS PRESENT AT ESTOP
	Control.ESClear := EMO.Recovery ;

	//DELAY SEAMING CONVEYORS RESTART AFTER ESTOP UNTIL GRINDING BELTS ALLOWED TO POSITION
	IF EDGENEG(Control.ESClear) THEN
		EMO.Latch1 := TRUE ;
		EMO.Latch2 := TRUE ;
	END_IF

	PresetSys.ESRestart[1] := LIMIT(10, PresetSys.ESRestart[1], 700) ;
	EMO.LatchTON1.IN := (EMO.Latch1) AND (Seamers.DoneOUT[1]) ;
	EMO.LatchTON1.PT := PresetSys.ESRestart[1] ;
	EMO.LatchTON1 ();
	IF(EMO.LatchTON1.Q) THEN
		EMO.Latch1 := FALSE ;
	END_IF

	PresetSys.ESRestart[2] := LIMIT(10, PresetSys.ESRestart[2], 700) ;
	EMO.LatchTON2.IN := (EMO.Latch2) AND (Seamers.DoneOUT[2]) ;
	EMO.LatchTON2.PT := PresetSys.ESRestart[2] ;
	EMO.LatchTON2 ();
	IF(EMO.LatchTON2.Q) THEN
		EMO.Latch2 := FALSE ;
	END_IF

	//AT ESTOP LATCH BIT TO ALLOW FOR MOVEMENT OF GLASS ON CONVEYORS AND PALLETS
	IF EDGEPOS(Control.EStop1) THEN
		EMO.StartLatch := TRUE ;
	END_IF

	EMO.Start.IN := EMO.StartLatch ;
	EMO.Start.PT := T#2s ;
	EMO.Start ();

	IF EDGEPOS(EMO.Start.Q) THEN
		EMO.StartLatch := FALSE ;
	END_IF

	//RESET ESCONFIRM BIT
	IF EDGEPOS(Control.EStop1) AND (Control.ESClear) OR EDGENEG(Control.ESClear) THEN
		EMO.Confirm[4] := FALSE ;
	END_IF

	//SWITCH TO EMO RECOVERY SCREEN IF ANY GLASS PRESENT
	IF EDGEPOS(Control.EStop1) AND NOT(Control.Empty) THEN
		Vis.P11.EnableIndex := 20 ;
		Vis.Page.New := P11_MIMIC ;
	END_IF

	//ESTOP RECOVERY SCREENS ACTIVE
	IF (Vis.P11.EnableIndex >= 20) AND (Vis.P11.EnableIndex <= 22) THEN
		EMO.Recovery := TRUE ;
	ELSE
		EMO.Recovery := FALSE ;
		Vis.EMO.Disp[0] := HIDE ;
		Vis.EMO.Disp[1] := HIDE ;
		Vis.EMO.Disp[2] := HIDE ;
		Vis.EMO.Disp[3] := HIDE ;
		Vis.EMO.Confirm[0] := FALSE ;
		Vis.EMO.Confirm[1] := FALSE ;
		Vis.EMO.Confirm[2] := FALSE ;
		Vis.EMO.Confirm[3] := FALSE ;
		Vis.EMO.Confirm[4] := FALSE ;
		Tracking00.Cleared := FALSE ;
		Tracking90.Cleared := FALSE ;
		Tracking01.Cleared := FALSE ;
		Tracking10.Cleared := FALSE ;
		Tracking91.Cleared := FALSE ;
		Tracking11.Cleared := FALSE ;
		Tracking20.Cleared := FALSE ;
		Tracking92.Cleared := FALSE ;
		Tracking30.Cleared := FALSE ;
		Tracking93.Cleared := FALSE ;
		Tracking40.Cleared := FALSE ;
		Tracking41.Cleared := FALSE ;
		Tracking50.Cleared := FALSE ;
		Tracking60.Cleared := FALSE ;
		Tracking70.Cleared := FALSE ;
		Tracking80.Cleared := FALSE ;
		Tracking81.Cleared := FALSE ;
		Tracking82.Cleared := FALSE ;
		Tracking51.Cleared := FALSE ;
	END_IF

	//RESET ALL BITS IF ESTOP PRESSED WHILE ON ESTOPSCREENS
	IF EDGEPOS(Control.EStop1) AND (EMO.Recovery) THEN
		Vis.EMO.Disp[0] := HIDE ;
		Vis.EMO.Disp[1] := HIDE ;
		Vis.EMO.Disp[2] := HIDE ;
		Vis.EMO.Disp[3] := HIDE ;
		Vis.EMO.Confirm[0] := FALSE ;
		Vis.EMO.Confirm[1] := FALSE ;
		Vis.EMO.Confirm[2] := FALSE ;
		Vis.EMO.Confirm[3] := FALSE ;
		Vis.EMO.Confirm[4] := FALSE ;
		Tracking00.Cleared := FALSE ;
		Tracking90.Cleared := FALSE ;
		Tracking01.Cleared := FALSE ;
		Tracking10.Cleared := FALSE ;
		Tracking91.Cleared := FALSE ;
		Tracking11.Cleared := FALSE ;
		Tracking20.Cleared := FALSE ;
		Tracking92.Cleared := FALSE ;
		Tracking30.Cleared := FALSE ;
		Tracking93.Cleared := FALSE ;
		Tracking40.Cleared := FALSE ;
		Tracking41.Cleared := FALSE ;
		Tracking50.Cleared := FALSE ;
		Tracking60.Cleared := FALSE ;
		Tracking70.Cleared := FALSE ;
		Tracking80.Cleared := FALSE ;
		Tracking81.Cleared := FALSE ;
		Tracking82.Cleared := FALSE ;
		Tracking51.Cleared := FALSE ;
	END_IF

	//ESTOP RECOVERY SCREEN CONFIRMATION AND CONTROLS
	CASE Vis.P11.EnableIndex OF
		//ESTOP SCREENS
		20:
			IF (Vis.EMO.Confirm[0]) THEN
				Vis.EMO.Disp[0] := SHOW ;
			END_IF
			IF (Vis.EMO.Confirm[1]) THEN
				Vis.EMO.Disp[1] := SHOW ;
			END_IF
			IF (Vis.EMO.Confirm[1]) AND (Control.Achieved1) THEN
				Vis.EMO.Disp[2] := SHOW;
			END_IF
		21:
			Vis.EMO.Disp[4] := SHOW ;
			IF (Vis.EMO.Confirm[2]) THEN
				Vis.EMO.Disp[3] := SHOW ;
				Vis.P11.EnableIndex := 22 ;
				Vis.EMO.Disp[4] := HIDE ;
				Vis.EMO.Confirm[4] := TRUE ;
			END_IF

			IF (Vis.EMO.Confirm[3]) THEN
				Tracking00.Cleared := FALSE ;
				Tracking90.Cleared := FALSE ;
				Tracking01.Cleared := FALSE ;
				Tracking10.Cleared := FALSE ;
				Tracking91.Cleared := FALSE ;
				Tracking11.Cleared := FALSE ;
				Tracking20.Cleared := FALSE ;
				Tracking92.Cleared := FALSE ;
				Tracking30.Cleared := FALSE ;
				Tracking93.Cleared := FALSE ;
				Tracking40.Cleared := FALSE ;
				Tracking41.Cleared := FALSE ;
				Tracking50.Cleared := FALSE ;
				Tracking60.Cleared := FALSE ;
				Tracking70.Cleared := FALSE ;
				Tracking80.Cleared := FALSE ;
				Tracking81.Cleared := FALSE ;
				Tracking82.Cleared := FALSE ;
				Tracking51.Cleared := FALSE ;
				Vis.EMO.Confirm[3] := FALSE ;
			END_IF
			//USE BITS SET FROM SCREEN TO CLEAR TRACKING DATA OF REMOVED PIECES
			Tracking00.ResES := FALSE ;
			Tracking90.ResES := FALSE ;
			Tracking01.ResES := FALSE ;
			Tracking10.ResES := FALSE ;
			Tracking91.ResES := FALSE ;
			Tracking11.ResES := FALSE ;
			Tracking20.ResES := FALSE ;
			Tracking92.ResES := FALSE ;
			Tracking30.ResES := FALSE ;
			Tracking93.ResES := FALSE ;
			Tracking40.ResES := FALSE ;
			Tracking41.ResES := FALSE ;
			Tracking50.ResES := FALSE ;
			Tracking60.ResES := FALSE ;
			Tracking70.ResES := FALSE ;
			Tracking80.ResES := FALSE ;
			Tracking81.ResES := FALSE ;
			Tracking82.ResES := FALSE ;
			Tracking51.ResES := FALSE ;
			IF EDGEPOS(Vis.EMO.Confirm[4]) THEN
				IF(Tracking00.Cleared) THEN
					Tracking00.ResES := TRUE ;
				END_IF
				IF(Tracking90.Cleared) THEN
					Tracking90.ResES := TRUE ;
				END_IF
				IF(Tracking01.Cleared) THEN
					Tracking01.ResES := TRUE ;
				END_IF
				IF(Tracking10.Cleared) THEN
					Tracking10.ResES := TRUE ;
				END_IF
				IF(Tracking91.Cleared) THEN
					Tracking91.ResES := TRUE ;
				END_IF
				IF(Tracking11.Cleared) THEN
					Tracking11.ResES := TRUE ;
				END_IF
				IF(Tracking20.Cleared) THEN
					Tracking20.ResES := TRUE ;
				END_IF
				IF(Tracking92.Cleared) THEN
					Tracking92.ResES := TRUE ;
				END_IF
				IF(Tracking30.Cleared) THEN
					Tracking30.ResES := TRUE ;
				END_IF
				IF(Tracking93.Cleared) THEN
					Tracking93.ResES := TRUE ;
				END_IF
				IF(Tracking40.Cleared) THEN
					Tracking40.ResES := TRUE ;
				END_IF
				IF(Tracking41.Cleared) THEN
					Tracking41.ResES := TRUE ;
				END_IF
				IF(Tracking50.Cleared) THEN
					Tracking50.ResES := TRUE ;
				END_IF
				IF(Tracking60.Cleared) THEN
					Tracking60.ResES := TRUE ;
				END_IF
				IF(Tracking70.Cleared) THEN
					Tracking70.ResES := TRUE ;
				END_IF
				IF(Tracking80.Cleared) THEN
					Tracking80.ResES := TRUE ;
				END_IF
				IF(Tracking81.Cleared) THEN
					Tracking81.ResES := TRUE ;
				END_IF
				IF(Tracking82.Cleared) THEN
					Tracking82.ResES := TRUE ;
				END_IF
				IF(Tracking51.Cleared) THEN
					Tracking51.ResES := TRUE ;
				END_IF

			END_IF

		22:
			//USE BITS SET FROM SCREEN TO CLEAR TRACKING DATA OF REMOVED PIECES
			Tracking00.ResES := FALSE ;
			Tracking90.ResES := FALSE ;
			Tracking01.ResES := FALSE ;
			Tracking10.ResES := FALSE ;
			Tracking91.ResES := FALSE ;
			Tracking11.ResES := FALSE ;
			Tracking20.ResES := FALSE ;
			Tracking92.ResES := FALSE ;
			Tracking30.ResES := FALSE ;
			Tracking93.ResES := FALSE ;
			Tracking40.ResES := FALSE ;
			Tracking41.ResES := FALSE ;
			Tracking50.ResES := FALSE ;
			Tracking60.ResES := FALSE ;
			Tracking70.ResES := FALSE ;
			Tracking80.ResES := FALSE ;
			Tracking81.ResES := FALSE ;
			Tracking82.ResES := FALSE ;
			Tracking51.ResES := FALSE ;
			Tracking00.Cleared := FALSE ;
			Tracking90.Cleared := FALSE ;
			Tracking01.Cleared := FALSE ;
			Tracking10.Cleared := FALSE ;
			Tracking91.Cleared := FALSE ;
			Tracking11.Cleared := FALSE ;
			Tracking20.Cleared := FALSE ;
			Tracking92.Cleared := FALSE ;
			Tracking30.Cleared := FALSE ;
			Tracking93.Cleared := FALSE ;
			Tracking40.Cleared := FALSE ;
			Tracking41.Cleared := FALSE ;
			Tracking50.Cleared := FALSE ;
			Tracking60.Cleared := FALSE ;
			Tracking70.Cleared := FALSE ;
			Tracking80.Cleared := FALSE ;
			Tracking81.Cleared := FALSE ;
			Tracking82.Cleared := FALSE ;
			Tracking51.Cleared := FALSE ;

	END_CASE

END_PROGRAM

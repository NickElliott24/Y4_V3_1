(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ConSeam2
 * File: ConSeam2Cyclic.st
 * Author: nicke
 ********************************************************************
 * Implementation of program ConSeam2
 ********************************************************************)

PROGRAM _CYCLIC

   //TRACKINGSECTION END BLOCK CONDITIONS
	Tracking20.Blocks[0] := (Tracking30.Busy) ;
	Tracking20.Blocks[2] := (CB1.Input.Fault) ;
	Tracking20.Blocks[9] := (S14Photo.Int) ;
	Tracking20.Blocks[10] := (S15Photo.Int) ;
	Tracking20.ControlIN := Control.Achieved1 ;
	Tracking20.EMOStart := EMO.StartLatch ;
	Tracking20.ESClear := Control.ESClear ;
	Tracking20.BlockInhib := (Track401.Active) ;
	Tracking20 ();
	Tracking20.ResMan := FALSE ;
	//RESET OF OUTPUTS
	Seaming.Start2 := FALSE ;
	Seaming.Stop2 := FALSE ;
	Sol32Pal3.Auto := FALSE ;
	CASE Tracking20.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track201 := TrackClear ;
			Track202 := TrackClear ;
			Track203 := TrackClear ;
			Track204 := TrackClear ;
			Track205 := TrackClear ;
			Track206 := TrackClear ;
			Track207 := TrackClear ;
			Track208 := TrackClear ;
		1: //TRACK FROM NOT Tracking11.Blocked (-) TO S12Photo.Int (P)
			Track202 := TrackClear ;
			Track203 := TrackClear ;
			Track204 := TrackClear ;
			Track205 := TrackClear ;
			Track206 := TrackClear ;
			Track207 := TrackClear ;
			Track208 := TrackClear ;
			//FB INPUTS
			Track201.FixedIN := Tracking20.FixedOUT ;
			IF (ProcessMode.In) THEN
				Track201.Speed := Speeds.SpeedSeamSlow;
			ELSE
				Track201.Speed := Speeds.SpeedSeam ;
			END_IF
			Track201.RunBlock := NOT(SeamersII.DoneOUT[2]) ;
			Track201.TimeoutEN := TRUE ;
			Track201.TimeoutACK := Warn.Ack ;
			Track201.TimeoutBlock := (Warn.Block) ;
			Track201.DelayPT := TrackDelayPT.PTTrack201 ;
			//FB CALL
			Track201 ();
			//FB OUTPUTS
			CS2.o.Run[0] := Track201.RunOUT ;
			CV2.o.Run[0] := Track201.RunOUT ;
			CC3.o.Run[0] := Track201.RunOUT ;
			CS2.Inv.Scale1.x := Track201.SpeedOUT ;
			CV2.Inv.Scale1.x := Track201.SpeedOUT ;
			CC3.Inv.Scale1.x := Track201.SpeedOUT ;
			Sol40Datum.Auto := (Track201.SolOUT) AND(Tracking94.Busy) ;
			Ax2.RaiseArms := (Track201.SolOUT) ;
			IF(Track201.Done) THEN
				Tracking20.IndexIN := 4 ;
				Tracking20.WidthIN := Ax2.Measure/10.0 ;
			END_IF
		2: //TRACK FROM S8Photo.Int (P) TO S8Photo.Int (N)
			Track201 := TrackClear ;
			Track203 := TrackClear ;
			Track204 := TrackClear ;
			Track205 := TrackClear ;
			Track206 := TrackClear ;
			Track207 := TrackClear ;
			Track208 := TrackClear ;
			//FB INPUTS
//			Track202.FixedIN := Tracking20.FixedOUT ;
//			IF (ProcessMode.In) THEN
//				Track202.Speed := Speeds.SpeedSeamSlow;
//			ELSE
//				Track202.Speed := Speeds.SpeedSeam ;
//			END_IF
//			Track202.RunBlock := NOT(SeamersII.DoneOUT[2]) ;
//			Track202.TimeoutEN := TRUE ;
//			Track202.TimeoutACK := Warn.Ack ;
//			Track202.TimeoutBlock := (Warn.Block) ;
//			Track202.DelayPT := TrackDelayPT.PTTrack202 ;
//			//FB CALL
//			Track202 ();
//			//FB OUTPUTS
//			CS2.o.Run[0] := Track202.RunOUT ;
//			CV2.o.Run[0] := Track202.RunOUT ;
//			CC3.o.Run[0] := Track202.RunOUT ;
//			CS2.Inv.Scale1.x := Track202.SpeedOUT ;
//			CV2.Inv.Scale1.x := Track202.SpeedOUT ;
//			CC3.Inv.Scale1.x := Track202.SpeedOUT ;
//			Sol40Datum.Auto := (Track202.SolOUT) AND(Tracking94.Busy) ;
//			Seaming.Start2 := (Track202.SolOUT) ;
//			Ax2.RaiseArms := (Track202.SolOUT) ;
//			IF(Track202.Done) THEN
//				Tracking20.IndexIN := 4 ;
//			END_IF
		3: //TRACK FROM S8Photo.Int (N) TO Belts2.Done (P)
			Track201 := TrackClear ;
			Track202 := TrackClear ;
			Track204 := TrackClear ;
			Track205 := TrackClear ;
			Track206 := TrackClear ;
			Track207 := TrackClear ;
			Track208 := TrackClear ;
			//FB INPUTS
//			Track203.FixedIN := Tracking20.FixedOUT ;
//			IF (ProcessMode.In) THEN
//				Track203.Speed := Speeds.SpeedSeamSlow;
//			ELSE
//				Track203.Speed := Speeds.SpeedSeam ;
//			END_IF
//			Track203.RunBlock := NOT(SeamersII.DoneOUT[2]) ;
//			//FB CALL
//			Track203 ();
//			//FB OUTPUTS
//			CS2.o.Run[0] := Track203.RunOUT ;
//			CV2.o.Run[0] := Track203.RunOUT ;
//			CC3.o.Run[0] := Track203.RunOUT ;
//			CS2.Inv.Scale1.x := Track203.SpeedOUT ;
//			CV2.Inv.Scale1.x := Track203.SpeedOUT ;
//			CC3.Inv.Scale1.x := Track203.SpeedOUT ;
//			Seaming.Stop2 := (Track203.SolOUT) ;
//			Ax2.RaiseArms := (Track203.SolOUT) ;
//			IF(Track203.Done) THEN
//				Tracking20.IndexIN := 4 ;
//				Tracking20.WidthIN := Ax2.Measure/10.0 ;
//			END_IF
		4: //TRACK FROM S12Photo.Int (P) TO S12Photo.Int (N)
			Track201 := TrackClear ;
			Track202 := TrackClear ;
			Track203 := TrackClear ;
			Track205 := TrackClear ;
			Track206 := TrackClear ;
			Track207 := TrackClear ;
			Track208 := TrackClear ;
			//FB INPUTS
			Track204.FixedIN := Tracking20.FixedOUT ;
			IF (ProcessMode.In) THEN
				Track204.Speed := Speeds.SpeedSeamSlow;
			ELSE
				Track204.Speed := Speeds.SpeedSeam ;
			END_IF
			Track204.TimeoutEN := TRUE ;
			Track204.TimeoutACK := Warn.Ack ;
			Track204.TimeoutBlock := (Warn.Block) ;
			Track204.DelayPT := TrackDelayPT.PTTrack204 ;
			//FB CALL
			Track204 ();
			//FB OUTPUTS
			CS2.o.Run[0] := Track204.RunOUT ;
			CV2.o.Run[0] := Track204.RunOUT ;
			CC3.o.Run[0] := Track204.RunOUT ;
			CS2.Inv.Scale1.x := Track204.SpeedOUT ;
			CV2.Inv.Scale1.x := Track204.SpeedOUT ;
			CC3.Inv.Scale1.x := Track204.SpeedOUT ;
			Ax2.RaiseArms := (Track204.SolOUT) ;
			IF(Track204.Done) THEN
				Tracking20.IndexIN := 5 ;
			END_IF
		5: //TRACK FROM S12Photo.Int (N) TO Track205.DelayTON.Q (P)
			Track201 := TrackClear ;
			Track202 := TrackClear ;
			Track203 := TrackClear ;
			Track204 := TrackClear ;
			Track206 := TrackClear ;
			Track207 := TrackClear ;
			Track208 := TrackClear ;
			//FB INPUTS
			Track205.FixedIN := Tracking20.FixedOUT ;
			Track205.Speed := Speeds.SpeedSlow ;
			Track205.TrackDelayEN := TRUE ;
			Track205.DelayPT := TrackDelayPT.PTTrack205 ;
			//FB CALL
			Track205 ();
			//FB OUTPUTS
			CC3.o.Run[0] := Track205.RunOUT ;
			CC3.Inv.Scale1.x := Track205.SpeedOUT ;
			IF(Track205.Done) THEN
				Tracking20.IndexIN := 6 ;
			END_IF
		6: //TRACK FROM Track205.DelayTON.Q (P) TO Track206.DelayTON.Q (P)
			Track201 := TrackClear ;
			Track202 := TrackClear ;
			Track203 := TrackClear ;
			Track204 := TrackClear ;
			Track205 := TrackClear ;
			Track207 := TrackClear ;
			Track208 := TrackClear ;
			//FB INPUTS
			Track206.FixedIN := Tracking20.FixedOUT ;
			Track206.Speed := Speeds.SpeedSlow ;
			Track206.TrackDelayEN := TRUE ;
			Track206.DelayPT := TrackDelayPT.PTTrack206 ;
			//FB CALL
			Track206 ();
			//FB OUTPUTS
			CC3.o.Rev[0] := Track206.RunOUT ;
			CC3.Inv.Scale1.x := Track206.SpeedOUT ;
			IF(Track206.Done) THEN
				Tracking20.IndexIN := 7 ;
			END_IF
		7: //TRACK FROM Track206.DelayTON.Q (P) TO S35Reed.In (P)
			Track201 := TrackClear ;
			Track202 := TrackClear ;
			Track203 := TrackClear ;
			Track204 := TrackClear ;
			Track205 := TrackClear ;
			Track206 := TrackClear ;
			Track208 := TrackClear ;
			//FB INPUTS
			Track207.FixedIN := Tracking20.FixedOUT ;
			Track207.TimeoutEN := TRUE ;
			Track207.TimeoutACK := Warn.Ack ;
			Track207.TimeoutBlock := (Warn.Block) ;
			Track207.DelayPT := TrackDelayPT.PTTrack207 ;
			//FB CALL
			Track207 ();
			//FB OUTPUTS
			Sol32Pal3.Auto := (Track207.SolOUT) ;
			IF(Track207.Done) THEN
				Tracking20.IndexIN := 8 ;
			END_IF
		8: //TRACK FROM S35Reed.In (P) TO NOT Tracking20.Blocked (-)
			Track201 := TrackClear ;
			Track202 := TrackClear ;
			Track203 := TrackClear ;
			Track204 := TrackClear ;
			Track205 := TrackClear ;
			Track206 := TrackClear ;
			Track207 := TrackClear ;
			//FB INPUTS
			Track208.FixedIN := Tracking20.FixedOUT ;
			//FB CALL
			Track208 ();
			//FB OUTPUTS
			Sol32Pal3.Auto := (Track208.SolOUT) ;
			IF(Track208.Done) THEN
				Tracking20.IndexIN := 0 ;
				Tracking30.IndexIN := 1 ;
				Tracking92.IndexIN := 1 ;
				Tracking30.LengthIN := Tracking20.Length ;
				Tracking30.WidthIN := Tracking20.Width ;
				Tracking30.RowBlockIN := Tracking20.RowBlock ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track201.DoneIN := EDGEPOS(S12Photo.Int) ;
//	Track202.DoneIN := EDGENEG(S8Photo.Int) ;
//	Track203.DoneIN := EDGEPOS(Belts2.Done) ;
	Track204.DoneIN := EDGENEG(S12Photo.Int) ;
	Track207.DoneIN := EDGEPOS(S35Reed.In) ;
	Track208.DoneIN := NOT(Tracking20.Blocked) ;

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking92.ControlIN := Control.Achieved1 ;
	Tracking92.EMOStart := EMO.StartLatch ;
	Tracking92.ESClear := Control.ESClear ;
	Tracking92 ();
	Tracking92.ResMan := FALSE ;
	CASE Tracking92.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track921 := TrackClear ;
			Track922 := TrackClear ;
		1: //TRACK FROM NOT Tracking20.Blocked (-) TO Track921.DelayTON.Q (P)
			Track922 := TrackClear ;
			//FB INPUTS
			Track921.FixedIN := Tracking92.FixedOUT ;
			Track921.RunBlock := (Track301.TimeoutOUT) OR(Track302.TimeoutOUT) ;
			Track921.Speed := Speeds.SpeedExit ;
			Track921.TrackDelayEN := TRUE ;
			Track921.DelayPT := TrackDelayPT.PTTrack921 ;
			//FB CALL
			Track921 ();
			//FB OUTPUTS
			CC4.o.Run[0] := Track921.RunOUT ;
			CC4.Inv.Scale1.x := Track921.SpeedOUT ;
			Sol32Pal3.Auto := (Track921.SolOUT) ;
			IF(Track921.Done) THEN
				Tracking92.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM Track521.DelayTON.Q (P) TO  NOT S13Photo.Int (-)
			Track921 := TrackClear ;
			//FB INPUTS
			Track922.FixedIN := Tracking92.FixedOUT ;
			Track922.RunBlock := (Track301.TimeoutOUT) OR(Track302.TimeoutOUT) OR((Track302.Active)AND(Tracking30.Blocked)) ;
			Track922.Speed := Speeds.SpeedExit ;
			//FB CALL
			Track922 ();
			//FB OUTPUTS
			CC4.o.Run[0] := Track922.RunOUT ;
			CC4.Inv.Scale1.x := Track922.SpeedOUT ;
			Sol32Pal3.Auto := (Track922.SolOUT) ;
			IF(Track922.Done) THEN
				Tracking92.IndexIN := 0 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track922.DoneIN := NOT(S13Photo.Int) ;

	//MANUAL RESET CONDITIONS FOR CONCURRENT TRACKBIT
	Tracking92.ResMan := Tracking30.ResMan ;
	IF(Tracking30.IndexIN = 0) THEN
		Tracking92.IndexIN := 0 ;
	END_IF

END_PROGRAM

(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * PROGRAM: ConCorner
 * File: ConCornerCyclic.st
 * Author: NickE
 ********************************************************************
 * Implementation OF PROGRAM ConCorner
 ********************************************************************)

PROGRAM _CYCLIC

   //TRACKINGSECTION END BLOCK CONDITIONS
	Tracking11.Blocks[0] := (Tracking20.Busy) ;
	Tracking11.Blocks[1] := (Track301.Active) ;
	Tracking11.Blocks[2] := (CS2.Input.Fault) OR(CV2.Input.Fault) ;
	Tracking11.Blocks[3] := (CC3.Input.Fault) ;
	Tracking11.Blocks[4] := (Sol32Pal3.Auto) ;
	Tracking11.Blocks[6] := NOT(SeamersII.DoneOUT[2]) ;
	Tracking11.Blocks[7] := NOT(ArmsTemp2.UpDone) ;
	Tracking11.Blocks[9] := (S8Photo.Int) ;
	Tracking11.Blocks[10] := (S12Photo.Int) ;
	Tracking11.Blocks[11] := (S35Reed.In) ;
	Tracking11.Blocks[12] := NOT(S53Reed.In) ;
	Tracking11.ControlIN := Control.Achieved1 ;
	Tracking11.EMOStart := EMO.StartLatch ;
	Tracking11.ESClear := Control.ESClear ;
	Tracking11.BlockInhib := (Track922.Active) AND NOT((Tracking11.Blocks[6]) OR(Tracking11.Blocks[7])) ;
	Tracking11 ();
	Tracking11.ResMan := FALSE ;
	//RESET OF OUTPUTS
	Ax2.Active := FALSE ;
	Ax2.RaiseArms := FALSE ;
	Sol40Datum.Auto := FALSE ;
	CASE Tracking11.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track111 := TrackClear ;
			Track112 := TrackClear ;
			Track113 := TrackClear ;
			Track114 := TrackClear ;
			Track115 := TrackClear ;
		1: //TRACK FROM NOT Tracking10.Blocked (P) TO S32Reed.In (P)
			Track112 := TrackClear ;
			Track113 := TrackClear ;
			Track114 := TrackClear ;
			Track115 := TrackClear ;
			//FB INPUTS
			Track111.FixedIN := Tracking11.FixedOUT ;
			Track111.TimeoutEN := TRUE ;
			Track111.TimeoutACK := Warn.Ack ;
			Track111.TimeoutBlock := (Warn.Block) ;
			Track111.DelayPT := TrackDelayPT.PTTrack111 ;
			//FB CALL
			Track111 ();
			//FB OUTPUTS
			IF(Track111.Done) THEN
				Tracking11.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM S32Reed.In (P) TO S6Photo.Int (P)
			Track111 := TrackClear ;
			Track113 := TrackClear ;
			Track114 := TrackClear ;
			Track115 := TrackClear ;
			//FB INPUTS
			Track112.FixedIN := Tracking11.FixedOUT ;
			Track112.Speed := Speeds.SpeedTrans ;
			Track112.TimeoutEN := TRUE ;
			Track112.TimeoutACK := Warn.Ack ;
			Track112.TimeoutBlock := (Warn.Block) ;
			Track112.DelayPT := TrackDelayPT.PTTrack112 ;
			//FB CALL
			Track112 ();
			//FB OUTPUTS
			CC2.o.Run[0] := Track112.RunOUT ;
			CC2.Inv.Scale1.x := Track112.SpeedOUT ;
			IF(Track112.Done) THEN
				Tracking11.IndexIN := 3 ;
			END_IF
		3: //TRACK FROM S6Photo.Int (P) TO S7Photo.Int (P)
			Track111 := TrackClear ;
			Track112 := TrackClear ;
			Track114 := TrackClear ;
			Track115 := TrackClear ;
			//FB INPUTS
			Track113.FixedIN := Tracking11.FixedOUT ;
			Track113.Speed := Speeds.SpeedSlow ;
			Track113.TimeoutEN := TRUE ;
			Track113.TimeoutACK := Warn.Ack ;
			Track113.TimeoutBlock := (Warn.Block) ;
			Track113.DelayPT := TrackDelayPT.PTTrack113 ;
			//FB CALL
			Track113 ();
			//FB OUTPUTS
			CC2.o.Run[0] := Track113.RunOUT ;
			CC2.Inv.Scale1.x := Track113.SpeedOUT ;
			IF(Track113.Done) THEN
				Tracking11.IndexIN := 4 ;
			END_IF
		4: //TRACK FROM S7Photo.Int (P) TO Ax2.SeekFin (P)
			Track111 := TrackClear ;
			Track112 := TrackClear ;
			Track113 := TrackClear ;
			Track115 := TrackClear ;
			//FB INPUTS
			Track114.FixedIN := Tracking11.FixedOUT ;
			//FB CALL
			Track114 ();
			//FB OUTPUTS
			IF NOT(Ax2.HiVol) THEN
				Ax2.Seek1 := (Track114.SolOUT) AND NOT(Ax2.Block) ;
			ELSE
				Tracking11.IndexIN := 5 ;
			END_IF
			IF(Track114.Done) THEN
				Tracking11.IndexIN := 5 ;
			END_IF
		5: //TRACK FROM Ax2.SeekFin (P) TO NOT Tracking11.Blocked (-)
			Track111 := TrackClear ;
			Track112 := TrackClear ;
			Track113 := TrackClear ;
			Track114 := TrackClear ;
			//FB INPUTS
			Track115.FixedIN := Tracking11.FixedOUT ;
			//FB CALL
			Track115 ();
			//FB OUTPUTS
			Sol40Datum.Auto := (Track115.SolOUT) ;
			Ax2.RaiseArms := (Track115.SolOUT) ;
			IF(Track115.Done) THEN
				Tracking11.IndexIN := 0 ;
				Tracking20.IndexIN := 1 ;
				Tracking94.IndexIN := 1 ;
				Tracking20.LengthIN := Tracking11.Length ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track111.DoneIN := EDGEPOS(S32Reed.In) ;
	Track112.DoneIN := EDGEPOS(S6Photo.Int) ;
	Track113.DoneIN := EDGEPOS(S7Photo.Int) ;
	Track114.DoneIN := EDGEPOS(Ax2.SeekFin) ;
	Track115.DoneIN := NOT(Tracking11.Blocked) ;

	Ax2.Active := Track114.Active ;

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking94.ControlIN := Control.Achieved1 ;
	Tracking94.EMOStart := EMO.StartLatch ;
	Tracking94.ESClear := Control.ESClear ;
	Tracking94 ();
	Tracking94.ResMan := FALSE ;
	CASE Tracking94.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track941 := TrackClear ;
		1: //TRACK FROM NOT Tracking11.Blocked (-) TO S7Photo.Int (N)
			//FB INPUTS
			Track941.FixedIN := Tracking94.FixedOUT ;
			Track941.RunBlock := (Track201.TimeoutOUT) OR(Track202.TimeoutOUT) OR NOT((Track201.RunOUT) OR(Track202.RunOUT)) ;
			IF (ProcessMode.In) THEN
				Track941.Speed := Speeds.SpeedSeamSlow;
			ELSE
				Track941.Speed := Speeds.SpeedSeam ;
			END_IF
			//FB CALL
			Track941 ();
			//FB OUTPUTS
			CC2.o.Run[0] := Track941.RunOUT ;
			CC2.Inv.Scale1.x := Track941.SpeedOUT ;
			IF(Track941.Done) THEN
				Tracking94.IndexIN := 0 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track941.DoneIN := EDGENEG(S7Photo.Int) ;

	//MANUAL RESET CONDITIONS FOR CONCURRENT TRACKBIT
	Tracking94.ResMan := Tracking20.ResMan ;
	IF(Tracking20.IndexIN = 0) THEN
		Tracking94.IndexIN := 0 ;
	END_IF

END_PROGRAM

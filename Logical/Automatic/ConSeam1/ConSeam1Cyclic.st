(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * PROGRAM: ConSeam1
 * File: ConSeam1Cyclic.st
 * Author: nicke
 ********************************************************************
 * Implementation OF PROGRAM ConSeam1
 ********************************************************************)

PROGRAM _CYCLIC

   //TRACKINGSECTION END BLOCK CONDITIONS
	Tracking10.Blocks[0] := (Tracking11.Busy) ;
	Tracking10.Blocks[1] := (Tracking91.Busy) ;
	Tracking10.Blocks[2] := (CC2.Input.Fault) ;
	Tracking10.Blocks[3] := (CS2.Input.Fault) OR(CV2.Input.Fault) ;
	Tracking10.Blocks[9] := (S5Photo.Int) ;
	Tracking10.Blocks[10] := (S6Photo.Int) ;
	Tracking10.Blocks[11] := (S7Photo.Int) ;
	Tracking10.ControlIN := Control.Achieved1 ;
	Tracking10.EMOStart := EMO.StartLatch ;
	Tracking10.ESClear := Control.ESClear ;
	Tracking10 ();
	Tracking10.ResMan := FALSE ;
	//RESET OF OUTPUTS
	Seaming.Start1 := FALSE ;
	Seaming.Stop1 := FALSE ;
	Sol24DG1.Auto := TRUE ;
	Sol24DG1B.Auto := FALSE ;
	Sol31Pal2.Auto := TRUE ;
	CASE Tracking10.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track101 := TrackClear ;
			Track102 := TrackClear ;
			Track103 := TrackClear ;
			Track104 := TrackClear ;
			Track105 := TrackClear ;
			Track106 := TrackClear ;
			Track107 := TrackClear ;
			Track108 := TrackClear ;
		1: //TRACK FROM NOT Tracking00.Blocked (-) TO S4Photo.Int (P)
			Track102 := TrackClear ;
			Track103 := TrackClear ;
			Track104 := TrackClear ;
			Track105 := TrackClear ;
			Track106 := TrackClear ;
			Track107 := TrackClear ;
			Track108 := TrackClear ;
			//FB INPUTS
			Track101.FixedIN := Tracking10.FixedOUT ;
			IF (ProcessMode.In) THEN
				Track101.Speed := Speeds.SpeedSeamSlow;
			ELSE
				Track101.Speed := Speeds.SpeedSeam ;
			END_IF
			Track101.RunBlock := NOT(SeamersII.DoneOUT[1]) ;
			Track101.TimeoutEN := TRUE ;
			Track101.TimeoutACK := Warn.Ack ;
			Track101.TimeoutBlock := (Warn.Block) ;
			Track101.DelayPT := TrackDelayPT.PTTrack101 ;
			//FB CALL
			Track101 ();
			//FB OUTPUTS
			CS1.o.Run[0] := Track101.RunOUT ;
			CV1.o.Run[0] := Track101.RunOUT ;
			CC1.o.Run[0] := Track101.RunOUT ;
			CS1.Inv.Scale1.x := Track101.SpeedOUT ;
			CV1.Inv.Scale1.x := Track101.SpeedOUT ;
			CC1.Inv.Scale1.x := Track101.SpeedOUT ;
			Ax1.RaiseArms := (Track101.SolOUT) ;
			IF(Track101.Done) THEN
				Tracking10.IndexIN := 4 ;
				Tracking10.LengthIN := Ax1.Measure/10.0 ;
			END_IF
		2: //TRACK FROM S3Photo.Int (P) TO S3Photo.Int (N)
			Track101 := TrackClear ;
			Track103 := TrackClear ;
			Track104 := TrackClear ;
			Track105 := TrackClear ;
			Track106 := TrackClear ;
			Track107 := TrackClear ;
			Track108 := TrackClear ;
			//FB INPUTS
//			Track102.FixedIN := Tracking10.FixedOUT ;
//			IF (ProcessMode.In) THEN
//				Track102.Speed := Speeds.SpeedSeamSlow;
//			ELSE
//				Track102.Speed := Speeds.SpeedSeam ;
//			END_IF
//			Track102.RunBlock := NOT(SeamersII.DoneOUT[1]) ;
//			Track102.TimeoutEN := TRUE ;
//			Track102.TimeoutACK := Warn.Ack ;
//			Track102.TimeoutBlock := (Warn.Block) ;
//			Track102.DelayPT := TrackDelayPT.PTTrack102 ;
//			//FB CALL
//			Track102 ();
//			//FB OUTPUTS
//			CS1.o.Run[0] := Track102.RunOUT ;
//			CV1.o.Run[0] := Track102.RunOUT ;
//			CC1.o.Run[0] := Track102.RunOUT ;
//			CS1.Inv.Scale1.x := Track102.SpeedOUT ;
//			CV1.Inv.Scale1.x := Track102.SpeedOUT ;
//			CC1.Inv.Scale1.x := Track102.SpeedOUT ;
//			Seaming.Start1 := (Track102.SolOUT) ;
//			Ax1.RaiseArms := (Track102.SolOUT) ;
//			IF(Track102.Done) THEN
//				Tracking10.IndexIN := 3 ;
//			END_IF
		3: //TRACK FROM S3Photo.Int (N) TO Belts1.Done (P)
			Track101 := TrackClear ;
			Track102 := TrackClear ;
			Track104 := TrackClear ;
			Track105 := TrackClear ;
			Track106 := TrackClear ;
			Track107 := TrackClear ;
			Track108 := TrackClear ;
			//FB INPUTS
//			Track103.FixedIN := Tracking10.FixedOUT ;
//			IF (ProcessMode.In) THEN
//				Track103.Speed := Speeds.SpeedSeamSlow;
//			ELSE
//				Track103.Speed := Speeds.SpeedSeam ;
//			END_IF
//			Track103.RunBlock := NOT(SeamersII.DoneOUT[1]) ;
//			//FB CALL
//			Track103 ();
//			//FB OUTPUTS
//			CS1.o.Run[0] := Track103.RunOUT ;
//			CV1.o.Run[0] := Track103.RunOUT ;
//			CC1.o.Run[0] := Track103.RunOUT ;
//			CS1.Inv.Scale1.x := Track103.SpeedOUT ;
//			CV1.Inv.Scale1.x := Track103.SpeedOUT ;
//			CC1.Inv.Scale1.x := Track103.SpeedOUT ;
//			Seaming.Stop1 := (Track103.SolOUT) ;
//			Ax1.RaiseArms := (Track103.SolOUT) ;
//			IF(Track103.Done) THEN
//				Tracking10.IndexIN := 4 ;
//				Tracking10.LengthIN := Ax1.Measure/10.0 ;
//			END_IF
		4: //TRACK FROM S4Photo.int (P) TO S4Photo.Int (N)
			Track101 := TrackClear ;
			Track102 := TrackClear ;
			Track103 := TrackClear ;
			Track105 := TrackClear ;
			Track106 := TrackClear ;
			Track107 := TrackClear ;
			Track108 := TrackClear ;
			//FB INPUTS
			Track104.FixedIN := Tracking10.FixedOUT ;
			Track104.Speed := Speeds.SpeedTrans ;
			Track104.TimeoutEN := TRUE ;
			Track104.TimeoutACK := Warn.Ack ;
			Track104.TimeoutBlock := (Warn.Block) ;
			Track104.DelayPT := TrackDelayPT.PTTrack104 ;
			//FB CALL
			Track104 ();
			//FB OUTPUTS
			CS1.o.Run[0] := Track104.RunOUT ;
			CV1.o.Run[0] := Track104.RunOUT ;
			CC1.o.Run[0] := Track104.RunOUT ;
			CS1.Inv.Scale1.x := Track104.SpeedOUT ;
			CV1.Inv.Scale1.x := Track104.SpeedOUT ;
			CC1.Inv.Scale1.x := Track104.SpeedOUT ;
			Ax1.RaiseArms := (Track104.SolOUT) ;
			IF(Track104.Done) THEN
				Tracking10.IndexIN := 5 ;
			END_IF
		5: //TRACK FROM S4Photo.Int (N) TO Track105.DelayTON.Q (P)
			Track101 := TrackClear ;
			Track102 := TrackClear ;
			Track103 := TrackClear ;
			Track104 := TrackClear ;
			Track106 := TrackClear ;
			Track107 := TrackClear ;
			Track108 := TrackClear ;
			//FB INPUTS
			Track105.FixedIN := Tracking10.FixedOUT ;
			Track105.Speed := Speeds.SpeedSlow ;
			Track105.TrackDelayEN := TRUE ;
			Track105.DelayPT := TrackDelayPT.PTTrack105 ;
			//FB CALL
			Track105 ();
			//FB OUTPUTS
			CC1.o.Run[0] := Track105.RunOUT ;
			CC1.Inv.Scale1.x := Track105.SpeedOUT ;
			IF(Track105.Done) THEN
				Tracking10.IndexIN := 6 ;
			END_IF
		6: //TRACK FROM Track105.DelayTON.Q (P) TO S50Reed.In (P)
			Track101 := TrackClear ;
			Track102 := TrackClear ;
			Track103 := TrackClear ;
			Track104 := TrackClear ;
			Track105 := TrackClear ;
			Track107 := TrackClear ;
			Track108 := TrackClear ;
			//FB INPUTS
			Track106.FixedIN := Tracking10.FixedOUT ;
			Track106.TimeoutEN := TRUE ;
			Track106.TimeoutACK := Warn.Ack ;
			Track106.TimeoutBlock := (Warn.Block) ;
			Track106.DelayPT := TrackDelayPT.PTTrack106 ;
			//FB CALL
			Track106 ();
			//FB OUTPUTS
			Sol24DG1B.Auto := (Track106.SolOUT) ;
			IF(Track106.Done) THEN
				Tracking10.IndexIN := 7 ;
			END_IF
		7: //TRACK FROM S50Reed.In (P) TO Track107.DelayTON.Q (P)
			Track101 := TrackClear ;
			Track102 := TrackClear ;
			Track103 := TrackClear ;
			Track104 := TrackClear ;
			Track105 := TrackClear ;
			Track106 := TrackClear ;
			Track108 := TrackClear ;
			//FB INPUTS
			Track107.FixedIN := Tracking10.FixedOUT ;
			Track107.Speed := Speeds.SpeedSlow ;
			Track107.TrackDelayEN := TRUE ;
			Track107.DelayPT := TrackDelayPT.PTTrack107 ;
			//FB CALL
			Track107 ();
			//FB OUTPUTS
			CC1.o.Rev[0] := Track107.RunOUT ;
			CC1.Inv.Scale1.x := Track107.SpeedOUT ;
			Sol24DG1B.Auto := (Track107.SolOUT) ;
			IF(Track107.Done) THEN
				Tracking10.IndexIN := 8 ;
			END_IF
		8: //TRACK FROM Track107.DelayTON.Q (P) TO NOT Tracking10.Blocked (-)
			Track101 := TrackClear ;
			Track102 := TrackClear ;
			Track103 := TrackClear ;
			Track104 := TrackClear ;
			Track105 := TrackClear ;
			Track106 := TrackClear ;
			Track107 := TrackClear ;
			//FB INPUTS
			Track108.FixedIN := Tracking10.FixedOUT ;
			//FB CALL
			Track108 ();
			//FB OUTPUTS
			Sol24DG1B.Auto := (Track108.SolOUT) ;
			IF(Track108.Done) THEN
				Tracking10.IndexIN := 0 ;
				Tracking11.IndexIN := 1 ;
				Tracking91.IndexIN := 1 ;
				Tracking11.LengthIN := Tracking10.Length ;
				Tracking11.RowBlockIN := Tracking10.RowBlock ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track101.DoneIN := EDGEPOS(S4Photo.Int) ;
//	Track102.DoneIN := EDGENEG(S3Photo.Int) ;
//	Track103.DoneIN := EDGEPOS(Belts1.Done) ;
	Track104.DoneIN := EDGENEG(S4Photo.Int) ;
	Track106.DoneIN := EDGEPOS(S50Reed.In) ;
	Track108.DoneIN := NOT(Tracking10.Blocked) ;

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking91.ControlIN := Control.Achieved1 ;
	Tracking91.EMOStart := EMO.StartLatch ;
	Tracking91.ESClear := Control.ESClear ;
	Tracking91 ();
	Tracking91.ResMan := FALSE ;
	CASE Tracking91.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track911 := TrackClear ;
			Track912 := TrackClear ;
		1: //TRACK FROM NOT Tracking11.Blocked (-) TO NOT S9Photo.Int (-)
			Track912 := TrackClear ;
			//FB INPUTS
			Track911.FixedIN := Tracking91.FixedOUT ;
			//FB CALL
			Track911 ();
			//FB OUTPUTS
			Sol24DG1.Auto := NOT(Track911.SolOUT) ;
			Sol24DG1B.Auto := (Track911.SolOUT) ;
			Sol31Pal2.Auto := NOT(Track911.SolOUT) ;
			IF(Track911.Done) THEN
				Tracking91.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM NOT S9Photo.Int (-) TO S5Photo.Int (N)
			Track911 := TrackClear ;
			//FB INPUTS
			Track912.FixedIN := Tracking91.FixedOUT ;
			//FB CALL
			Track912 ();
			//FB OUTPUTS
			Sol24DG1.Auto := NOT(Track912.SolOUT) ;
			Sol24DG1B.Auto := (Track912.SolOUT) ;
			Sol31Pal2.Auto := NOT(Track912.SolOUT) ;
			IF(Track912.Done) THEN
				Tracking91.IndexIN := 0 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track911.DoneIN := NOT(S9Photo.Int) ;
	Track912.DoneIN := EDGENEG(S5Photo.Int) ;

	//MANUAL RESET CONDITIONS FOR CONCURRENT TRACKBIT
	Tracking91.ResMan := (Tracking11.ResMan) OR((Tracking20.ResMan) AND((Track201.Active) OR(Track202.Active))) ;
	IF(Tracking11.IndexIN = 0) AND NOT((Track201.Active) OR(Track202.Active)) THEN
		Tracking91.IndexIN := 0 ;
	END_IF

END_PROGRAM

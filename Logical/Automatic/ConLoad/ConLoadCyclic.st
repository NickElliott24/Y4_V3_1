(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ConLoad
 * File: ConLoadCyclic.st
 * Author: nicke
 ********************************************************************
 * Implementation of program ConLoad
 ********************************************************************)

PROGRAM _CYCLIC

   //TRACKINGSECTION END BLOCK CONDITIONS
	Tracking00.Blocks[0] := (Tracking10.Busy) ;
	Tracking00.Blocks[1] := ((Track011.Active) OR(Track012.Active)) AND(S56Lever.In) ;
	Tracking00.Blocks[2] := (CS1.Input.Fault) OR(CV1.Input.Fault) ;
	Tracking00.Blocks[3] := (CC1.Input.Fault) ;
	Tracking00.Blocks[4] := NOT(Sol31Pal2.Auto) ;
	Tracking00.Blocks[5] := NOT(Sol24DG1.Auto) ;
	Tracking00.Blocks[6] := NOT(SeamersII.DoneOUT[1]) ;
	Tracking00.Blocks[7] := NOT(ArmsTemp1.UpDone) ;
	Tracking00.Blocks[9] := (S3Photo.Int) ;
	Tracking00.Blocks[10] := (S4Photo.Int) ;
	Tracking00.Blocks[11] := NOT(S33Reed.In) ;
	Tracking00.Blocks[12] := (S50Reed.In) ;
	Tracking00.ControlIN := Control.Achieved1 ;
	Tracking00.EMOStart := EMO.StartLatch ;
	Tracking00.ESClear := Control.ESClear ;
	//Tracking00.BlockInhib := (Track912.Active) AND(S32Reed.In) AND NOT((Tracking00.Blocks[6]) OR(Tracking00.Blocks[7])) ;
	Tracking00 ();
	Tracking00.ResMan := FALSE ;
	//RESET OF OUTPUTS
	Sol30Pal1.Auto := FALSE ;
	Sol40Datum.Auto := FALSE ;
	Ax1.RaiseArms := FALSE ;
	CASE Tracking00.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track001 := TrackClear ;
			Track002 := TrackClear ;
			Track003 := TrackClear ;
			Track004 := TrackClear ;
			Track005 := TrackClear ;
			//START CONDITION FOR LOADING
			IF((S45Foot.In) AND(S30Reed.In) AND NOT(Tracking90.Busy) AND(Control.Achieved1)) THEN
				Tracking00.IndexIN := 1 ;
			END_IF
		1: //TRACK FROM S45Foot.In (P) TO S31Reed.In (P)
			Track002 := TrackClear ;
			Track003 := TrackClear ;
			Track004 := TrackClear ;
			Track005 := TrackClear ;
			//FB INPUTS
			Track001.FixedIN := Tracking00.FixedOUT ;
			Track001.TimeoutEN := TRUE ;
			Track001.TimeoutACK := Warn.Ack ;
			Track001.TimeoutBlock := (Warn.Block) ;
			Track001.DelayPT := TrackDelayPT.PTTrack001 ;
			//FB CALL
			Track001 ();
			//FB OUTPUTS
			Sol30Pal1.Auto := (Track001.SolOUT) ;
			IF(Track001.Done) THEN
				Tracking00.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM S31Reed.In (P) TO S1Photo.Int (P)
			Track001 := TrackClear ;
			Track003 := TrackClear ;
			Track004 := TrackClear ;
			Track005 := TrackClear ;
			//FB INPUTS
			Track002.FixedIN := Tracking00.FixedOUT ;
			Track002.Speed := Speeds.SpeedTrans ;
			Track002.TimeoutEN := TRUE ;
			Track002.DelayPT := TrackDelayPT.PTTrack002 ;
			//FB CALL
			Track002 ();
			//FB OUTPUTS
			CL1.o.Run[0] := Track002.RunOUT ;
			CL1.Inv.Scale1.x := Track002.SpeedOUT ;
			Sol30Pal1.Auto := (Track002.SolOUT) ;
			IF(Track002.TimeoutOUT) THEN
				Tracking00.IndexIN := 0 ;
			END_IF
			IF(Track002.Done) THEN
				Tracking00.IndexIN := 3 ;
				Tracking00.RowBlockIN := FurnaceSelect.In; //Input for Furnace 2 selection
			END_IF
		3: //TRACK FROM S1Photo.Int (P) TO S2Photo.Int (P)
			Track001 := TrackClear ;
			Track002 := TrackClear ;
			Track004 := TrackClear ;
			Track005 := TrackClear ;
			//FB INPUTS
			Track003.FixedIN := Tracking00.FixedOUT ;
			IF(S56Lever.In) THEN
				Track003.Speed := Speeds.SpeedLaser ;
			ELSE
				Track003.Speed := Speeds.SpeedSlow ;
			END_IF
			Track003.TimeoutEN := TRUE ;
			Track003.TimeoutACK := Warn.Ack ;
			Track003.TimeoutBlock := (Warn.Block) ;
			Track003.DelayPT := TrackDelayPT.PTTrack003 ;
			//FB CALL
			Track003 ();
			//FB OUTPUTS
			CL1.o.Run[0] := Track003.RunOUT ;
			CL1.Inv.Scale1.x := Track003.SpeedOUT ;
			Sol30Pal1.Auto := (Track003.SolOUT) ;
			IF(Track003.Done) THEN
				Tracking00.IndexIN := 4 ;
				IF(S56Lever.In) THEN
					Tracking01.IndexIN := 1 ;
				END_IF
			END_IF
		4: //TRACK FROM S2Photo.Int (P) TO Ax1.SeekFin (P)
			Track001 := TrackClear ;
			Track002 := TrackClear ;
			Track003 := TrackClear ;
			Track005 := TrackClear ;
			//FB INPUTS
			Track004.FixedIN := Tracking00.FixedOUT ;
			//FB CALL
			Track004 ();
			//FB OUTPUTS
			Sol30Pal1.Auto := (Track004.SolOUT) ;
			IF NOT(Ax1.HiVol) THEN
				Ax1.Seek1 := (Track004.SolOUT) AND NOT(Ax1.Block) ;
			ELSE
				Tracking00.IndexIN := 5 ;
			END_IF
			IF(Track004.Done) THEN
				Tracking00.IndexIN := 5 ;
			END_IF
		5: //TRACK FROM Ax1.SeekFin (P) TO NOT Tracking00.Blocked (-)
			Track001 := TrackClear ;
			Track002 := TrackClear ;
			Track003 := TrackClear ;
			Track004 := TrackClear ;
			//FB INPUTS
			Track005.FixedIN := Tracking00.FixedOUT ;
			//FB CALL
			Track005 ();
			//FB OUTPUTS
			Sol30Pal1.Auto := (Track005.SolOUT) ;
			Ax1.RaiseArms := (Track005.SolOUT) ;
			IF(Track005.Done) THEN
				Tracking00.IndexIN := 0 ;
				Tracking10.IndexIN := 1 ;
				Tracking10.RowBlockIN := Tracking00.RowBlock ;
				Tracking90.IndexIN := 1 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track001.DoneIN := EDGEPOS(S31Reed.In) ;
	Track002.DoneIN := EDGEPOS(S1Photo.Int) ;
	Track003.DoneIN := EDGEPOS(S2Photo.Int) ;
	Track004.DoneIN := EDGEPOS(Ax1.SeekFin) ;
	Track005.DoneIN := NOT(Tracking00.Blocked) ;

	Ax1.Active := Track004.Active ;

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking90.ControlIN := Control.Achieved1 ;
	Tracking90.EMOStart := EMO.StartLatch ;
	Tracking90.ESClear := Control.ESClear ;
	Tracking90 ();
	Tracking90.ResMan := FALSE ;
	CASE Tracking90.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track901 := TrackClear ;
		1: //TRACK FROM NOT Tracking00.Blocked (-) TO S2Photo.Int (N)
			//FB INPUTS
			Track901.FixedIN := Tracking90.FixedOUT ;
			Track901.RunBlock := (Track101.TimeoutOUT) OR(Track102.TimeoutOUT) OR NOT((Track101.RunOUT) OR(Track102.RunOUT)) ;
			IF (ProcessMode.In) THEN
				Track901.Speed := Speeds.SpeedSeamSlow;
			ELSE
				Track901.Speed := Speeds.SpeedSeam ;
			END_IF
			//FB CALL
			Track901 ();
			//FB OUTPUTS
			CL1.o.Run[0] := Track901.RunOUT ;
			CL1.Inv.Scale1.x := Track901.SpeedOUT ;
			Sol30Pal1.Auto := (Track901.SolOUT) ;
			IF(Track901.Done) THEN
				Tracking90.IndexIN := 0 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track901.DoneIN := EDGENEG(S2Photo.Int) ;

	//MANUAL RESET CONDITIONS FOR CONCURRENT TRACKBIT
	Tracking90.ResMan := Tracking10.ResMan ;
	IF(Tracking10.IndexIN = 0) THEN
		Tracking90.IndexIN := 0 ;
	END_IF

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking01.Blocks[1] := Track005.Active ;
	Tracking01.ControlIN := Control.Achieved1 ;
	Tracking01.EMOStart := EMO.StartLatch ;
	Tracking01.ESClear := Control.ESClear ;
	Tracking01 ();
	Tracking01.ResMan := FALSE ;
	//RESET OF OUTPUTS
	LaserFire.Auto := FALSE ;
	Sol35Laser.Auto := Control.Achieved1 ;
	CASE Tracking01.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track011 := TrackClear ;
			Track012 := TrackClear ;
			Track013 := TrackClear ;
		1: //TRACK FROM S2Photo.Int (P) TO Track011.DelayTON.Q (-)
			Track012 := TrackClear ;
			Track013 := TrackClear ;
			//FB INPUTS
			Track011.FixedIN := Tracking01.FixedOUT ;
			Track011.TrackDelayEN := TRUE ;
			Track011.DelayPT := TrackDelayPT.PTTrack011 ;
			//FB CALL
			Track011 ();
			//FB OUTPUTS
			IF(Track011.Done) THEN
				Tracking01.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM Track011.DelayTON.Q (-) TO LaserBusy.In (N)
			Track011 := TrackClear ;
			Track013 := TrackClear ;
			//FB INPUTS
			Track012.FixedIN := Tracking01.FixedOUT ;
			Track012.DelayPT := 1200 ;
			//FB CALL
			Track012 ();
			//FB OUTPUTS
			LaserFire.Auto := (Track012.SolOUT) ;
			IF(Track012.Done) THEN
				Tracking01.IndexIN := 3 ;
			END_IF
			IF(Track012.TimeoutOUT) THEN
				Tracking01.IndexIN := 3 ;
			END_IF
		3: //TRACK FROM LaserBusy.In (N) TO NOT Tracking01.Blocked (-)
			Track011 := TrackClear ;
			Track012 := TrackClear ;
			//FB INPUTS
			Track013.FixedIN := Tracking01.FixedOUT ;
			//FB CALL
			Track013 ();
			//FB OUTPUTS
			IF(Track013.Done) THEN
				Tracking01.IndexIN := 0 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	//Track012.DoneIN := EDGENEG(LaserBusy.In) ;
	IF EDGENEG(LaserBusy.In) AND(Track012.Active) THEN
		Track012.TimeoutEN := TRUE ;
	END_IF
	Track013.DoneIN := NOT(Tracking01.Blocked) ;

	//MANUAL RESET CONDITIONS FOR CONCURRENT TRACKBIT
	Tracking01.ResMan := FALSE ;
	IF(Tracking00.IndexIN = 0) THEN
		IF(Tracking10.ResMan) THEN
			Tracking01.ResMan := TRUE ;
		END_IF
	END_IF
	IF EDGENEG(S56Lever.In) THEN
		Tracking01.ResMan := TRUE ;
	END_IF

END_PROGRAM

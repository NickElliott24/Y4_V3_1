(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ConRowBuild
 * File: ConRowBuildCyclic.st
 * Author: nicke
 ********************************************************************
 * Implementation of program ConRowBuild
 ********************************************************************)

PROGRAM _CYCLIC

   //TRACKINGSECTION END BLOCK CONDITIONS
	Tracking50.Blocks[0] := (Tracking60.Index > 1) ;
	Tracking50.Blocks[1] := Tracking70.Busy ;
	Tracking50.Blocks[2] := (CRE.Input.Fault) ;
	Tracking50.Blocks[3] := (CLB.Input.Fault) ;
	Tracking50.Blocks[9] := (S19Photo.Int) ;
//	Tracking50.Blocks[10] := (S20Photo.Int) ;
	Tracking50.Blocks[11] := (S21Photo.Int) ;
	Tracking50.ControlIN := Control.Achieved1 ;
	Tracking50.EMOStart := EMO.StartLatch ;
	Tracking50.ESClear := Control.ESClear ;
	Tracking50 ();
	IF(Tracking50.ResMan) OR(Tracking50.ResES) THEN
		Rows.Tracking50 := Rows.Empty ;
	END_IF
	Tracking50.ResMan := FALSE ;
	//RESET OF OUTPUTS
	Sol33Pal4.Auto := TRUE ;
	CASE Tracking50.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track501 := TrackClear ;
			Track502 := TrackClear ;
			Track503 := TrackClear ;
			Track504 := TrackClear ;
			Track505 := TrackClear ;
			Track506 := TrackClear ;
			Track507 := TrackClear ;
		1: //TRACK FROM S17Photo.Int (N) TO RowTemp.Done (P)
			Track502 := TrackClear ;
			Track503 := TrackClear ;
			Track504 := TrackClear ;
			Track505 := TrackClear ;
			Track506 := TrackClear ;
			Track507 := TrackClear ;
			//FB INPUTS
			Track501.FixedIN := Tracking50.FixedOUT ;
			//FB CALL
			Track501 ();
			//FB OUTPUTS
			IF(Track501.Done) THEN
				Tracking50.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM RowTemp.Done (P) TO Track502.DelayTON.Q (P)
			Track501 := TrackClear ;
			Track503 := TrackClear ;
			Track504 := TrackClear ;
			Track505 := TrackClear ;
			Track506 := TrackClear ;
			Track507 := TrackClear ;
			//FB INPUTS
			Track502.FixedIN := Tracking50.FixedOUT ;
			Track502.Speed := Speeds.SpeedCntr ;
			Track502.TrackDelayEN := TRUE ;
			Track502.DelayPT := TrackDelayPT.PTTrack502 ;
			//FB CALL
			Track502 ();
			//FB OUTPUTS
			CRB.o.Run[0] := Track502.RunOUT ;
			CRB.Inv.Scale1.x := Track502.SpeedOUT ;
			IF(S18Photo.Int) THEN
				Track502.DoneIN := TRUE ;
			END_IF
			IF(Track502.Done) THEN
				IF NOT(Tracking50.RowBlock)THEN // Furnace 1
					Tracking50.IndexIN := 3 ;
				ELSE // Furnace 2
					Tracking50.IndexIN := 0 ;
					Tracking52.IndexIN := 3 ;
					Tracking52.LengthIN := Tracking50.Length ;
				END_IF
			END_IF
		3: //TRACK FROM Track502.DelayTON.Q (P) TO S36Reed.In (P)
			Track501 := TrackClear ;
			Track502 := TrackClear ;
			Track504 := TrackClear ;
			Track505 := TrackClear ;
			Track506 := TrackClear ;
			Track507 := TrackClear ;
			//FB INPUTS
			Track503.FixedIN := Tracking50.FixedOUT ;
			Track503.SolBlock := (Tracking50.Blocked) ;
			Track503.TimeoutEN := TRUE ;
			Track503.TimeoutACK := Warn.Ack ;
			Track503.TimeoutBlock := (Warn.Block) ;
			Track503.DelayPT := TrackDelayPT.PTTrack503 ;
			//FB CALL
			Track503 ();
			//FB OUTPUTS
			Sol33Pal4.Auto := NOT(Track503.SolOUT) ;
			IF(Track503.Done) THEN
				Tracking50.IndexIN := 4 ;
			END_IF
		4: //TRACK FROM S36Reed.In (P) TO S19Photo.Int (P)
			Track501 := TrackClear ;
			Track502 := TrackClear ;
			Track503 := TrackClear ;
			Track505 := TrackClear ;
			Track506 := TrackClear ;
			Track507 := TrackClear ;
			//FB INPUTS
			Track504.FixedIN := Tracking50.FixedOUT ;
			Track504.Speed := Speeds.SpeedBatch ;
			Track504.TimeoutEN := TRUE ;
			Track504.TimeoutACK := Warn.Ack ;
			Track504.TimeoutBlock := (Warn.Block) ;
			Track504.DelayPT := TrackDelayPT.PTTrack504 ;
			//FB CALL
			Track504 ();
			//FB OUTPUTS
			CRE.o.Run[0] := Track504.RunOUT ;
			CRE.Inv.Scale1.x := Track504.SpeedOUT ;
			Sol33Pal4.Auto := NOT(Track504.SolOUT) ;
			IF(Track504.Done) THEN
				Tracking50.IndexIN := 5 ;
			END_IF
		5: //TRACK FROM S19Photo.Int (P) TO Track505.DelayTON.Q (N)
			Track501 := TrackClear ;
			Track502 := TrackClear ;
			Track503 := TrackClear ;
			Track504 := TrackClear ;
			Track506 := TrackClear ;
			Track507 := TrackClear ;
			//FB INPUTS
			Track505.FixedIN := Tracking50.FixedOUT ;
			Track505.Speed := Speeds.SpeedBatch ;
			Track505.TrackDelayEN := TRUE ;
			Track505.DelayPT := TrackDelayPT.PTTrack505 ;
			//FB CALL
			Track505 ();
			//FB OUTPUTS
			CRE.o.Run[0] := Track505.RunOUT ;
			CRE.Inv.Scale1.x := Track505.SpeedOUT ;
			Sol33Pal4.Auto := NOT(Track505.SolOUT) ;
			IF(Track505.Done) THEN
				Tracking50.IndexIN := 6 ;
			END_IF
		6: //TRACK FROM Track505.DelayTON.Q (P) TO S19Photo.Int (N)
			Track501 := TrackClear ;
			Track502 := TrackClear ;
			Track503 := TrackClear ;
			Track504 := TrackClear ;
			Track505 := TrackClear ;
			Track507 := TrackClear ;
			//FB INPUTS
			Track506.FixedIN := Tracking50.FixedOUT ;
			Track506.Speed := Speeds.SpeedBatch ;
			Track506.TimeoutEN := TRUE ;
			Track506.TimeoutACK := Warn.Ack ;
			Track506.TimeoutBlock := (Warn.Block) ;
			Track506.DelayPT := TrackDelayPT.PTTrack506 ;
			//FB CALL
			Track506 ();
			//FB OUTPUTS
			CRE.o.Run[0] := Track506.RunOUT ;
			CLB.o.Run[0] := Track506.RunOUT ;
			CRE.Inv.Scale1.x := Track506.SpeedOUT ;
			CLB.Inv.Scale1.x := Track506.SpeedOUT ;
			Sol33Pal4.Auto := NOT(Track506.SolOUT) ;
			IF(Track506.Done) THEN
				Tracking50.IndexIN := 7 ;
			END_IF
		7: //TRACK FROM S19Photo.Int (N) TO Track507.DelayTON.Q (P)
			Track501 := TrackClear ;
			Track502 := TrackClear ;
			Track503 := TrackClear ;
			Track504 := TrackClear ;
			Track505 := TrackClear ;
			Track506 := TrackClear ;
			//FB INPUTS
			Track507.FixedIN := Tracking50.FixedOUT ;
			Track507.Speed := Speeds.SpeedSlow ;
			Track507.TrackDelayEN := TRUE ;
			Track507.DelayPT := TrackDelayPT.PTTrack507 ;
			//FB CALL
			Track507 ();
			//FB OUTPUTS
			CRE.o.Run[0] := Track507.RunOUT ;
			CLB.o.Run[0] := Track507.RunOUT ;
			CRE.Inv.Scale1.x := Track507.SpeedOUT ;
			CLB.Inv.Scale1.x := Track507.SpeedOUT ;
			IF(Track507.Done) THEN
				Tracking50.IndexIN := 0 ;
				Tracking60.IndexIN := 1 ;
				Tracking60.BatchClearIN := Tracking50.BatchClear ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track501.DoneIN := EDGEPOS(RowTemp.Done) ;
	Track503.DoneIN := EDGEPOS(S36Reed.In) ;
	Track504.DoneIN := EDGEPOS(S19Photo.Int) ;
	Track506.DoneIN := EDGENEG(S19Photo.Int) ;
	
	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking52.Blocks[0] := NOT(AGVReady.In) ;
	Tracking52.Blocks[1] := NOT(AGVInPosition.In) ;
	Tracking52.ControlIN := Control.Achieved1 ;
	Tracking52.EMOStart := EMO.StartLatch ;
	Tracking52.ESClear := Control.ESClear ;
	Tracking52 ();
	Tracking52.ResMan := FALSE ;
	//RESET OF OUTPUTS
	AGVReadyToSend.Auto := FALSE ;
	AGVSending.Auto := FALSE ;
	CASE Tracking52.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track521 := TrackClear ;
			Track522 := TrackClear ;
		1: //TRACK FROM Track502.DelayTON.Q (P) TO NOT(Tracking52.Blocked) (-)
			Track522 := TrackClear ;
			//FB INPUTS
			Track521.FixedIN := Tracking52.FixedOUT ;
			//FB CALL
			Track521 ();
			//FB OUTPUTS
			AGVReadyToSend.Auto := Track521.SolOUT ;
			IF(Track521.Done) THEN
				Tracking52.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM NOT(Tracking52.Blocked) (-)  TO Track522.DelayTON.Q (P)
			Track521 := TrackClear ;
			//FB INPUTS
			Track522.FixedIN := Tracking52.FixedOUT ;
			Track522.Speed := Speeds.SpeedBatch ;
			Track522.TrackDelayEN := TRUE ;
			Track522.DelayPT := TrackDelayPT.PTTrack805 ;
			//FB CALL
			Track522 ();
			//FB OUTPUTS
			AGVReadyToSend.Auto := Track522.SolOUT ;
			AGVSending.Auto := Track522.RunOUT ;
			CRB.o.Run[0] := Track522.RunOUT ;
			CRB.Inv.Scale1.x := Track522.SpeedOUT ;
			IF(Track522.Done) THEN
				Tracking52.IndexIN := 0 ;
			END_IF
		3://Trick to beat the problem of Track521.DoneIN being true when IndexIN = 1.
			Tracking52.IndexIN := 1 ;
	END_CASE
	
	//TRACKBIT DONE CONDITIONS
	Track521.DoneIN := NOT(Tracking52.Blocked) ;

	//Extract bits from Row Length
	FOR i := 0 TO 15 DO
		LengthUnpack[i] := (SHR(REAL_TO_INT(Tracking52.Length), i) AND 1) <> 0;
	END_FOR

END_PROGRAM


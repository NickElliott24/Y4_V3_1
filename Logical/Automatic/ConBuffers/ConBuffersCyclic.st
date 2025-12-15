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
	Tracking30.Blocks[0] := (Tracking40.Busy) ;
	Tracking30.Blocks[2] := (CB2.Input.Fault) ;
	Tracking30.Blocks[9] := (S16Photo.Int) ;
	Tracking30.Blocks[10] := (S17Photo.Int) ;
	Tracking30.ControlIN := Control.Achieved1 ;
	Tracking30.EMOStart := EMO.StartLatch ;
	Tracking30.ESClear := Control.ESClear ;
	Tracking30 ();
	Tracking30.ResMan := FALSE ;
	Tracking30.BlockInhib := (Tracking41.Busy) AND NOT(Tracking40.Busy) ;
	CASE Tracking30.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track301 := TrackClear ;
			Track302 := TrackClear ;
		1: //TRACK FROM NOT Tracking20.Blocked (-) TO S14Photo.Int (P)
			Track302 := TrackClear ;
			//FB INPUTS
			Track301.FixedIN := Tracking30.FixedOUT ;
			Track301.Speed := Speeds.SpeedExit ;
			Track301.TimeoutEN := TRUE ;
			Track301.TimeoutACK := Warn.Ack ;
			Track301.TimeoutBlock := (Warn.Block) ;
			Track301.DelayPT := TrackDelayPT.PTTrack301 ;
			//FB CALL
			Track301 ();
			//FB OUTPUTS
			CB1.o.Run[0] := Track301.RunOUT ;
			CB1.Inv.Scale1.x := Track301.SpeedOUT ;
			IF(Track301.Done) THEN
				Tracking30.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM S14Photo.Int (P) TO NOT Tracking30.Blocked (-)
			Track301 := TrackClear ;
			//FB INPUTS
			Track302.FixedIN := Tracking30.FixedOUT ;
			//FB CALL
			Track302 ();
			//FB OUTPUTS
			IF(Track302.Done) THEN
				Tracking30.IndexIN := 0 ;
				Tracking40.IndexIN := 1 ;
				Tracking93.IndexIN := 1 ;
				Tracking40.LengthIN := Tracking30.Length ;
				Tracking40.WidthIN := Tracking30.Width ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track301.DoneIN := EDGEPOS(S14Photo.Int) ;
	Track302.DoneIN := NOT(Tracking30.Blocked) ;

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking93.ControlIN := Control.Achieved1 ;
	Tracking93.EMOStart := EMO.StartLatch ;
	Tracking93.ESClear := Control.ESClear ;
	Tracking93 ();
	Tracking93.ResMan := FALSE ;
	CASE Tracking93.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track931 := TrackClear ;
			Track932 := TrackClear ;
		1: //TRACK FROM NOT Tracking30.Blocked (-) TO S15Photo.Int (N)
			Track932 := TrackClear ;
			//FB INPUTS
			Track931.FixedIN := Tracking93.FixedOUT ;
			Track931.RunBlock := (Track401.TimeoutOUT) OR(Track402.TimeoutOUT) ;
			Track931.Speed := Speeds.SpeedExit ;
			//FB CALL
			Track931 ();
			//FB OUTPUTS
			CB1.o.Run[0] := Track931.RunOUT ;
			CB1.Inv.Scale1.x := Track931.SpeedOUT ;
			IF(Track931.Done) THEN
				Tracking93.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM S15Photo.Int (N) TO Track932.DelayTON.Q (P)
			Track931 := TrackClear ;
			//FB INPUTS
			Track932.FixedIN := Tracking93.FixedOUT ;
			Track932.RunBlock := (Track401.TimeoutOUT) OR(Track402.TimeoutOUT) ;
			Track932.Speed := Speeds.SpeedExit ;
			Track932.TrackDelayEN := TRUE ;
			Track932.DelayPT := TrackDelayPT.PTTrack932 ;
			//FB CALL
			Track932 ();
			//FB OUTPUTS
			CB1.o.Run[0] := Track932.RunOUT ;
			CB1.Inv.Scale1.x := Track932.SpeedOUT ;
			IF(Track932.Done) THEN
				Tracking93.IndexIN := 0 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track931.DoneIN := EDGENEG(S15Photo.Int) ;

	//MANUAL RESET CONDITIONS FOR CONCURRENT TRACKBIT
	Tracking93.ResMan := Tracking40.ResMan ;
	IF(Tracking40.IndexIN = 0) THEN
		Tracking93.IndexIN := 0 ;
	END_IF
	IF EDGEPOS(Track302.Active)AND((Track401.Active)OR(Track402.Active))THEN
		Tracking93.IndexIN:=0;
	END_IF

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking40.Blocks[0] := (Tracking41.Busy) OR(S58Lever.In ) OR(S58Lever.Int) OR(Tracking51.Busy) ;
	Tracking40.Blocks[1] := (Tracking50.IndexIN > 1) ;
	Tracking40.Blocks[2] := (RowTemp.Done) ;
	Tracking40.Blocks[4] := NOT(Sol33Pal4.Auto) ;
	Tracking40.Blocks[9] := (S17Photo.Int) ;
	Tracking40.Blocks[10] := (S18Photo.Int) ;
	Tracking40.Blocks[11] := NOT(S37Reed.In) ;
	Tracking40.ControlIN := Control.Achieved1 ;
	Tracking40.EMOStart := EMO.StartLatch ;
	Tracking40.ESClear := Control.ESClear ;
	Tracking40 ();
	Tracking40.ResMan := FALSE ;
	CASE Tracking40.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track401 := TrackClear ;
			Track402 := TrackClear ;
		1: //TRACK FROM NOT Tracking30.Blocked (-) TO S16Photo.Int (P)
			Track402 := TrackClear ;
			//FB INPUTS
			Track401.FixedIN := Tracking40.FixedOUT ;
			Track401.Speed := Speeds.SpeedExit ;
			Track401.TimeoutEN := TRUE ;
			Track401.TimeoutACK := Warn.Ack ;
			Track401.TimeoutBlock := (Warn.Block) ;
			Track401.DelayPT := TrackDelayPT.PTTrack401 ;
			//FB CALL
			Track401 ();
			//FB OUTPUTS
			CB2.o.Run[0] := Track401.RunOUT ;
			CB2.Inv.Scale1.x := Track401.SpeedOUT ;
			IF(Track401.Done) THEN
				Tracking40.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM S16Photo.Int (P) TO NOT Tracking40.Blocked (-)
			Track401 := TrackClear ;
			//FB INPUTS
			Track402.FixedIN := Tracking40.FixedOUT ;
			//FB CALL
			Track402 ();
			//FB OUTPUTS
			IF(Track402.Done) THEN
				Tracking40.IndexIN := 0 ;
				IF NOT(Tracking40.Blocked) THEN
					Tracking41.IndexIN := 1 ;
				ELSE
					Tracking41.IndexIN := 2 ;
				END_IF
				Tracking41.LengthIN := Tracking40.Length ;
				Tracking41.WidthIN := Tracking40.Width ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track401.DoneIN := EDGEPOS(S16Photo.Int) ;
	Track402.DoneIN := NOT(Tracking40.Blocked) ;

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking41.ControlIN := Control.Achieved1 ;
	Tracking41.EMOStart := EMO.StartLatch ;
	Tracking41.ESClear := Control.ESClear ;
	Tracking41 ();
	Tracking41.ResMan := FALSE ;
	CASE Tracking41.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track411 := TrackClear ;
			Track412 := TrackClear ;
			Track413 := TrackClear ;
			Track414 := TrackClear ;
		1: //TRACK FROM NOT Tracking40.Blocked (-) TO Track411.DelayTON.Q (P)
			Track412 := TrackClear ;
			Track413 := TrackClear ;
			Track414 := TrackClear ;
			//FB INPUTS
			Track411.FixedIN := Tracking41.FixedOUT ;
			Track411.Speed := Speeds.SpeedExit ;
			Track411.TrackDelayEN := TRUE ;
			Track411.DelayPT := TrackDelayPT.PTTrack411 ;
			//FB CALL
			Track411 ();
			//FB OUTPUTS
			CB2.o.Run[0] := Track411.RunOUT ;
			CB2.Inv.Scale1.x := Track411.SpeedOUT ;
			IF(Track411.Done) THEN
				Tracking41.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM Track411.DelayTON.Q (P) TO S17Photo.Int (N)
			Track411 := TrackClear ;
			Track413 := TrackClear ;
			Track414 := TrackClear ;
			//FB INPUTS
			Track412.FixedIN := Tracking41.FixedOUT ;
			Track412.Speed := Speeds.SpeedExit ;
			Track412.TimeoutEN := TRUE ;
			Track412.TimeoutACK := Warn.Ack ;
			Track412.TimeoutBlock := (Warn.Block) ;
			Track412.DelayPT := TrackDelayPT.PTTrack412 ;
			//FB CALL
			Track412 ();
			//FB OUTPUTS
			CB2.o.Run[0] := Track412.RunOUT ;
			CRB.o.Run[0] := Track412.RunOUT ;
			CB2.Inv.Scale1.x := Track412.SpeedOUT ;
			CRB.Inv.Scale1.x := Track412.SpeedOUT ;
			IF(Track412.Done) THEN
				Tracking41.IndexIN := 3 ;
			END_IF
		3: //TRACK FROM S17Photo.Int (N) TO S17Photo.Int (P)
			Track411 := TrackClear ;
			Track412 := TrackClear ;
			Track414 := TrackClear ;
			//FB INPUTS
			Track413.FixedIN := Tracking41.FixedOUT ;
			Track413.Speed := Speeds.SpeedSlow ;
			Track413.TimeoutEN := TRUE ;
			Track413.TimeoutACK := Warn.Ack ;
			Track413.TimeoutBlock := (Warn.Block) ;
			Track413.DelayPT := TrackDelayPT.PTTrack413 ;
			//FB CALL
			Track413 ();
			//FB OUTPUTS
			CRB.o.Rev[0] := Track413.RunOUT ;
			CRB.Inv.Scale1.x := Track413.SpeedOUT ;
			IF(Track413.Done) THEN
				Tracking41.IndexIN := 4 ;
			END_IF
		4: //TRACK FROM S17Photo.Int (P) TO S17Photo.Int (N)
			Track411 := TrackClear ;
			Track412 := TrackClear ;
			Track413 := TrackClear ;
			//FB INPUTS
			Track414.FixedIN := Tracking41.FixedOUT ;
			Track414.Speed := Speeds.SpeedSlow ;
			//FB CALL
			Track414 ();
			//FB OUTPUTS
			CRB.o.Run[0] := Track414.RunOUT ;
			CRB.Inv.Scale1.x := Track414.SpeedOUT ;
			IF(Track414.Done) THEN
				Tracking41.IndexIN := 0 ;
				Tracking50.IndexIN := 1 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track412.DoneIN := EDGENEG(S17Photo.Int) ;
	Track413.DoneIN := EDGEPOS(S17Photo.Int) ;
	Track414.DoneIN := EDGENEG(S17Photo.Int) ;

END_PROGRAM

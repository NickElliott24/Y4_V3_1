
(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Modes
 * File: ModesCyclic.st
 * Author: NE
 ********************************************************************)

PROGRAM _CYCLIC

	//LINE PAUSE - AT EXIT
	//BLOCK EXIT FROM CLB IF FURNACE LOAD CONVEYOR NOT CLEAR
	IF EDGEPOS(Perms.FurnReady = 0) THEN
		FurnReady.Int := FALSE ;
	END_IF
	Perms.FurnReady := 1 ;
	CASE Perms.FurnReady OF
		0:	//PULSE SIGNAL FROM FURNACE
			//CAPTURE FURNACE CLEAR SIGNAL
			IF EDGEPOS(FurnReady.In) THEN
				FurnReady.Int := TRUE ;
			END_IF
			IF EDGENEG(Track701.Active) AND NOT(Control.ESClear) THEN
				FurnReady.Int := FALSE ;
			END_IF	
			IF EDGENEG(Track822.Active) AND NOT(Control.ESClear) THEN
				FurnReady.Int := FALSE ;
			END_IF	
		1:	//ON SIGNAL FROM FURNACE
			Pause.Clear1.PT := t#500ms;//USE Pause Mode_typ spare variables to filter furnace input signal.
			Pause.Clear1.IN := FurnReady.In;
			Pause.Clear1 ();
			FurnReady.Int := Pause.Clear1.Q;
			IF EDGEPOS(FurnReady.In)THEN
				Pause.ESDisp := Pause.ESDisp + 1;
			END_IF
			IF EDGEPOS(Pause.Clear1.Q)THEN
				Pause.ESDisp := Pause.ESDisp - 1;
			END_IF
			Pause.ESDisp := LIMIT(0, Pause.ESDisp, 250);
	END_CASE

	//PAUSE CONDITIONS
	Pause.Input1 := S55Lever.In ;
	Pause.Input2 := NOT(WashRun.In) ;
	Pause.Input3 := NOT(FurnReady.Int) ;
	Pause.Input4 := FALSE ;

	IF(Track603.Active) OR(Track812.Active) OR(Track513.Active) THEN
		IF(Pause.Input1) OR(Pause.Input2) OR(Pause.Input3) OR(Pause.Input4) THEN
			Pause.Active	:=	TRUE	;
		END_IF
	END_IF
	
	//LINE PAUSE RESET
	IF EDGENEG(Pause.Input1) AND NOT(Pause.Input2) AND NOT(Pause.Input3) AND NOT(Pause.Input4) AND(Pause.Active) THEN
		Pause.Active	:= 	FALSE	;
	END_IF

	IF EDGENEG(Pause.Input2) AND NOT(Pause.Input1) AND NOT(Pause.Input3) AND NOT(Pause.Input4) AND(Pause.Active) THEN
		Pause.Active	:= 	FALSE	;
	END_IF

	IF EDGENEG(Pause.Input3) AND NOT(Pause.Input1) AND NOT(Pause.Input2) AND NOT(Pause.Input4) AND(Pause.Active) THEN
		Pause.Active	:= 	FALSE	;
	END_IF

	IF EDGENEG(Pause.Input4) AND NOT(Pause.Input1) AND NOT(Pause.Input2) AND NOT(Pause.Input3) AND(Pause.Active) THEN
		Pause.Active	:= 	FALSE	;
	END_IF

	IF NOT(Track603.Active) AND NOT(Track812.Active) AND NOT(Track513.Active) THEN
		Pause.Active	:=	FALSE	;
	END_IF
	
	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking80.Blocks[1] := (Tracking82.Busy) ;
	Tracking80.Blocks[2] := (CLB.Input.Fault) ;
	Tracking80.Blocks[9] := (S19Photo.Int) ;
	Tracking80.ControlIN := Control.Achieved1 ;
	Tracking80.EMOStart := EMO.StartLatch ;
	Tracking80.ESClear := Control.ESClear ;
	Tracking80 ();
	Tracking80.ResMan := FALSE ;
	IF(S57Lever.In) AND NOT((Tracking41.Busy) OR(Tracking50.Busy) OR(Tracking60.Busy) OR(Tracking70.Busy)) THEN
		S57Lever.Int := TRUE ;
	END_IF
	IF NOT(S57Lever.In) AND NOT((Tracking70.Busy) OR(Tracking80.Busy) OR(Tracking81.Busy) OR(Tracking82.Busy)) THEN
		S57Lever.Int := FALSE ;
	END_IF
	CASE Tracking80.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track801 := TrackClear ;
			Track802 := TrackClear ;
			Track803 := TrackClear ;
			Track804 := TrackClear ;
			Track805 := TrackClear ;
			//START CONDITION FOR LOADING
			IF((S18Photo.Int) AND(S57Lever.Int) AND(S37Reed.In) AND NOT(Tracking81.Busy) AND(Control.Achieved1)) THEN
				Tracking80.IndexIN := 1 ;
			END_IF
		1: //TRACK FROM S18Photo.Int (P) TO S18Photo.Int (N)
			Track802 := TrackClear ;
			Track803 := TrackClear ;
			Track804 := TrackClear ;
			Track805 := TrackClear ;
			//FB INPUTS
			Track801.FixedIN := Tracking80.FixedOUT ;
			Track801.Speed := Speeds.SpeedEntry ;
			Track801.TimeoutEN := TRUE ;
			Track801.TimeoutACK := Warn.Ack ;
			Track801.TimeoutBlock := (Warn.Block) ;
			Track801.DelayPT := TrackDelayPT.PTTrack801 ;
			//FB CALL
			Track801 ();
			//FB OUTPUTS
			CRB.o.Rev[0] := Track801.RunOUT ;
			CRB.Inv.Scale1.x := Track801.SpeedOUT ;
			IF(Track801.Done) THEN
				Tracking80.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM S18Photo.Int (N) TO Track802.DelayTON.Q (P)
			Track801 := TrackClear ;
			Track803 := TrackClear ;
			Track804 := TrackClear ;
			Track805 := TrackClear ;
			//FB INPUTS
			Track802.FixedIN := Tracking80.FixedOUT ;
			Track802.Speed := Speeds.SpeedEntry ;
			Track802.TrackDelayEN := TRUE ;
			Track802.DelayPT := TrackDelayPT.PTTrack802 ;
			//FB CALL
			Track802 ();
			//FB OUTPUTS
			CRB.o.Rev[0] := Track802.RunOUT ;
			CRB.Inv.Scale1.x := Track802.SpeedOUT ;
			IF(Track802.Done) THEN
				Tracking80.IndexIN := 3 ;
			END_IF
		3: //TRACK FROM Track802.DelayTON.Q (P) TO S36Reed.In (P)
			Track801 := TrackClear ;
			Track802 := TrackClear ;
			Track804 := TrackClear ;
			Track805 := TrackClear ;
			//FB INPUTS
			Track803.FixedIN := Tracking80.FixedOUT ;
			Track803.SolBlock := (Tracking80.Blocked) ;
			Track803.TimeoutEN := TRUE ;
			Track803.TimeoutACK := Warn.Ack ;
			Track803.TimeoutBlock := (Warn.Block) ;
			Track803.DelayPT := TrackDelayPT.PTTrack803 ;
			//FB CALL
			Track803 ();
			//FB OUTPUTS
			Sol33Pal4.Auto := NOT(Track803.SolOUT) ;
			IF(Track803.Done) THEN
				Tracking80.IndexIN := 4 ;
			END_IF
		4: //TRACK FROM S36Reed.In (P) TO S19Photo.Int (P)
			Track801 := TrackClear ;
			Track802 := TrackClear ;
			Track803 := TrackClear ;
			Track805 := TrackClear ;
			//FB INPUTS
			Track804.FixedIN := Tracking80.FixedOUT ;
			Track804.Speed := Speeds.SpeedBatch ;
			Track804.TimeoutEN := TRUE ;
			Track804.DelayPT := TrackDelayPT.PTTrack804 ;
			//FB CALL
			Track804 ();
			//FB OUTPUTS
			CRE.o.Run[0] := Track804.RunOUT ;
			CLB.o.Run[0] := Track804.RunOUT ;
			CRE.Inv.Scale1.x := Track804.SpeedOUT ;
			CLB.Inv.Scale1.x := Track804.SpeedOUT ;
			Sol33Pal4.Auto := NOT(Track804.SolOUT) ;
			IF(Track804.TimeoutOUT) THEN
				Tracking80.IndexIN := 0 ;
			END_IF
			IF(Track804.Done) THEN
				Tracking80.IndexIN := 5 ;
			END_IF
		5: //TRACK FROM S19Photo.Int (P) TO S19Photo.Int (N)
			Track801 := TrackClear ;
			Track802 := TrackClear ;
			Track803 := TrackClear ;
			Track804 := TrackClear ;
			//FB INPUTS
			Track805.FixedIN := Tracking80.FixedOUT ;
			Track805.Speed := Speeds.SpeedBatch ;
			//FB CALL
			Track805 ();
			//FB OUTPUTS
			CRE.o.Run[0] := Track805.RunOUT ;
			CLB.o.Run[0] := Track805.RunOUT ;
			CRE.Inv.Scale1.x := Track805.SpeedOUT ;
			CLB.Inv.Scale1.x := Track805.SpeedOUT ;
			Sol33Pal4.Auto := NOT(Track805.SolOUT) ;
			IF(Track805.Done) THEN
				Tracking80.IndexIN := 0 ;
				Tracking81.IndexIN := 1 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track801.DoneIN := EDGENEG(S18Photo.Int) ;
	Track803.DoneIN := EDGEPOS(S36Reed.In) ;
	Track804.DoneIN := EDGEPOS(S19Photo.Int) ;
	Track805.DoneIN := EDGENEG(S19Photo.Int) ;

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking81.Blocks[9] := (Pause.Active) ;
	Tracking81.Blocks[10] := NOT(WashRun.In) ;
	Tracking81.Blocks[11] := NOT(FurnReady.Int) ;
	Tracking81.Blocks[12] := (S55Lever.In) ;
	Tracking81.ControlIN := Control.Achieved1 ;
	Tracking81.EMOStart := EMO.StartLatch ;
	Tracking81.ESClear := Control.ESClear ;
	Tracking81 ();
	Tracking81.ResMan := FALSE ;
	CASE Tracking81.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track811 := TrackClear ;
			Track812 := TrackClear ;
		1: //TRACK FROM S19Photo.Int (N) TO S21Photo.Int (P)
			Track812 := TrackClear ;
			//FB INPUTS
			Track811.FixedIN := Tracking81.FixedOUT ;
			Track811.Speed := Speeds.SpeedBatch ;
			Track811.TimeoutEN := TRUE ;
			Track811.TimeoutACK := Warn.Ack ;
			Track811.TimeoutBlock := (Warn.Block) ;
			Track811.DelayPT := TrackDelayPT.PTTrack811 ;
			//FB CALL
			Track811 ();
			//FB OUTPUTS
			CRE.o.Run[0] := Track811.RunOUT ;
			CLB.o.Run[0] := Track811.RunOUT ;
			CRE.Inv.Scale1.x := Track811.SpeedOUT ;
			CLB.Inv.Scale1.x := Track811.SpeedOUT ;
			IF(Track811.Done) THEN
				Tracking81.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM S21Photo.Int (P) TO NOT(Tracking81.Blocked) (-)
			Track811 := TrackClear ;
			//FB INPUTS
			Track812.FixedIN := Tracking81.FixedOUT ;
			Track812.SolBlock := (S55Lever.In)OR NOT(WashRun.In) ;
			//FB CALL
			Track812 ();
			//FB OUTPUTS
			BatchAtExit.Auto := (Track812.SolOUT) ;
			IF(Track812.Done) THEN
				Tracking81.IndexIN := 0 ;
				Tracking82.IndexIN := 1 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track811.DoneIN := EDGEPOS(S21Photo.Int) ;
	Track812.DoneIN := NOT(Tracking81.Blocked) ;

	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking82.ControlIN := Control.Achieved1 ;
	Tracking82.EMOStart := EMO.StartLatch ;
	Tracking82.ESClear := Control.ESClear ;
	Tracking82 ();
	Tracking82.ResMan := FALSE ;
	IF(CLB.LastSpeed = 0.0)THEN
		TrackDelayPT.PTTrack812 := 1000 ;
	ELSE		
		TrackDelayPT.PTTrack812	:=	REAL_TO_UDINT((UDINT_TO_REAL(TrackDelayPT.PTTrack822)) *((10/CLB.LastSpeed)));
	END_IF
	CASE Tracking82.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track821 := TrackClear ;
			Track822 := TrackClear ;
		1: //TRACK FROM NOT(Tracking81.Blocked) (-) TO S21Photo.Int (N)
			Track822 := TrackClear ;
			//FB INPUTS
			Track821.FixedIN := Tracking82.FixedOUT ;
			Track821.Speed := Speeds.SpeedWash ;
			Track821.Analog := InvPerms.CLB.Analog ;
			Track821.SpeedAnalog := CLB.SpeedAnalog ;
			Track821.TimeoutEN := TRUE ;
			Track821.TimeoutACK := Warn.Ack ;
			Track821.TimeoutBlock := (Warn.Block) ;
			Track821.DelayPT := TrackDelayPT.PTTrack821 ;
			//FB CALL
			Track821 ();
			//FB OUTPUTS
			CLB.o.Run[0] := Track821.RunOUT ;
			CLB.Inv.Scale1.x := Track821.SpeedOUT ;
			WashStop.Auto := Track821.RunOUT ;
			BatchAtExit.Auto := (Track821.SolOUT) ;
			IF(Track821.Done) THEN
				Tracking82.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM S21Photo.Int (N) TO Track821.DelayTON.Q (P)
			Track821 := TrackClear ;
			//FB INPUTS
			Track822.FixedIN := Tracking82.FixedOUT ;
			Track821.Speed := Speeds.SpeedWash ;
			Track821.Analog := InvPerms.CLB.Analog ;
			Track821.SpeedAnalog := CLB.SpeedAnalog ;
			Track822.TrackDelayEN := TRUE ;
			Track822.DelayPT := TrackDelayPT.PTTrack812 ;
			//FB CALL
			Track822 ();
			//FB OUTPUTS
			CLB.o.Run[0] := Track822.RunOUT ;
			CLB.Inv.Scale1.x := Track822.SpeedOUT ;
			WashStop.Auto := Track822.RunOUT ;
			BatchAtExit.Auto := (Track822.SolOUT) ;
			IF(Track822.Done) THEN
				Tracking82.IndexIN := 0 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track821.DoneIN := EDGENEG(S21Photo.Int) ;
	
	//MANUAL BATCHING
	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking51.Blocks[1] := (Tracking70.Busy) ;
	Tracking51.Blocks[2] := (CLB.Input.Fault) ;
	Tracking51.Blocks[9] := (Pause.Active) ;
	Tracking51.Blocks[10] := NOT(WashRun.In) ;
	Tracking51.Blocks[11] := NOT(FurnReady.Int) ;
	Tracking51.Blocks[12] := (S55Lever.In) ;
	Tracking51.ControlIN := Control.Achieved1 ;
	Tracking51.EMOStart := EMO.StartLatch ;
	Tracking51.ESClear := Control.ESClear ;
	Tracking51 ();
	Tracking51.ResMan := FALSE ;
	IF(S58Lever.In) AND NOT((Tracking41.Busy) OR(Tracking50.Busy) OR(Tracking60.Busy) OR(Tracking70.Busy)) THEN
		S58Lever.Int := TRUE ;
	END_IF
	IF(S58Lever.Int)THEN
		Sol33Pal4.Auto := FALSE ;
	END_IF
	IF(S58Lever.Int) AND NOT(S58Lever.In) AND(Track511.Active)THEN
		IF EDGEPOS(S48Foot.In)THEN
			S58Lever.Int := FALSE ;
			Tracking51.IndexIN := 0 ;
		END_IF
	END_IF
	CASE Tracking51.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track511 := TrackClear ;
			Track512 := TrackClear ;
			Track513 := TrackClear ;
			//START CONDITION FOR LOADING
			IF(S58Lever.In) AND(S58Lever.Int)AND NOT((Tracking51.Busy) OR(Tracking70.Busy)) AND(Control.Achieved1)THEN
				Tracking51.IndexIN:=1;
			END_IF
			IF NOT(S58Lever.In)THEN
				S58Lever.Int := FALSE ;
			END_IF
		1: //TRACK FROM S58Lever.Int (P) TO S66PB.In (P)
			Track512 := TrackClear ;
			Track513 := TrackClear ;
			//FB INPUTS
			Track511.FixedIN := Tracking51.FixedOUT ;
			Track511.Speed := Speeds.SpeedEntry ;
			Track511.RunBlock := NOT(S48Foot.In) OR (S20Photo.Int) ;
			//FB CALL
			Track511 ();
			//FB OUTPUTS
			CRE.o.Run[0] := Track511.RunOUT ;
			CRE.Inv.Scale1.x := Track511.SpeedOUT ;
			CLB.o.Run[0] := Track511.RunOUT ;
			CLB.Inv.Scale1.x := Track511.SpeedOUT ;
			IF(Track511.Done)THEN
				Tracking51.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM S66PB.In (P) TO S21Photo.Int (P)
			Track511 := TrackClear ;
			Track513 := TrackClear ;
			//FB INPUTS
			Track512.FixedIN := Tracking51.FixedOUT ;
			Track512.Speed := Speeds.SpeedBatch ;
			Track512.TimeoutEN := TRUE ;
			Track512.TimeoutACK := Warn.Ack ;
			Track512.TimeoutBlock := (Warn.Block) ;
			Track512.DelayPT := TrackDelayPT.PTTrack603 ;
			//FB CALL
			Track512 ();
			//FB OUTPUTS
			CRE.o.Run[0] := Track512.RunOUT ;
			CRE.Inv.Scale1.x := Track512.SpeedOUT ;
			CLB.o.Run[0] := Track512.RunOUT ;
			CLB.Inv.Scale1.x := Track512.SpeedOUT ;
			IF(Track512.Done)THEN
				Tracking51.IndexIN := 3 ;
			END_IF
		3: //TRACK FROM S21Photo.Int (P) TO NOT(Tracking51.Blocked) (-)
			Track511 := TrackClear ;
			Track512 := TrackClear ;
			//FB INPUTS
			Track513.FixedIN := Tracking51.FixedOUT ;
			//FB CALL
			Track513 ();
			//FB OUTPUTS
			IF(Track513.Done) THEN
				Tracking51.IndexIN := 0 ;
				Tracking70.IndexIN := 1 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track511.DoneIN := EDGEPOS(S66PB.In) ;
	Track512.DoneIN := EDGEPOS(S21Photo.Int) ;
	Track513.DoneIN := NOT(Tracking51.Blocked) ;

END_PROGRAM

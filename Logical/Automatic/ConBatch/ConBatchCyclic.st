(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ConBatch
 * File: ConBatchCyclic.st
 * Author: nicke
 ********************************************************************
 * Implementation of program ConBatch
 ********************************************************************)

PROGRAM _CYCLIC

  //TRACKINGSECTION END BLOCK CONDITIONS
	Tracking60.Blocks[9] := (Pause.Active) ;
	Tracking60.Blocks[10] := NOT(WashRun.In) ;
	Tracking60.Blocks[11] := NOT(FurnReady.Int) ;
	Tracking60.Blocks[12] := (S55Lever.In) ;
	Tracking60.ControlIN := Control.Achieved1 ;
	Tracking60.EMOStart := EMO.StartLatch ;
	Tracking60.ESClear := Control.ESClear ;
	Tracking60 ();
	IF(Tracking60.ResMan) OR(Tracking60.ResES) THEN
		Loads.AshtonExit := Loads.Empty ;
	END_IF
	Tracking60.ResMan := FALSE ;
	//RESET OF OUTPUTS
	BatchAtExit.Auto := FALSE ;
	WashStop.Auto := FALSE ;
	CASE Tracking60.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track601 := TrackClear ;
			Track602 := TrackClear ;
			Track603 := TrackClear ;
		1: //TRACK FROM Track507.DelayTON.Q(Stop) (P) TO LoadTemp.Done (P)
			Track602 := TrackClear ;
			Track603 := TrackClear ;
			//FB INPUTS
			Track601.FixedIN := Tracking60.FixedOUT ;
			//FB CALL
			Track601 ();
			//FB OUTPUTS
			IF(Track601.Done) THEN
				Tracking60.IndexIN := 2 ;
			END_IF
		2: //TRACK FROM LoadTemp.Done (P) TO S21Photo.Int (P)
			Track601 := TrackClear ;
			Track603 := TrackClear ;
			//FB INPUTS
			Track602.FixedIN := Tracking60.FixedOUT ;
			Track602.Speed := Speeds.SpeedSlow ;
			Track602.TimeoutEN := TRUE ;
			Track602.TimeoutACK := Warn.Ack ;
			Track602.TimeoutBlock := (Warn.Block) ;
			Track602.DelayPT := TrackDelayPT.PTTrack602 ;
			//FB CALL
			Track602 ();
			//FB OUTPUTS
			CLB.o.Run[0] := Track602.RunOUT ;
			CLB.Inv.Scale1.x := Track602.SpeedOUT ;
			IF(Track602.Done) THEN
				Tracking60.IndexIN := 3 ;
			END_IF
		3: //TRACK FROM S21Photo.Int (P) TO NOT(Tracking60.Blocked) (-)
			Track601 := TrackClear ;
			Track602 := TrackClear ;
			//FB INPUTS
			Track603.FixedIN := Tracking60.FixedOUT ;
			Track603.SolBlock := (S55Lever.In)OR NOT(WashRun.In) ;
			//FB CALL
			Track603 ();
			//FB OUTPUTS
			BatchAtExit.Auto := (Track603.SolOUT) ;
			IF(Track603.Done) THEN
				Tracking60.IndexIN := 0 ;
				Tracking70.IndexIN := 1 ;
			END_IF
	END_CASE

	//TRACKBIT DONE CONDITIONS
	Track601.DoneIN := EDGEPOS(LoadTemp.Done) ;
	Track602.DoneIN := (S21Photo.Int) ;
	Track603.DoneIN := NOT(Tracking60.Blocked) ;


	//TRACKINGSECTION END BLOCK CONDITIONS
	Tracking70.ControlIN := Control.Achieved1 ;
	Tracking70.EMOStart := EMO.StartLatch ;
	Tracking70.ESClear := Control.ESClear ;
	Tracking70 ();
	Tracking70.ResMan := FALSE ;
	IF(CLB.LastSpeed = 0.0)THEN
		TrackDelayPT.PTTrack601 := 1000 ;
	ELSE		
		TrackDelayPT.PTTrack601	:=	REAL_TO_UDINT((UDINT_TO_REAL(TrackDelayPT.PTTrack701)) *((10/CLB.LastSpeed)));
	END_IF
	CASE Tracking70.Index OF
		0: //RESET ALL TRACKBIT FOR SELECTED TRACKINGSECTION
			Track701 := TrackClear ;
		1: //TRACK FROM NOT(Tracking60.Blocked) (-) TO Track701.DelayTON.Q (P)
			//FB INPUTS
			Track701.FixedIN := Tracking70.FixedOUT ;
			Track701.Speed := Speeds.SpeedWash ;
			Track701.Analog := InvPerms.CLB.Analog ;
			Track701.SpeedAnalog := CLB.SpeedAnalog ;
			Track701.TrackDelayEN := TRUE ;
			Track701.DelayPT := TrackDelayPT.PTTrack601 ;
			//FB CALL
			Track701 ();
			//FB OUTPUTS
			CLB.o.Run[0] := Track701.RunOUT ;
			CLB.Inv.Scale1.x := Track701.SpeedOUT ;
			BatchAtExit.Auto := (Track701.SolOUT) ;
			WashStop.Auto := Track701.RunOUT ;
			IF(Track701.Done) THEN
				Tracking70.IndexIN := 0 ;
			END_IF
	END_CASE
	
END_PROGRAM

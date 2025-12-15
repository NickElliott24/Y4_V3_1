
PROGRAM _CYCLIC

	//ROW COMPLETION AND CENTERING CALCULATIONS
	//FB INPUTS
	RowTemp.Type := ROW ;
	RowTemp.Calculate := (Track414.Active) AND NOT(Control.ESClear) ;
	RowTemp.Building := (Track501.Active) OR(Track502.Active) ;
	RowTemp.FollowingIN[0] := Tracking41.Width ;
	RowTemp.FollowingIN[1] := Tracking40.Width ;
	RowTemp.FollowingIN[2] := Tracking30.Width ;
	RowTemp.FollowingIN[3] := Tracking20.Width ;
	RowTemp.LengthIN := Tracking41.Length ;
	RowTemp.Gap := RowPerm.Gap ;
	RowTemp.MaxSize := RowPerm.Max ;
	RowTemp.CenterDist := RowPerm.CenterDist ;
	RowTemp.CenterSpeed := Speeds.SpeedCntr ;
	RowTemp.ClearIN := (ClearBatch.In) OR(RowTemp.ClearIN);
	IF(RowTemp.ClearIN) AND(Track501.Active)THEN
		Tracking50.BatchClearIN := TRUE	;
	ELSIF(RowTemp.ClearIN) AND(Track601.Active) AND NOT(Tracking50.Busy) THEN
		Tracking60.BatchClearIN := TRUE ;
		RowTemp.ClearIN := FALSE ;
	END_IF
	//CALL FB
	RowTemp ();
	RowTemp.ClearIN := FALSE ;
	//FB OUTPUTS
	TrackDelayPT.PTTrack502 := RowTemp.CenterPT ;
	IF(RowTemp.Building) THEN
		Tracking50.WidthIN := RowTemp.Current ;
		Tracking50.LengthIN := RowTemp.Longest ;
	END_IF	

	//LOAD COMPLETION CALCULATIONS
	//FB INPUTS
	LoadTemp.Type := LOAD ;
	LoadTemp.Calculate := (Track507.Active) AND NOT(Control.ESClear) ;
	LoadTemp.Building := (Track601.Active) OR(Track602.Active) ;
	LoadTemp.FollowingIN[0] := Tracking50.Length ;
	LoadTemp.Gap := LoadPerm.Gap ;
	LoadTemp.MaxSize := LoadPerm.Max ;
	LoadTemp.ClearIN := Tracking60.BatchClear ;
	//CALL FB
	LoadTemp ();
	//FB OUTPUTS
	IF EDGENEG(LoadTemp.Building) THEN
		LoadTemp.ClearIN := FALSE ;
	END_IF

	//BATCH DISPLAY DATA
	IF EDGEPOS(Track414.Done) THEN 
		Rows.Tracking50.Row[DataFlow.IndexRow].Width:=Tracking41.Width; 
		Rows.Tracking50.Row[DataFlow.IndexRow].Length:=Tracking41.Length;
		Rows.Tracking50.NotEmpty:=TRUE;
		DataFlow.IndexRow:=DataFlow.IndexRow+1;
	END_IF
	
	IF EDGEPOS(Track503.Done)THEN
		DataFlow.IndexRow:=1;
	END_IF
	
	IF EDGEPOS(Track507.Done) THEN
		Rows.Tracking50.Row[0].Width:= Tracking50.Width;
		Rows.Tracking50.Row[0].Length:= Tracking50.Length;
		Loads.AshtonExit.Rows[DataFlow.IndexLoad]:=Rows.Tracking50;
		Loads.AshtonExit.NotEmpty:=TRUE;
		DataFlow.IndexLoad:=DataFlow.IndexLoad+1;
		Rows.Tracking50:=Rows.Empty;
	END_IF

	IF EDGEPOS(Track603.Done)THEN
		IF NOT(Loads.Furnace9.NotEmpty)THEN
			Loads.Furnace9:=Loads.AshtonExit;
			Loads.AshtonExit:=Loads.Empty;
		ELSIF NOT(Loads.Furnace8.NotEmpty)THEN
			Loads.Furnace8:=Loads.AshtonExit;
			Loads.AshtonExit:=Loads.Empty;
		ELSIF NOT(Loads.Furnace7.NotEmpty)THEN
			Loads.Furnace7:=Loads.AshtonExit;
			Loads.AshtonExit:=Loads.Empty;
		ELSIF NOT(Loads.Furnace6.NotEmpty)THEN
			Loads.Furnace6:=Loads.AshtonExit;
			Loads.AshtonExit:=Loads.Empty;
		ELSIF NOT(Loads.Furnace5.NotEmpty)THEN
			Loads.Furnace5:=Loads.AshtonExit;
			Loads.AshtonExit:=Loads.Empty;
		ELSIF NOT(Loads.Furnace4.NotEmpty)THEN
			Loads.Furnace4:=Loads.AshtonExit;
			Loads.AshtonExit:=Loads.Empty;
		ELSIF NOT(Loads.Furnace3.NotEmpty)THEN
			Loads.Furnace3:=Loads.AshtonExit;
			Loads.AshtonExit:=Loads.Empty;
		ELSIF NOT(Loads.Furnace2.NotEmpty)THEN
			Loads.Furnace2:=Loads.AshtonExit;
			Loads.AshtonExit:=Loads.Empty;
		ELSIF NOT(Loads.Furnace1.NotEmpty)THEN
			Loads.Furnace1:=Loads.AshtonExit;
			Loads.AshtonExit:=Loads.Empty;
		END_IF
		DataFlow.IndexLoad:=1;
	END_IF

END_PROGRAM


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
	// Clear Row if Furnace 2 switched to Furnace 1
	IF(Track501.Active) AND(Tracking50.RowBlock)THEN
		IF(Tracking20.Width > 0.0) AND NOT(Tracking20.RowBlock)THEN
			RowTemp.ClearIN := TRUE	;
			Tracking50.BatchClearIN := TRUE	;
		ELSIF(Tracking30.Width > 0.0) AND NOT(Tracking30.RowBlock)THEN
			RowTemp.ClearIN := TRUE	;
			Tracking50.BatchClearIN := TRUE	;
		ELSIF(Tracking40.Width > 0.0) AND NOT(Tracking40.RowBlock)THEN
			RowTemp.ClearIN := TRUE	;
			Tracking50.BatchClearIN := TRUE	;
		END_IF
	END_IF
	// Clear row if Furnace 1 switched to Furnace 2
	IF(Track501.Active) AND NOT(Tracking50.RowBlock)THEN
		IF(Tracking20.Width > 0.0) AND(Tracking20.RowBlock)THEN
			RowTemp.ClearIN := TRUE	;
			Tracking50.BatchClearIN := TRUE	;
		ELSIF(Tracking30.Width > 0.0) AND(Tracking30.RowBlock)THEN
			RowTemp.ClearIN := TRUE	;
			Tracking50.BatchClearIN := TRUE	;
		ELSIF(Tracking40.Width > 0.0) AND(Tracking40.RowBlock)THEN
			RowTemp.ClearIN := TRUE	;
			Tracking50.BatchClearIN := TRUE	;
		END_IF
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
	IF EDGEPOS(Track414.Done) AND NOT(Tracking41.RowBlock) THEN 
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

	//Encode size information to send to AGV controller
	IF EDGEPOS(Track414.Done) AND(Tracking41.RowBlock) THEN 
		SizeData.CurrentWidth := REAL_TO_UINT(Tracking41.Width);
		SizeData.CurrentLength := REAL_TO_UINT(Tracking41.Length);
	END_IF

	CASE SizeData.Sequence OF
		SD_Idle:
			SizeData.WidthMask := FALSE;
			SizeData.LengthMask := FALSE;
			IF(SizeData.CurrentWidth > 0)THEN
				SizeData.Sequence := SD_WidthData;
			END_IF
		SD_WidthData:
			FOR i := 0 TO 11 DO
				SizeData.Sizes[i] := (SHR(SizeData.CurrentWidth, i) AND 1) <> 0;
			END_FOR
			SizeData.WidthMask := TRUE;
			SizeData.Sequence := SD_WidthACK;
		SD_WidthACK:
			IF(AGVAcknowledge.In)THEN
				SizeData.Sequence := SD_NotWidthACK;
				SizeData.WidthMask := FALSE;
				SizeData.CurrentWidth := 0;
			END_IF
		SD_NotWidthACK:
			IF NOT(AGVAcknowledge.In)THEN
				SizeData.Sequence := SD_LengthData;
			END_IF	
		SD_LengthData:
			FOR i := 0 TO 11 DO
				SizeData.Sizes[i] := (SHR(SizeData.CurrentLength, i) AND 1) <> 0;
			END_FOR
			SizeData.LengthMask := TRUE;
			SizeData.Sequence := SD_LengthACK;
		SD_LengthACK:
			IF(AGVAcknowledge.In)THEN
				SizeData.Sequence := SD_NotLengthACK;
				SizeData.LengthMask := FALSE;
				SizeData.CurrentLength := 0;
			END_IF
		SD_NotLengthACK:
			IF NOT(AGVAcknowledge.In)THEN
				SizeData.Sequence := SD_Idle;
			END_IF
	END_CASE

END_PROGRAM

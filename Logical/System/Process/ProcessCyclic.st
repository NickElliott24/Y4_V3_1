(********************************************************************
 * COPYRIGHT -ASHTON INDUSTRIAL 2016-  
 ********************************************************************
 * Program: Process
 * Author: NE
 ********************************************************************)

PROGRAM _CYCLIC
	
	//CALCULATION FOR MACHINE RUN TIME. DISPLAYED IN YY:DD:HH:MM
	//FB INPUTS
	RunTime1.On := Control.Achieved1 ;
	RunTime1.TotReset := Reset.Total ;
	RunTime1.ShftReset := Reset.Time ;
	RunTime1.TotMinIn := Data.TotalMins ;
	RunTime1.TotHrIn := Data.TotalHrs ;
	RunTime1.TotDayIn := Data.TotalDays ;
	RunTime1.TotYrIn := Data.TotalYrs ;
	RunTime1.ShftMinIn := Data.ShiftMins ;
	RunTime1.ShftHrIn := Data.ShiftHrs ;
	RunTime1.ShftDayIn := Data.ShiftDays ;
	RunTime1.ShftYrIn := Data.ShiftYrs ;
	//CALL FB
	RunTime1();
	//FB OUTPUTS
	Data.TotalMins := RunTime1.TotMin ;
	Data.TotalHrs := RunTime1.TotHr ;
	Data.TotalDays := RunTime1.TotDay ;
	Data.TotalYrs := RunTime1.TotYr ;
	Data.ShiftMins := RunTime1.ShftMin ;
	Data.ShiftHrs := RunTime1.ShftHr ;
	Data.ShiftDays := RunTime1.ShftDay ;
	Data.ShiftYrs := RunTime1.ShftYr ;

	//CALCULATE BELT GRIND TIMES FOR WIDTH. DISPLAYED IN DD:HH:MM:SS
	//TRACKING BIT TRIGGER FOR CALCULATION
	GrindFB1.On := FALSE ;
	GrindFB1M.On := FALSE ;
	IF EDGEPOS(Seaming.Stop2) THEN
		GrindFB1.On := TRUE ;
		GrindFB1M.On := TRUE ;
	END_IF

	//FB INPUTS
	GrindFB1.TotReset := Reset.Total ;
	GrindFB1.ShftReset := Reset.Grind ;
	GrindFB1M.ShftReset := MeterageReset1.Reset ;
	IF (ProcessMode.In) THEN
		GrindFB1.Speed := Speeds.SpeedSeamSlow;
	ELSE
		GrindFB1.Speed := Speeds.SpeedSeam ;
	END_IF
	GrindFB1.Measured := Ax2.Measure/10 ;
	GrindFB1.TotMSIn := Grind1.TotalMs ;
	GrindFB1.TotSecIn := Grind1.TotalSec ;
	GrindFB1.TotMinIn := Grind1.TotalMin ;
	GrindFB1.TotHrIn := Grind1.TotalHr ;
	GrindFB1.TotDayIn := Grind1.TotalDay ;
	GrindFB1.ShftMSIn := Grind1.ShiftMs ;
	GrindFB1.ShftSecIn := Grind1.ShiftSec ;
	GrindFB1.ShftMinIn := Grind1.ShiftMin ;
	GrindFB1.ShftHrIn := Grind1.ShiftHr ;
	GrindFB1.ShftDayIn := Grind1.ShiftDay ;
	GrindFB1.TotMtrs1In := Grind1.TotalMLow ;
	GrindFB1.TotMtrs2In := Grind1.TotalMUpp ;
	GrindFB1.TotFt1In := Grind1.TotalFtLow ;
	GrindFB1.TotFt2In := Grind1.TotalFtUpp ;
	GrindFB1M.Measured := GrindFB1.Measured;
 	GrindFB1M.ShftMtrs1In := Grind1.ShiftMLow ;
	GrindFB1M.ShftMtrs2In := Grind1.ShiftMUpp ;
	GrindFB1.ShftFt1In := Grind1.ShiftFtLow ;
	GrindFB1.ShftFt2In := Grind1.ShiftFtUpp ;
	//CALL FB
	GrindFB1();
	GrindFB1M ();
	//FB OUTPUTS
	Grind1.TotalMs := GrindFB1.TotMS ;
	Grind1.TotalSec := GrindFB1.TotSec ;
	Grind1.TotalMin := GrindFB1.TotMin ;
	Grind1.TotalHr := GrindFB1.TotHr ;
	Grind1.TotalDay := GrindFB1.TotDay ;
	Grind1.ShiftMs := GrindFB1.ShftMS ;
	Grind1.ShiftSec := GrindFB1.ShftSec ;
	Grind1.ShiftMin := GrindFB1.ShftMin ;
	Grind1.ShiftHr := GrindFB1.ShftHr ;
	Grind1.ShiftDay := GrindFB1.ShftDay ;
	Grind1.TotalMLow := GrindFB1.TotMtrs1 ;
	Grind1.TotalMUpp := GrindFB1.TotMtrs2 ;
	Grind1.TotalFtLow := GrindFB1.TotFt1 ;
	Grind1.TotalFtUpp := GrindFB1.TotFt2 ;
	Grind1.ShiftMLow := GrindFB1M.ShftMtrs1 ;
	Grind1.ShiftMUpp := GrindFB1M.ShftMtrs2 ;
	Grind1.ShiftFtLow := GrindFB1.ShftFt1 ;
	Grind1.ShiftFtUpp := GrindFB1.ShftFt2 ;

	//CALCULATE BELT GRIND TIMES FOR LENGTH. DISPLAYED IN DD:HH:MM:SS
	//TRACKING BIT TRIGGER FOR CALCULATION
	GrindFB2.On := FALSE ;
	GrindFB2M.On := FALSE ;
	IF EDGEPOS(Seaming.Stop2) THEN
		GrindFB2.On := TRUE ;
		GrindFB2M.On := TRUE ;
	END_IF
	//FB INPUTS
	GrindFB2.TotReset := Reset.Total ;
	GrindFB2.ShftReset := Reset.Grind ;
	GrindFB2M.ShftReset := MeterageReset2.Reset ;
	IF (ProcessMode.In) THEN
		GrindFB2.Speed := Speeds.SpeedSeamSlow;
	ELSE
		GrindFB2.Speed := Speeds.SpeedSeam ;
	END_IF
	GrindFB2.Measured := Tracking20.Length ;
	GrindFB2.TotMSIn := Grind2.TotalMs ;
	GrindFB2.TotSecIn := Grind2.TotalSec ;
	GrindFB2.TotMinIn := Grind2.TotalMin ;
	GrindFB2.TotHrIn := Grind2.TotalHr ;
	GrindFB2.TotDayIn := Grind2.TotalDay ;
	GrindFB2.ShftMSIn := Grind2.ShiftMs ;
	GrindFB2.ShftSecIn := Grind2.ShiftSec ;
	GrindFB2.ShftMinIn := Grind2.ShiftMin ;
	GrindFB2.ShftHrIn := Grind2.ShiftHr ;
	GrindFB2.ShftDayIn := Grind2.ShiftDay ;
	GrindFB2.TotMtrs1In := Grind2.TotalMLow ;
	GrindFB2.TotMtrs2In := Grind2.TotalMUpp ;
	GrindFB2.TotFt1In := Grind2.TotalFtLow ;
	GrindFB2.TotFt2In := Grind2.TotalFtUpp ;
	GrindFB2M.Measured := GrindFB2.Measured;
	GrindFB2M.ShftMtrs1In := Grind2.ShiftMLow ;
	GrindFB2M.ShftMtrs2In := Grind2.ShiftMUpp ;
	GrindFB2.ShftFt1In := Grind2.ShiftFtLow ;
	GrindFB2.ShftFt2In := Grind2.ShiftFtUpp ;
	//CALL FB
	GrindFB2();
	GrindFB2M();
	//FB OUTPUTS
	Grind2.TotalMs := GrindFB2.TotMS ;
	Grind2.TotalSec := GrindFB2.TotSec ;
	Grind2.TotalMin := GrindFB2.TotMin ;
	Grind2.TotalHr := GrindFB2.TotHr ;
	Grind2.TotalDay := GrindFB2.TotDay ;
	Grind2.ShiftMs := GrindFB2.ShftMS ;
	Grind2.ShiftSec := GrindFB2.ShftSec ;
	Grind2.ShiftMin := GrindFB2.ShftMin ;
	Grind2.ShiftHr := GrindFB2.ShftHr ;
	Grind2.ShiftDay := GrindFB2.ShftDay ;
	Grind2.TotalMLow := GrindFB2.TotMtrs1 ;
	Grind2.TotalMUpp := GrindFB2.TotMtrs2 ;
	Grind2.TotalFtLow := GrindFB2.TotFt1 ;
	Grind2.TotalFtUpp := GrindFB2.TotFt2 ;
	Grind2.ShiftMLow := GrindFB2M.ShftMtrs1 ;
	Grind2.ShiftMUpp := GrindFB2M.ShftMtrs2 ;
	Grind2.ShiftFtLow := GrindFB2.ShftFt1 ;
	Grind2.ShiftFtUpp := GrindFB2.ShftFt2 ;
	
	//COMPARE SHIFT METERS AND SET WARNING WHEN GREATER
	Meterage1 := FB_HIDE;
	Meterage2 := FB_HIDE;
	Warn.Timeout[30] := FALSE;
	Warn.Timeout[31] := FALSE;
	IF (Grind1.ShiftMLow > TrackDelayPT.PTTrack913) THEN
		Meterage1 := FB_SHOW;
		Warn.Timeout[30] := TRUE;
	END_IF
	IF (Grind2.ShiftMLow > TrackDelayPT.PTTrack922) THEN
		Meterage2 := FB_SHOW;
		Warn.Timeout[31] := TRUE;
	END_IF
	
	//PIECE COUNT
	IF EDGENEG(Seaming.Stop2) AND(Control.Achieved1) THEN
		Data.TotalPiece := Data.TotalPiece + 1 ;
		Data.ShiftPiece := Data.ShiftPiece + 1 ;
	END_IF

	//RESET TOTAL
	IF (Reset.Total) THEN
		Data.TotalPiece := 0 ;
	END_IF

	//RESET SHIFT TOTAL
	IF (Reset.Count) THEN
		Data.ShiftPiece := 0 ;
	END_IF

END_PROGRAM


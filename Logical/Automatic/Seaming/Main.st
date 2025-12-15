
PROGRAM _CYCLIC

	//SEAMER 1
	IF (ProcessMode.In) THEN
		//BELT 1 TIMING CONTROL
		Belt1.PT_On := TrackDelayPT.PTTrack004 ;
		Belt1.PT_Off := TrackDelayPT.PTTrack103 ;
		//BELT 2 TIMING CONTROL
		Belt2.PT_On := TrackDelayPT.PTTrack005 ;
		Belt2.PT_Off :=  TrackDelayPT.PTTrack108 ;
		//BELT 3 TIMING CONTROL
		Belt3.PT_On := TrackDelayPT.PTTrack012 ;
		Belt3.PT_Off := TrackDelayPT.PTTrack114 ;
		//BELT 4 TIMING CONTROL
		Belt4.PT_On := TrackDelayPT.PTTrack013 ;
		Belt4.PT_Off :=  TrackDelayPT.PTTrack115 ;
	ELSE
		//BELT 1 TIMING CONTROL
		Belt1.PT_On := PresetSeam.BeltOn[1] ;
		Belt1.PT_Off := PresetSeam.BeltOff[1] ;
		//BELT 2 TIMING CONTROL
		Belt2.PT_On := PresetSeam.BeltOn[2] ;
		Belt2.PT_Off :=  PresetSeam.BeltOff[2] ;
		//BELT 3 TIMING CONTROL
		Belt3.PT_On := PresetSeam.BeltOn[3] ;
		Belt3.PT_Off := PresetSeam.BeltOff[3] ;
		//BELT 4 TIMING CONTROL
		Belt4.PT_On := PresetSeam.BeltOn[4] ;
		Belt4.PT_Off :=  PresetSeam.BeltOff[4] ;
	END_IF
	Belt1 ();
	Belt2 ();
	Belt3 ();
	Belt4 ();

	//START DELAY BEFORE ON
	IF EDGEPOS(Seaming.Start1) AND(Control.Achieved1) THEN
		Belt1.ONStart := TRUE ;
		Belt2.ONStart := TRUE ;
		Belt3.ONStart := TRUE ;
		Belt4.ONStart := TRUE ;
	ELSE
		Belt1.ONStart := FALSE ;
		Belt2.ONStart := FALSE ;
		Belt3.ONStart := FALSE ;
		Belt4.ONStart := FALSE ;
	END_IF
	//START DELAY BEFORE OFF
	IF EDGEPOS(Seaming.Stop1) AND(Control.Achieved1) THEN
		Belt1.OFFStart := TRUE ;
		Belt2.OFFStart := TRUE ;
		Belt3.OFFStart := TRUE ;
		Belt4.OFFStart := TRUE ;
	ELSE
		Belt1.OFFStart :=  FALSE ;
		Belt2.OFFStart := FALSE ;
		Belt3.OFFStart :=  FALSE ;
		Belt4.OFFStart := FALSE ;
	END_IF
	//ESTOP INPUT
	IF(Control.ESClear) OR(EMO.StartLatch) THEN 
		Belt1.EStop := TRUE ;
		Belt2.EStop := TRUE ;
		Belt3.EStop := TRUE ;
		Belt4.EStop := TRUE ;
	ELSE
		Belt1.EStop := FALSE ;
		Belt2.EStop := FALSE ;
		Belt3.EStop := FALSE ;
		Belt4.EStop := FALSE ;
	END_IF
	//END CONDITIONS
	IF EDGENEG(Track104.Done) THEN
		Belt1.End := TRUE ;
		Belt2.End := TRUE ;
		Belt3.End := TRUE ;
		Belt4.End := TRUE ;
	ELSE
		Belt1.End := FALSE ;
		Belt2.End := FALSE ;
		Belt3.End := FALSE ;
		Belt4.End := FALSE ;
	END_IF
	//OUTPUTS
	IF(Seamers.Enable[1]) THEN
		IF(Belt1.Out) AND NOT(Control.ESClear) THEN
			Sol1Blt1.Auto := TRUE ;
		ELSE
			Sol1Blt1.Auto := FALSE ;
		END_IF
		IF(Belt2.Out) AND NOT(Control.ESClear) THEN
			Sol2Blt2.Auto := TRUE ;
		ELSE
			Sol2Blt2.Auto := FALSE ;
		END_IF
		IF(Belt3.Out) AND NOT(Control.ESClear) THEN
			Sol3Blt3.Auto := TRUE ;
		ELSE
			Sol3Blt3.Auto := FALSE ;
		END_IF
		IF(Belt4.Out) AND NOT(Control.ESClear) THEN
			Sol4Blt4.Auto := TRUE ;
		ELSE
			Sol4Blt4.Auto := FALSE ;
		END_IF
	END_IF
	//CALCULATION OF BELTS COMPLETE 
	IF NOT(Seaming.Stop1) THEN
		Belts1.Done := FALSE ;
		Belts1.Start := FALSE ;
	END_IF
	IF(Seaming.Stop1) AND(Control.Achieved1) THEN
		Belts1.Start := TRUE ;
	END_IF
	IF (Belts1.Start)THEN
		IF NOT((Belt1.Out) OR(Belt2.Out) OR(Belt3.Out) OR(Belt4.Out)) THEN
			Belts1.Done := TRUE ;
		END_IF
	END_IF

	//SEAMER 2
	IF (ProcessMode.In) THEN
		//BELT 5 TIMING CONTROL
		Belt5.PT_On := TrackDelayPT.PTTrack203 ;
		Belt5.PT_Off := TrackDelayPT.PTTrack501 ;
		//BELT 6 TIMING CONTROL
		Belt6.PT_On := TrackDelayPT.PTTrack208 ;
		Belt6.PT_Off :=  TrackDelayPT.PTTrack901 ;
		//BELT 7 TIMING CONTROL
		Belt7.PT_On := TrackDelayPT.PTTrack302 ;
		Belt7.PT_Off := TrackDelayPT.PTTrack911 ;
		//BELT 8 TIMING CONTROL
		Belt8.PT_On := TrackDelayPT.PTTrack402 ;
		Belt8.PT_Off :=  TrackDelayPT.PTTrack912 ;
	ELSE
		//BELT 5 TIMING CONTROL
		Belt5.PT_On := PresetSeam.BeltOn[5] ;
		Belt5.PT_Off := PresetSeam.BeltOff[5] ;
		//BELT 6 TIMING CONTROL
		Belt6.PT_On := PresetSeam.BeltOn[6] ;
		Belt6.PT_Off :=  PresetSeam.BeltOff[6] ;
		//BELT 7 TIMING CONTROL
		Belt7.PT_On := PresetSeam.BeltOn[7] ;
		Belt7.PT_Off := PresetSeam.BeltOff[7] ;
		//BELT 8 TIMING CONTROL
		Belt8.PT_On := PresetSeam.BeltOn[8] ;
		Belt8.PT_Off :=  PresetSeam.BeltOff[8] ;
	END_IF
	Belt5 ();
	Belt6 ();
	Belt7 ();
	Belt8 ();

	//START DELAY BEFORE ON
	IF EDGEPOS(Seaming.Start2) AND(Control.Achieved1) THEN
		Belt5.ONStart := TRUE ;
		Belt6.ONStart := TRUE ;
		Belt7.ONStart := TRUE ;
		Belt8.ONStart := TRUE ;
	ELSE
		Belt5.ONStart := FALSE ;
		Belt6.ONStart := FALSE ;
		Belt7.ONStart := FALSE ;
		Belt8.ONStart := FALSE ;
	END_IF
	//START DELAY BEFORE OFF
	IF EDGEPOS(Seaming.Stop2) AND(Control.Achieved1) THEN
		Belt5.OFFStart := TRUE ;
		Belt6.OFFStart := TRUE ;
		Belt7.OFFStart := TRUE ;
		Belt8.OFFStart := TRUE ;
	ELSE
		Belt5.OFFStart :=  FALSE ;
		Belt6.OFFStart := FALSE ;
		Belt7.OFFStart :=  FALSE ;
		Belt8.OFFStart := FALSE ;
	END_IF
	//ESTOP INPUT
	IF(Control.ESClear) OR(EMO.StartLatch) THEN 
		Belt5.EStop := TRUE ;
		Belt6.EStop := TRUE ;
		Belt7.EStop := TRUE ;
		Belt8.EStop := TRUE ;
	ELSE
		Belt5.EStop := FALSE ;
		Belt6.EStop := FALSE ;
		Belt7.EStop := FALSE ;
		Belt8.EStop := FALSE ;
	END_IF
	//END CONDITIONS
	IF EDGENEG(Track204.Done) THEN
		Belt5.End := TRUE ;
		Belt6.End := TRUE ;
		Belt7.End := TRUE ;
		Belt8.End := TRUE ;
	ELSE
		Belt5.End := FALSE ;
		Belt6.End := FALSE ;
		Belt7.End := FALSE ;
		Belt8.End := FALSE ;
	END_IF
	//OUTPUTS
	IF(Seamers.Enable[2]) THEN
		IF(Belt5.Out) AND NOT(Control.ESClear) THEN
			Sol10Blt5.Auto := TRUE ;
		ELSE
			Sol10Blt5.Auto := FALSE ;
		END_IF
		IF(Belt6.Out) AND NOT(Control.ESClear) THEN
			Sol11Blt6.Auto := TRUE ;
		ELSE
			Sol11Blt6.Auto := FALSE ;
		END_IF
		IF(Belt7.Out) AND NOT(Control.ESClear) THEN
			Sol12Blt7.Auto := TRUE ;
		ELSE
			Sol12Blt7.Auto := FALSE ;
		END_IF
		IF(Belt8.Out) AND NOT(Control.ESClear) THEN
			Sol13Blt8.Auto := TRUE ;
		ELSE
			Sol13Blt8.Auto := FALSE ;
		END_IF
	END_IF
	//CALCULATION OF BELTS COMPLETE 
	IF NOT(Seaming.Stop2) THEN
		Belts2.Done := FALSE ;
		Belts2.Start := FALSE ;
	END_IF
	IF(Seaming.Stop2) AND(Control.Achieved1) THEN
		Belts2.Start := TRUE ;
	END_IF
	IF (Belts2.Start)THEN
		IF NOT((Belt5.Out) OR(Belt6.Out) OR(Belt7.Out) OR(Belt8.Out)) THEN
			Belts2.Done := TRUE ;
		END_IF
	END_IF
	
	//SECTION TO INHIBIT INDIVIDUAL EDGE GRINDING
	IF(SeamBlock[1]) THEN
		Sol1Blt1.Auto := FALSE ;
		Sol2Blt2.Auto := FALSE ;
	END_IF
	IF(SeamBlock[2]) THEN
		Sol3Blt3.Auto := FALSE ;
		Sol4Blt4.Auto := FALSE ;
	END_IF
	IF(SeamBlock[3]) THEN
		Sol10Blt5.Auto := FALSE ;
		Sol11Blt6.Auto := FALSE ;
	END_IF
	IF(SeamBlock[4]) THEN
		Sol12Blt7.Auto := FALSE ;
		Sol13Blt8.Auto := FALSE ;
	END_IF
	
END_PROGRAM

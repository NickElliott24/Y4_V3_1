
PROGRAM _CYCLIC

	//BLOCK SEEK AND FIND OPERATION - AXIS 1
	Ax1.Blocks[0] := Track101.Active ;
	Ax1.Blocks[1] := Track102.Active ;
	Ax1.Blocks[2] := Track103.Active ;
	Ax1.Blocks[3] := Track104.Active ;
	Ax1.Blocks[8] := Control.ESClear ;
	Ax1.Blocks[9] := NOT(ArmsTemp1.DownDone) ;
	IF NOT(Control.Test) THEN
		Ax1.Blocks[10] := NOT(Ax1.OriginSet) ;
		Ax1.Blocks[11] := NOT(Control.Achieved1) ;
	ELSE
		Ax1.Blocks[10] := FALSE ;
		Ax1.Blocks[11] := FALSE ;
	END_IF
	
	//CHECK ARRAY FOR ON CONDITIONS
	FOR i:= 0 TO 12 DO
		IF Ax1.Blocks[i] = TRUE THEN
			Ax1.Block	:= 	TRUE	;
			EXIT							;
		ELSE 
			Ax1.Block	:= 	FALSE	;
		END_IF
	END_FOR

	CASE Perms.HiVolume OF
		OFF:	// High Volume mode not selected
			Ax1.HiVol	:=	FALSE	;
		ON:		//High Volume mode selected
			IF EDGEPOS(Ax1.SeekFin) THEN
				Ax1.HiVol	:=	TRUE ;	//Latch On High Volume mode after first seek.
			END_IF
	END_CASE
	
	//BLOCK SEEK AND FIND OPERATION - AXIS 2
	Ax2.Blocks[0] := Track201.Active ;
	Ax2.Blocks[1] := Track202.Active ;
	Ax2.Blocks[2] := Track203.Active ;
	Ax2.Blocks[2] := Track204.Active ;
	Ax2.Blocks[8] := Control.ESClear ;
	Ax2.Blocks[9] := NOT(ArmsTemp2.DownDone) ;
	IF NOT(Control.Test) THEN
		Ax2.Blocks[10] := NOT(Ax2.OriginSet) ;
		Ax2.Blocks[11] := NOT(Control.Achieved1) ;
	ELSE
		Ax2.Blocks[10] := FALSE ;
		Ax2.Blocks[11] := FALSE ;
	END_IF
	Ax2.Blocks[12] := (S53Reed.In) OR NOT(S52Reed.In) ;
	
	//Check Array for conditions
	FOR i:= 0 TO 12 DO
		IF Ax2.Blocks[i] = TRUE THEN
			Ax2.Block	:= 	TRUE	;
			EXIT							;
		ELSE 
			Ax2.Block	:= 	FALSE	;
		END_IF
	END_FOR
	
	CASE Perms.HiVolume OF
		OFF:	// High Volume mode not selected
			Ax2.HiVol	:=	FALSE	;
		ON:		//High Volume mode selected
			IF EDGEPOS(Ax2.SeekFin) THEN
				Ax2.HiVol	:=	TRUE ;	//Latch On High Volume mode after first seek.
			END_IF
	END_CASE
	
END_PROGRAM

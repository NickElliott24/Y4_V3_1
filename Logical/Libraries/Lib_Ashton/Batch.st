
//ROW BUILDING CALCULATIONS
FUNCTION_BLOCK Batch

	//RESET
	Done := FALSE ;
	
	//CAPTURE NEXT WIDTH TO ADD TO ROW
	IF(FollowingIN[0] > 0)THEN
		NextINT := FollowingIN[0] ;
	END_IF

	//PERFORM CALCULATION AS GLASS ARRIVES
	IF EDGENEG(Calculate) AND(Current > 0) THEN
		Current := Current + NextINT + Gap ;
		NextINT := 0 ;
	END_IF

	IF EDGENEG(Calculate) AND(Current = 0) THEN
		Current := NextINT ;
		NextINT := 0 ;
	END_IF

	//CALCULATE COMBINED SIZE WITH FOLLOWING PIECE. IF NO PIECE WAIT UNTIL MEASURED.
	FOR i := 0 TO 9 DO
		IF(FollowingIN[i] > 0) THEN
			Next := FollowingIN[i] ;
			EXIT;
		ELSE
			Next := 0 ;
		END_IF
	END_FOR
	
	//CALCULATE WHEN COMPLETE
	CASE Type OF
		ROW:
			MinRemaining :=  Gap + 150.0 ;
		LOAD:
			MinRemaining :=  Gap + 300.0 ;
	END_CASE
	CASE BatchMode OF
		AUTO:
			IF(Building) THEN
				NextSize := Current + Next + Gap ;
				Remaining	:=	MaxSize - Current ;
				IF(MinRemaining > Remaining) OR(NextSize > MaxSize) THEN	
					Done := TRUE ;
				END_IF
			END_IF
		SINGLE:
			IF(Building) THEN
				Done := TRUE ;
			END_IF
		TWOS:
			CASE Type OF
				ROW:
					IF(Building) THEN
						Done := TRUE ;
					END_IF
				LOAD:
					IF NOT(Building) THEN
						DoubleCount := 0 ;
					END_IF
					IF(Building) THEN
						NextSize := Current + Next + Gap ;
						Remaining	:=	MaxSize - Current ;
						IF(MinRemaining > Remaining) OR(NextSize > MaxSize) THEN	
							Done := TRUE ;
							DoubleCount := 2 ;
						END_IF
					END_IF
					IF EDGENEG(Calculate) AND(DoubleCount=1) THEN
						DoubleCount := 2 ;
					END_IF
					IF EDGENEG(Calculate) AND(DoubleCount=0) THEN
						DoubleCount := 1 ;
					END_IF
					IF(DoubleCount=2) THEN
						Done := TRUE ;
					END_IF
			END_CASE
		PAIRS:
			CASE Type OF
				ROW:
					IF NOT(Building) THEN
						DoubleCount := 0 ;
					END_IF
					IF(Building) THEN
						NextSize := Current + Next + Gap ;
						Remaining	:=	MaxSize - Current ;
						IF(MinRemaining > Remaining) OR(NextSize > MaxSize) THEN	
							Done := TRUE ;
							DoubleCount := 2 ;
						END_IF
					END_IF
					IF EDGENEG(Calculate) AND(DoubleCount=1) THEN
						DoubleCount := 2 ;
					END_IF
					IF EDGENEG(Calculate) AND(DoubleCount=0) THEN
						DoubleCount := 1 ;
					END_IF
					IF(DoubleCount=2) THEN
						Done := TRUE ;
					END_IF
				LOAD:
					IF(Building) THEN
						Done := TRUE ;
					END_IF
			END_CASE
		FOURS:
			IF NOT(Building) THEN
				DoubleCount := 0 ;
			END_IF
			IF(Building) THEN
				NextSize := Current + Next + Gap ;
				Remaining	:=	MaxSize - Current ;
				IF(MinRemaining > Remaining) OR(NextSize > MaxSize) THEN	
					Done := TRUE ;
					DoubleCount := 2 ;
				END_IF
			END_IF
			IF EDGENEG(Calculate) AND(DoubleCount=1) THEN
				DoubleCount := 2 ;
			END_IF
			IF EDGENEG(Calculate) AND(DoubleCount=0) THEN
				DoubleCount := 1 ;
			END_IF
			IF(DoubleCount=2) THEN
				Done := TRUE ;
			END_IF
	END_CASE
	
	//RESET WHEN NOT ROW BUILDING
	IF NOT(Building) THEN
		Current := 0.0 ;
		Longest := 0.0 ;
		Remaining := MaxSize ;
	END_IF
	
	IF EDGEPOS(ClearIN) THEN
		Done := TRUE ;
	END_IF

	//CAPTURE NEXT LENGTH
	IF(LengthIN > 0)THEN
		NextLengthINT := LengthIN ;
	END_IF

	//CALCULATE LONGEST IN ROW
	IF EDGENEG(Calculate) AND(NextLengthINT>=0) THEN
		IF(NextLengthINT > Longest) THEN
			Longest := NextLengthINT ;
		END_IF
		NextLengthINT := 0 ;
	END_IF

	//CALCULATE CENTERING TIME
	Center.WidthIn := Current ;
	Center.Speed := CenterSpeed	 ;
	Center.Centre := CenterDist ;
	Center ();
	CenterPT := (Center.PT * 10) ;

END_FUNCTION_BLOCK

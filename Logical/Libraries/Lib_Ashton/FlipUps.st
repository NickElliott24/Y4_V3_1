
//FLIP UP ARMS CONTROL
FUNCTION_BLOCK FlipUps

	//CHECK ALL ARMS ARE DOWN BEFORE SEEK AND FIND
	DownDone := FALSE ;

	FOR i := 1 TO (USINT_TO_INT(Arms * 2)) DO
		IF NOT(Down[i]) THEN
			EXIT ;
		ELSIF (i = (USINT_TO_INT(Arms) * 2)) THEN
			DownDone := TRUE ;
		END_IF
	END_FOR

	IF EDGEPOS(Raise) AND NOT(HiVol) THEN
		FOR i := Arms TO 0 BY -1 DO
			IF (ActPos > ArmPos[i]) THEN
				CheckRaised := INT_TO_USINT(i) ; 
				EXIT ;
			END_IF
		END_FOR	
	END_IF

	IF(HiVol) THEN
		FOR i := Arms TO 0 BY -1 DO
			IF (ActPos > ArmPos[i]) THEN
				CheckRaised := INT_TO_USINT(i) ; 
				EXIT ;
			END_IF
		END_FOR	
	END_IF

	//RESET OUTPUTS
	FOR i := 0 TO 5 DO
		OUT[i]:= FALSE ;
	END_FOR
	
	//REQUIREMENTS FOR ARMS TO HOLD UP
	IF(Raise) OR(HiVol) THEN
		CASE CheckRaised OF
			0:	//NO ARMS UP
				UpDone := TRUE ;
			1:	//1 ARM UP
				OUT[1] := TRUE ;	
			2:	//2 ARMS UP
				OUT[1] := TRUE ;
				OUT[2] := TRUE ;
			3:	//3 ARMS UP
				OUT[1] := TRUE ;
				OUT[2] := TRUE ;
				OUT[3] := TRUE ;
			4:	//4 ARMS UP
				OUT[1] := TRUE ;
				OUT[2] := TRUE ;
				OUT[3] := TRUE ;
				OUT[4] := TRUE ;
			5:	//5 ARMS UP
				OUT[1] := TRUE ;
				OUT[2] := TRUE ;
				OUT[3] := TRUE ;
				OUT[4] := TRUE ;
				OUT[5] := TRUE ;
		END_CASE
	END_IF

	//VERFIY SELECTED ARMS ARE IN THE UP POSITION
	IF(Raise) AND NOT(UpDone) THEN
		FOR i := 1 TO (CheckRaised * 2) DO
			IF NOT(Up[i]) THEN
				EXIT	;
			ELSIF (i = (CheckRaised * 2)) THEN
				UpDone := TRUE ;
			END_IF
		END_FOR
	END_IF	

	//RESET CONDITIONS BEFORE NEXT SEEK AND FIND
	IF NOT(Raise) THEN
		CheckRaised := 0 ;
		UpDone :=	FALSE ;
	END_IF

END_FUNCTION_BLOCK

(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: TrackingSection.st
 * Author: nicke
 ********************************************************************)


//TRACKING SECTION CONTROLS
FUNCTION_BLOCK TrackingSection

	//INDEX FOR TRACKBITS CONTROL
	Index	:=	IndexIN	;
	
	IF(Index > 0) THEN
		//VISUALISATION DISPLAY CONTROLS
		BusyDisp	:=	FB_SHOW	;
		//OUTPUT CONDITIONS
		Busy	:=	TRUE	;
	ELSE
		BusyDisp	:= 	FB_HIDE	;
		Busy	:=	FALSE	;
	END_IF
	//HIDE DURING ESTOP RECOVERY
	IF(ESDispInhib) THEN
		BusyDisp	:= 	FB_HIDE	;
	END_IF	
	
	IF(Busy) THEN
		//CHECK ARRAY FOR ON CONDITIONS
		IF NOT(BlockInhib) THEN
			FOR i:= 0 TO 12 DO
				IF Blocks[i] = TRUE THEN
					Blocked	:= 	TRUE	;
					EXIT;
				ELSE 
					IF NOT(ControlIN) THEN
						Blocked	:= 	TRUE	;
					ELSE
						Blocked	:= 	FALSE	;
					END_IF
				END_IF
			END_FOR
		ELSE
			Blocked	:=	FALSE	;
		END_IF

		//DATA FOR TRANSFER TO NEXT SECTION
		Width	:=	WidthIN	;
		Length	:=	LengthIN	;
		Longest	:=	LongestIN	;
		RowBlock	:=	RowBlockIN	;
		Change	:=	ChangeIN	;
		ArrissUpper	:=	ArrissUpperIN	;
		ArrissLower	:=	ArrissLowerIN	;
		EdgeDelete	:=	EdgeDeleteIN	;
		VerticalBelt	:=	VerticalBeltIN	;
		BatchClear := BatchClearIN ;
		//FIXED VALUES WHILE BUSY
		FixedOUT.Control	:=	ControlIN	;
		FixedOUT.ESClearing	:=	Cleared	;
		FixedOUT.EMOStart := EMOStart ;
		FixedOUT.ESClear := ESClear ;
	
		//RESET CONDITIONS FROM MIMIC (> OPERATOR LEVEL) OR ESTOP RECOVERY
		IF(ResMan) OR(ResES) THEN
			IndexIN	:= 0 ;
			Index := 0 ;
			WidthIN	:= 0.0	;
			Width := 0.0 ;
			LengthIN :=	0.0	;
			Length := 0.0 ;
			LongestIN := 0.0 ;
			Longest := 0.0 ;
			RowBlockIN := FALSE ;
			ChangeIN :=	FALSE ;
			ArrissUpperIN := FALSE ;
			ArrissLowerIN := FALSE ;
			EdgeDeleteIN :=	FALSE ;
			VerticalBeltIN := FALSE	;
			BatchClearIN := FALSE ;
			BatchClear := FALSE ;
		END_IF
	ELSE
		WidthIN	:=	0.0	;
		Width := 0.0 ;
		LengthIN :=	0.0	;
		Length := 0.0 ;
		LongestIN := 0.0 ;
		Longest := 0.0 ;
		RowBlockIN :=	FALSE	;
		ChangeIN :=	FALSE	;
		ArrissUpperIN	:=	FALSE	;
		ArrissLowerIN	:=	FALSE	;
		EdgeDeleteIN	:=	FALSE	;
		VerticalBeltIN	:=	FALSE	;
		BatchClearIN := FALSE ;
		BatchClear := FALSE ;
		Blocked	:=	FALSE	;
		FixedOUT.Control	:=	FALSE	;
		FixedOUT.ESClearing	:=	FALSE	;
		FixedOUT.ESClear := FALSE ;
	END_IF

	IF EDGEPOS(Busy) THEN
		PreviousTime	:=	CurrentTime	;
		CurrentTime		:=	clock_ms()	;
		ElapsedTime		:=	TIME_TO_UDINT(CurrentTime - PreviousTime)	;
	END_IF
		
	Cycle	:=	UDINT_TO_REAL(ElapsedTime/1000)	;
	
END_FUNCTION_BLOCK

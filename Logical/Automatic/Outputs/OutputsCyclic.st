(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Outputs
 * File: OutputsCyclic.st
 ********************************************************************
 * Implementation of program Outputs
 ********************************************************************)

PROGRAM _CYCLIC

    //INDIVIDUAL LEG TEST CONTROL
	CASE LegTest.Index OF
		TEST_OFF:
			LegTest.Index := LIMIT(TEST_OFF,LegTest.Index, TEST_ON_STOP) ;
			LegTest.Disp := HIDE ;
		TEST_ON_STOP:
			LegTest.Index := LIMIT(TEST_OFF,LegTest.Index, TEST_LEG4) ;
			CL1.Inv.Test := 0 ;
			CS1.Inv.Test := 0 ;
			CV1.Inv.Test := 0 ;
			CC1.Inv.Test := 0 ;
			CC2.Inv.Test := 0 ;
			CS2.Inv.Test := 0 ;
			CV2.Inv.Test := 0 ;
			CC3.Inv.Test := 0 ;
			CC4.Inv.Test := 0 ;
			CB1.Inv.Test := 0 ;
			CB2.Inv.Test := 0 ;
			CRB.Inv.Test := 0 ;
			CRE.Inv.Test := 0 ;
			CLB.Inv.Test := 0 ;
			LegTest.Disp := SHOW ;
		TEST_LEG1:
			CL1.Inv.Test := 4 ;
			CS1.Inv.Test := 4 ;
			CV1.Inv.Test := 4 ;
			CC1.Inv.Test := 4 ;
			LegTest.Disp := SHOW ;
		TEST_LEG2:
			CC2.Inv.Test := 4 ;
			CS2.Inv.Test := 4 ;
			CV2.Inv.Test := 4 ;
			CC3.Inv.Test := 4 ;
			LegTest.Disp := SHOW ;
		TEST_LEG3:
			CC4.Inv.Test := 4 ;
			CB1.Inv.Test := 4 ;
			CB2.Inv.Test := 4 ;
			CRB.Inv.Test := 4 ;
			LegTest.Disp := SHOW ;
		TEST_LEG4:
			CASE InvPerms.CRE.Analog OF
				NO_ANALOG:
					CRE.Inv.Test := 4 ;
					CLB.Inv.Test := 4 ;
				ELSE
					CRE.Inv.Test := 14 ;
					CLB.Inv.Test := 14 ;
			END_CASE
			LegTest.Disp := SHOW ;
	END_CASE

	//CONVEYOR TEST MODES
	//FB INPUTS
	CL1Test.SpeedIN := Speeds ;
	CL1Test.TestSpeedIN := CL1.Inv.SpeedTest ;
	CL1Test.Index := CL1.Inv.Test ;
	CL1Test.AutoSpeedIN := CL1.Inv.Scale1.x ;
	//CALL FB
	CL1Test ();
	//FB OUTPUTS
	CL1.o.Run[3] := CL1Test.Run ;
	CL1.o.Rev[3] := CL1Test.Rev ;
	CL1.Inv.Scale1.x := CL1Test.Speed ;

	//FB INPUTS
	CS1Test.SpeedIN := Speeds ;
	CS1Test.TestSpeedIN := CS1.Inv.SpeedTest ;
	CS1Test.Index := CS1.Inv.Test ;
	CS1Test.AutoSpeedIN := CS1.Inv.Scale1.x ;
	//CALL FB
	CS1Test ();
	//FB OUTPUTS
	CS1.o.Run[3] := CS1Test.Run ;
	CS1.o.Rev[3] := CS1Test.Rev ;
	CS1.Inv.Scale1.x := CS1Test.Speed ;

	//FB INPUTS
	CV1Test.SpeedIN := Speeds ;
	CV1Test.TestSpeedIN := CV1.Inv.SpeedTest ;
	CV1Test.Index := CV1.Inv.Test ;
	CV1Test.AutoSpeedIN := CV1.Inv.Scale1.x ;
	//CALL FB
	CV1Test ();
	//FB OUTPUTS
	CV1.o.Run[3] := CV1Test.Run ;
	CV1.o.Rev[3] := CV1Test.Rev ;
	CV1.Inv.Scale1.x := CV1Test.Speed ;

	//FB INPUTS
	CC1Test.SpeedIN := Speeds ;
	CC1Test.TestSpeedIN := CC1.Inv.SpeedTest ;
	CC1Test.Index := CC1.Inv.Test ;
	CC1Test.AutoSpeedIN := CC1.Inv.Scale1.x ;
	//CALL FB
	CC1Test ();
	//FB OUTPUTS
	CC1.o.Run[3] := CC1Test.Run ;
	CC1.o.Rev[3] := CC1Test.Rev ;
	CC1.Inv.Scale1.x := CC1Test.Speed ;

	//FB INPUTS
	CC2Test.SpeedIN := Speeds ;
	CC2Test.TestSpeedIN := CC2.Inv.SpeedTest ;
	CC2Test.Index := CC2.Inv.Test ;
	CC2Test.AutoSpeedIN := CC2.Inv.Scale1.x ;
	//CALL FB
	CC2Test ();
	//FB OUTPUTS
	CC2.o.Run[3] := CC2Test.Run ;
	CC2.o.Rev[3] := CC2Test.Rev ;
	CC2.Inv.Scale1.x := CC2Test.Speed ;

	//FB INPUTS
	CS2Test.SpeedIN := Speeds ;
	CS2Test.TestSpeedIN := CS2.Inv.SpeedTest ;
	CS2Test.Index := CS2.Inv.Test ;
	CS2Test.AutoSpeedIN := CS2.Inv.Scale1.x ;
	//CALL FB
	CS2Test ();
	//FB OUTPUTS
	CS2.o.Run[3] := CS2Test.Run ;
	CS2.o.Rev[3] := CS2Test.Rev ;
	CS2.Inv.Scale1.x := CS2Test.Speed ;

	//FB INPUTS
	CV2Test.SpeedIN := Speeds ;
	CV2Test.TestSpeedIN := CV2.Inv.SpeedTest ;
	CV2Test.Index := CV2.Inv.Test ;
	CV2Test.AutoSpeedIN := CV2.Inv.Scale1.x ;
	//CALL FB
	CV2Test ();
	//FB OUTPUTS
	CV2.o.Run[3] := CV2Test.Run ;
	CV2.o.Rev[3] := CV2Test.Rev ;
	CV2.Inv.Scale1.x := CV2Test.Speed ;

	//FB INPUTS
	CC3Test.SpeedIN := Speeds ;
	CC3Test.TestSpeedIN := CC3.Inv.SpeedTest ;
	CC3Test.Index := CC3.Inv.Test ;
	CC3Test.AutoSpeedIN := CC3.Inv.Scale1.x ;
	//CALL FB
	CC3Test ();
	//FB OUTPUTS
	CC3.o.Run[3] := CC3Test.Run ;
	CC3.o.Rev[3] := CC3Test.Rev ;
	CC3.Inv.Scale1.x := CC3Test.Speed ;

	//FB INPUTS
	CC4Test.SpeedIN := Speeds ;
	CC4Test.TestSpeedIN := CC4.Inv.SpeedTest ;
	CC4Test.Index := CC4.Inv.Test ;
	CC4Test.AutoSpeedIN := CC4.Inv.Scale1.x ;
	//CALL FB
	CC4Test ();
	//FB OUTPUTS
	CC4.o.Run[3] := CC4Test.Run ;
	CC4.o.Rev[3] := CC4Test.Rev ;
	CC4.Inv.Scale1.x := CC4Test.Speed ;

	//FB INPUTS
	CB1Test.SpeedIN := Speeds ;
	CB1Test.TestSpeedIN := CB1.Inv.SpeedTest ;
	CB1Test.Index := CB1.Inv.Test ;
	CB1Test.AutoSpeedIN := CB1.Inv.Scale1.x ;
	//CALL FB
	CB1Test ();
	//FB OUTPUTS
	CB1.o.Run[3] := CB1Test.Run ;
	CB1.o.Rev[3] := CB1Test.Rev ;
	CB1.Inv.Scale1.x := CB1Test.Speed ;

	//FB INPUTS
	CB2Test.SpeedIN := Speeds ;
	CB2Test.TestSpeedIN := CB2.Inv.SpeedTest ;
	CB2Test.Index := CB2.Inv.Test ;
	CB2Test.AutoSpeedIN := CB2.Inv.Scale1.x ;
	//CALL FB
	CB2Test ();
	//FB OUTPUTS
	CB2.o.Run[3] := CB2Test.Run ;
	CB2.o.Rev[3] := CB2Test.Rev ;
	CB2.Inv.Scale1.x := CB2Test.Speed ;

	//FB INPUTS
	CRBTest.SpeedIN := Speeds ;
	CRBTest.TestSpeedIN := CRB.Inv.SpeedTest ;
	CRBTest.Index := CRB.Inv.Test ;
	CRBTest.AutoSpeedIN := CRB.Inv.Scale1.x ;
	//CALL FB
	CRBTest ();
	//FB OUTPUTS
	CRB.o.Run[3] := CRBTest.Run ;
	CRB.o.Rev[3] := CRBTest.Rev ;
	CRB.Inv.Scale1.x := CRBTest.Speed ;

	//FB INPUTS
	CRETest.SpeedIN := Speeds ;
	CRETest.TestSpeedIN := CRE.Inv.SpeedTest ;
	CRETest.Index := CRE.Inv.Test ;
	CRETest.AutoSpeedIN := CRE.Inv.Scale1.x ;
	//CALL FB
	CRETest ();
	//FB OUTPUTS
	CRE.o.Run[3] := CRETest.Run ;
	CRE.o.Rev[3] := CRETest.Rev ;
	CRE.Inv.Scale1.x := CRETest.Speed ;

	//FB INPUTS
	CLBTest.SpeedIN := Speeds ;
	CLBTest.TestSpeedIN := CLB.Inv.SpeedTest ;
	CLBTest.AnalogSpeedIN := CLB.SpeedAnalog ;
	CLBTest.Index := CLB.Inv.Test ;
	CLBTest.AutoSpeedIN := CLB.Inv.Scale1.x ;
	//CALL FB
	CLBTest ();
	//FB OUTPUTS
	CLB.o.Run[3] := CLBTest.Run ;
	CLB.o.Rev[3] := CLBTest.Rev ;
	CLB.Inv.Scale1.x := CLBTest.Speed ;

	//------------------------------------------------------
	//CONVEYOR CONTROL
	IF NOT(Control.Test) THEN
		IF NOT(Control.Achieved1) OR(Control.ESClear) THEN
			FOR i:= 0 TO 5 DO
				CL1.o.Run[i]   :=  FALSE   ;
				CL1.o.Rev[i]   :=  FALSE   ;
				CS1.o.Run[i]   :=  FALSE   ;
				CS1.o.Rev[i]   :=  FALSE   ;
				CV1.o.Run[i]   :=  FALSE   ;
				CV1.o.Rev[i]   :=  FALSE   ;
				CC1.o.Run[i]   :=  FALSE   ;
				CC1.o.Rev[i]   :=  FALSE   ;
				CC2.o.Run[i]   :=  FALSE   ;
				CC2.o.Rev[i]   :=  FALSE   ;
				CS2.o.Run[i]   :=  FALSE   ;
				CS2.o.Rev[i]   :=  FALSE   ;
				CV2.o.Run[i]   :=  FALSE   ;
				CV2.o.Rev[i]   :=  FALSE   ;
				CC3.o.Run[i]   :=  FALSE   ;
				CC3.o.Rev[i]   :=  FALSE   ;
				CC4.o.Run[i]   :=  FALSE   ;
				CC4.o.Rev[i]   :=  FALSE   ;
				CB1.o.Run[i]   :=  FALSE   ;
				CB1.o.Rev[i]   :=  FALSE   ;
				CB2.o.Run[i]   :=  FALSE   ;
				CB2.o.Rev[i]   :=  FALSE   ;
				CRB.o.Run[i]   :=  FALSE   ;
				CRB.o.Rev[i]   :=  FALSE   ;
				CRE.o.Run[i]   :=  FALSE   ;
				CRE.o.Rev[i]   :=  FALSE   ;
				CLB.o.Run[i]   :=  FALSE   ;
				CLB.o.Rev[i]   :=  FALSE   ;
			END_FOR
		END_IF
	END_IF

	FOR i:= 0 TO 5 DO
		IF CL1.o.Run[i] = TRUE THEN
			CL1.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CL1.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CL1.o.Rev[i] = TRUE THEN
			CL1.Output.CMDD_03 :=  TRUE   ;
			CL1.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CL1.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CS1.o.Run[i] = TRUE THEN
			CS1.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CS1.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CS1.o.Rev[i] = TRUE THEN
			CS1.Output.CMDD_03 :=  TRUE   ;
			CS1.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CS1.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CV1.o.Run[i] = TRUE THEN
			CV1.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CV1.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CV1.o.Rev[i] = TRUE THEN
			CV1.Output.CMDD_03 :=  TRUE   ;
			CV1.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CV1.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CC1.o.Run[i] = TRUE THEN
			CC1.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CC1.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CC1.o.Rev[i] = TRUE THEN
			CC1.Output.CMDD_03 :=  TRUE   ;
			CC1.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CC1.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CC2.o.Run[i] = TRUE THEN
			CC2.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CC2.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CC2.o.Rev[i] = TRUE THEN
			CC2.Output.CMDD_03 :=  TRUE   ;
			CC2.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CC2.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CS2.o.Run[i] = TRUE THEN
			CS2.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CS2.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CS2.o.Rev[i] = TRUE THEN
			CS2.Output.CMDD_03 :=  TRUE   ;
			CS2.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CS2.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CV2.o.Run[i] = TRUE THEN
			CV2.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CV2.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CV2.o.Rev[i] = TRUE THEN
			CV2.Output.CMDD_03 :=  TRUE   ;
			CV2.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CV2.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CC3.o.Run[i] = TRUE THEN
			CC3.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CC3.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CC3.o.Rev[i] = TRUE THEN
			CC3.Output.CMDD_03 :=  TRUE   ;
			CC3.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CC3.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CC4.o.Run[i] = TRUE THEN
			CC4.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CC4.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CC4.o.Rev[i] = TRUE THEN
			CC4.Output.CMDD_03 :=  TRUE   ;
			CC4.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CC4.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CB1.o.Run[i] = TRUE THEN
			CB1.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CB1.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CB1.o.Rev[i] = TRUE THEN
			CB1.Output.CMDD_03 :=  TRUE   ;
			CB1.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CB1.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CB2.o.Run[i] = TRUE THEN
			CB2.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CB2.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CB2.o.Rev[i] = TRUE THEN
			CB2.Output.CMDD_03 :=  TRUE   ;
			CB2.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CB2.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CRB.o.Run[i] = TRUE THEN
			CRB.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CRB.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CRB.o.Rev[i] = TRUE THEN
			CRB.Output.CMDD_03 :=  TRUE   ;
			CRB.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CRB.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CRE.o.Run[i] = TRUE THEN
			CRE.Output.CMDD_03 :=  TRUE    ;
			EXIT;
		ELSE
			CRE.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CRE.o.Rev[i] = TRUE THEN
			CRE.Output.CMDD_03 :=  TRUE   ;
			CRE.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CRE.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CLB.o.Run[i] = TRUE THEN
			CLB.Output.CMDD_03 :=  TRUE    ;
			CLB.LastSpeed := (CLB.o.SpeedRef/10) * (ScalePerm.CLBScale/50) ;
			EXIT;
		ELSE
			CLB.Output.CMDD_03 :=  FALSE   ;
		END_IF
	END_FOR

	FOR i:= 0 TO 5 DO
		IF CLB.o.Rev[i] = TRUE THEN
			CLB.Output.CMDD_03 :=  TRUE   ;
			CLB.Output.CMDD_11 :=  TRUE    ;
			EXIT;
		ELSE
			CLB.Output.CMDD_11 :=  FALSE   ;
		END_IF
	END_FOR

END_PROGRAM


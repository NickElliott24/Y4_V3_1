(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: ResetInv
 * File: ResetInv.st
 * Author: nicke
 ********************************************************************
 * Implementation of program ResetInv
 ********************************************************************)

PROGRAM _CYCLIC

    //INVERTER CL1 CONTROLS
    //SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CL1.Inv.Reference1[0].x := 00.0 ;
	CL1.Inv.Reference1[0].y := 00.0 ;
	CL1.Inv.Reference1[1].x := ScalePerm.CL1Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CL1.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CL1.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CL1.SpeedAnalog := ((INT_TO_REAL(CL1.Input.AI1R))/(AnalogPerm.CL1.V1.ActAnalog/AnalogPerm.CL1.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CL1.SpeedAnalog := ((INT_TO_REAL(CL1.Input.AI3R))/(AnalogPerm.CL1.C1.ActAnalog/AnalogPerm.CL1.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CL1.SpeedAnalog := ((INT_TO_REAL(CL1.Input.AI3R)-1638.4)/(AnalogPerm.CL1.C2.ActAnalog/AnalogPerm.CL1.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CL1.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CL1.SpeedAnalog := LIMIT(1, CL1.SpeedAnalog, 60) ;

	CL1.Inv.Scale1.NoOfPoints := 2 ;
	CL1.Inv.Scale1.ptr_table := ADR(CL1.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CL1.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CL1.Input.ETAD_06) THEN
			CL1.Output.CMDD_01 := TRUE ;
			CL1.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CL1.Input.ETAD_04) AND(CL1.Input.ETAD_05) THEN
			CL1.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CL1.Output.CMDD_00 := FALSE ;
		CL1.Output.CMDD_01 := FALSE ;
		CL1.Output.CMDD_02 := FALSE ;
		CL1.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CL1.Inv.Scale1();
	CL1.o.SpeedRef := CL1.Inv.Scale1.y ;
	CL1.Output.LFR := REAL_TO_INT(CL1.o.SpeedRef) ;

	//INVERTER CS1 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CS1.Inv.Reference1[0].x := 00.0 ;
	CS1.Inv.Reference1[0].y := 00.0 ;
	CS1.Inv.Reference1[1].x := ScalePerm.CS1Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CS1.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CS1.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CS1.SpeedAnalog := ((INT_TO_REAL(CS1.Input.AI1R))/(AnalogPerm.CS1.V1.ActAnalog/AnalogPerm.CS1.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CS1.SpeedAnalog := ((INT_TO_REAL(CS1.Input.AI3R))/(AnalogPerm.CS1.C1.ActAnalog/AnalogPerm.CS1.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CS1.SpeedAnalog := ((INT_TO_REAL(CS1.Input.AI3R)-1638.4)/(AnalogPerm.CS1.C2.ActAnalog/AnalogPerm.CS1.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CS1.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CS1.SpeedAnalog := LIMIT(1, CS1.SpeedAnalog, 60) ;

	CS1.Inv.Scale1.NoOfPoints := 2 ;
	CS1.Inv.Scale1.ptr_table := ADR(CS1.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CS1.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CS1.Input.ETAD_06) THEN
			CS1.Output.CMDD_01 := TRUE ;
			CS1.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CS1.Input.ETAD_04) AND(CS1.Input.ETAD_05) THEN
			CS1.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CS1.Output.CMDD_00 := FALSE ;
		CS1.Output.CMDD_01 := FALSE ;
		CS1.Output.CMDD_02 := FALSE ;
		CS1.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CS1.Inv.Scale1();
	CS1.o.SpeedRef := CS1.Inv.Scale1.y ;
	CS1.Output.LFR := REAL_TO_INT(CS1.o.SpeedRef) ;

	//INVERTER CV1 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CV1.Inv.Reference1[0].x := 00.0 ;
	CV1.Inv.Reference1[0].y := 00.0 ;
	CV1.Inv.Reference1[1].x := ScalePerm.CV1Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CV1.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CV1.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CV1.SpeedAnalog := ((INT_TO_REAL(CV1.Input.AI1R))/(AnalogPerm.CV1.V1.ActAnalog/AnalogPerm.CV1.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CV1.SpeedAnalog := ((INT_TO_REAL(CV1.Input.AI3R))/(AnalogPerm.CV1.C1.ActAnalog/AnalogPerm.CV1.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CV1.SpeedAnalog := ((INT_TO_REAL(CV1.Input.AI3R)-1638.4)/(AnalogPerm.CV1.C2.ActAnalog/AnalogPerm.CV1.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CV1.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CV1.SpeedAnalog := LIMIT(1, CV1.SpeedAnalog, 60) ;

	CV1.Inv.Scale1.NoOfPoints := 2 ;
	CV1.Inv.Scale1.ptr_table := ADR(CV1.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CV1.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CV1.Input.ETAD_06) THEN
			CV1.Output.CMDD_01 := TRUE ;
			CV1.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CV1.Input.ETAD_04) AND(CV1.Input.ETAD_05) THEN
			CV1.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CV1.Output.CMDD_00 := FALSE ;
		CV1.Output.CMDD_01 := FALSE ;
		CV1.Output.CMDD_02 := FALSE ;
		CV1.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CV1.Inv.Scale1();
	CV1.o.SpeedRef := CV1.Inv.Scale1.y ;
	CV1.Output.LFR := REAL_TO_INT(CV1.o.SpeedRef) ;

	//INVERTER CC1 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CC1.Inv.Reference1[0].x := 00.0 ;
	CC1.Inv.Reference1[0].y := 00.0 ;
	CC1.Inv.Reference1[1].x := ScalePerm.CC1Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CC1.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CC1.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CC1.SpeedAnalog := ((INT_TO_REAL(CC1.Input.AI1R))/(AnalogPerm.CC1.V1.ActAnalog/AnalogPerm.CC1.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CC1.SpeedAnalog := ((INT_TO_REAL(CC1.Input.AI3R))/(AnalogPerm.CC1.C1.ActAnalog/AnalogPerm.CC1.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CC1.SpeedAnalog := ((INT_TO_REAL(CC1.Input.AI3R)-1638.4)/(AnalogPerm.CC1.C2.ActAnalog/AnalogPerm.CC1.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CC1.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CC1.SpeedAnalog := LIMIT(1, CC1.SpeedAnalog, 60) ;

	CC1.Inv.Scale1.NoOfPoints := 2 ;
	CC1.Inv.Scale1.ptr_table := ADR(CC1.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CC1.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CC1.Input.ETAD_06) THEN
			CC1.Output.CMDD_01 := TRUE ;
			CC1.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CC1.Input.ETAD_04) AND(CC1.Input.ETAD_05) THEN
			CC1.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CC1.Output.CMDD_00 := FALSE ;
		CC1.Output.CMDD_01 := FALSE ;
		CC1.Output.CMDD_02 := FALSE ;
		CC1.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CC1.Inv.Scale1();
	CC1.o.SpeedRef := CC1.Inv.Scale1.y ;
	CC1.Output.LFR := REAL_TO_INT(CC1.o.SpeedRef) ;

	//INVERTER CC2 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CC2.Inv.Reference1[0].x := 00.0 ;
	CC2.Inv.Reference1[0].y := 00.0 ;
	CC2.Inv.Reference1[1].x := ScalePerm.CC2Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CC2.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CC2.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CC2.SpeedAnalog := ((INT_TO_REAL(CC2.Input.AI1R))/(AnalogPerm.CC2.V1.ActAnalog/AnalogPerm.CC2.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CC2.SpeedAnalog := ((INT_TO_REAL(CC2.Input.AI3R))/(AnalogPerm.CC2.C1.ActAnalog/AnalogPerm.CC2.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CC2.SpeedAnalog := ((INT_TO_REAL(CC2.Input.AI3R)-1638.4)/(AnalogPerm.CC2.C2.ActAnalog/AnalogPerm.CC2.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CC2.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CC2.SpeedAnalog := LIMIT(1, CC2.SpeedAnalog, 60) ;

	CC2.Inv.Scale1.NoOfPoints := 2 ;
	CC2.Inv.Scale1.ptr_table := ADR(CC2.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CC2.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CC2.Input.ETAD_06) THEN
			CC2.Output.CMDD_01 := TRUE ;
			CC2.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CC2.Input.ETAD_04) AND(CC2.Input.ETAD_05) THEN
			CC2.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CC2.Output.CMDD_00 := FALSE ;
		CC2.Output.CMDD_01 := FALSE ;
		CC2.Output.CMDD_02 := FALSE ;
		CC2.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CC2.Inv.Scale1();
	CC2.o.SpeedRef := CC2.Inv.Scale1.y ;
	CC2.Output.LFR := REAL_TO_INT(CC2.o.SpeedRef) ;

	//INVERTER CS2 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CS2.Inv.Reference1[0].x := 00.0 ;
	CS2.Inv.Reference1[0].y := 00.0 ;
	CS2.Inv.Reference1[1].x := ScalePerm.CS2Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CS2.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CS2.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CS2.SpeedAnalog := ((INT_TO_REAL(CS2.Input.AI1R))/(AnalogPerm.CS2.V1.ActAnalog/AnalogPerm.CS2.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CS2.SpeedAnalog := ((INT_TO_REAL(CS2.Input.AI3R))/(AnalogPerm.CS2.C1.ActAnalog/AnalogPerm.CS2.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CS2.SpeedAnalog := ((INT_TO_REAL(CS2.Input.AI3R)-1638.4)/(AnalogPerm.CS2.C2.ActAnalog/AnalogPerm.CS2.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CS2.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CS2.SpeedAnalog := LIMIT(1, CS2.SpeedAnalog, 60) ;

	CS2.Inv.Scale1.NoOfPoints := 2 ;
	CS2.Inv.Scale1.ptr_table := ADR(CS2.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CS2.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CS2.Input.ETAD_06) THEN
			CS2.Output.CMDD_01 := TRUE ;
			CS2.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CS2.Input.ETAD_04) AND(CS2.Input.ETAD_05) THEN
			CS2.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CS2.Output.CMDD_00 := FALSE ;
		CS2.Output.CMDD_01 := FALSE ;
		CS2.Output.CMDD_02 := FALSE ;
		CS2.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CS2.Inv.Scale1();
	CS2.o.SpeedRef := CS2.Inv.Scale1.y ;
	CS2.Output.LFR := REAL_TO_INT(CS2.o.SpeedRef) ;

	//INVERTER CV2 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CV2.Inv.Reference1[0].x := 00.0 ;
	CV2.Inv.Reference1[0].y := 00.0 ;
	CV2.Inv.Reference1[1].x := ScalePerm.CV2Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CV2.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CV2.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CV2.SpeedAnalog := ((INT_TO_REAL(CV2.Input.AI1R))/(AnalogPerm.CV2.V1.ActAnalog/AnalogPerm.CV2.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CV2.SpeedAnalog := ((INT_TO_REAL(CV2.Input.AI3R))/(AnalogPerm.CV2.C1.ActAnalog/AnalogPerm.CV2.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CV2.SpeedAnalog := ((INT_TO_REAL(CV2.Input.AI3R)-1638.4)/(AnalogPerm.CV2.C2.ActAnalog/AnalogPerm.CV2.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CV2.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CV2.SpeedAnalog := LIMIT(1, CV2.SpeedAnalog, 60) ;

	CV2.Inv.Scale1.NoOfPoints := 2 ;
	CV2.Inv.Scale1.ptr_table := ADR(CV2.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CV2.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CV2.Input.ETAD_06) THEN
			CV2.Output.CMDD_01 := TRUE ;
			CV2.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CV2.Input.ETAD_04) AND(CV2.Input.ETAD_05) THEN
			CV2.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CV2.Output.CMDD_00 := FALSE ;
		CV2.Output.CMDD_01 := FALSE ;
		CV2.Output.CMDD_02 := FALSE ;
		CV2.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CV2.Inv.Scale1();
	CV2.o.SpeedRef := CV2.Inv.Scale1.y ;
	CV2.Output.LFR := REAL_TO_INT(CV2.o.SpeedRef) ;

	//INVERTER CC3 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CC3.Inv.Reference1[0].x := 00.0 ;
	CC3.Inv.Reference1[0].y := 00.0 ;
	CC3.Inv.Reference1[1].x := ScalePerm.CC3Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CC3.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CC3.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CC3.SpeedAnalog := ((INT_TO_REAL(CC3.Input.AI1R))/(AnalogPerm.CC3.V1.ActAnalog/AnalogPerm.CC3.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CC3.SpeedAnalog := ((INT_TO_REAL(CC3.Input.AI3R))/(AnalogPerm.CC3.C1.ActAnalog/AnalogPerm.CC3.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CC3.SpeedAnalog := ((INT_TO_REAL(CC3.Input.AI3R)-1638.4)/(AnalogPerm.CC3.C2.ActAnalog/AnalogPerm.CC3.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CC3.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CC3.SpeedAnalog := LIMIT(1, CC3.SpeedAnalog, 60) ;

	CC3.Inv.Scale1.NoOfPoints := 2 ;
	CC3.Inv.Scale1.ptr_table := ADR(CC3.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CC3.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CC3.Input.ETAD_06) THEN
			CC3.Output.CMDD_01 := TRUE ;
			CC3.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CC3.Input.ETAD_04) AND(CC3.Input.ETAD_05) THEN
			CC3.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CC3.Output.CMDD_00 := FALSE ;
		CC3.Output.CMDD_01 := FALSE ;
		CC3.Output.CMDD_02 := FALSE ;
		CC3.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CC3.Inv.Scale1();
	CC3.o.SpeedRef := CC3.Inv.Scale1.y ;
	CC3.Output.LFR := REAL_TO_INT(CC3.o.SpeedRef) ;

	//INVERTER CC4 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CC4.Inv.Reference1[0].x := 00.0 ;
	CC4.Inv.Reference1[0].y := 00.0 ;
	CC4.Inv.Reference1[1].x := ScalePerm.CC4Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CC4.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CC4.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CC4.SpeedAnalog := ((INT_TO_REAL(CC4.Input.AI1R))/(AnalogPerm.CC4.V1.ActAnalog/AnalogPerm.CC4.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CC4.SpeedAnalog := ((INT_TO_REAL(CC4.Input.AI3R))/(AnalogPerm.CC4.C1.ActAnalog/AnalogPerm.CC4.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CC4.SpeedAnalog := ((INT_TO_REAL(CC4.Input.AI3R)-1638.4)/(AnalogPerm.CC4.C2.ActAnalog/AnalogPerm.CC4.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CC4.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CC4.SpeedAnalog := LIMIT(1, CC4.SpeedAnalog, 60) ;

	CC4.Inv.Scale1.NoOfPoints := 2 ;
	CC4.Inv.Scale1.ptr_table := ADR(CC4.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CC4.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CC4.Input.ETAD_06) THEN
			CC4.Output.CMDD_01 := TRUE ;
			CC4.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CC4.Input.ETAD_04) AND(CC4.Input.ETAD_05) THEN
			CC4.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CC4.Output.CMDD_00 := FALSE ;
		CC4.Output.CMDD_01 := FALSE ;
		CC4.Output.CMDD_02 := FALSE ;
		CC4.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CC4.Inv.Scale1();
	CC4.o.SpeedRef := CC4.Inv.Scale1.y ;
	CC4.Output.LFR := REAL_TO_INT(CC4.o.SpeedRef) ;

	//INVERTER CB1 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CB1.Inv.Reference1[0].x := 00.0 ;
	CB1.Inv.Reference1[0].y := 00.0 ;
	CB1.Inv.Reference1[1].x := ScalePerm.CB1Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CB1.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CB1.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CB1.SpeedAnalog := ((INT_TO_REAL(CB1.Input.AI1R))/(AnalogPerm.CB1.V1.ActAnalog/AnalogPerm.CB1.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CB1.SpeedAnalog := ((INT_TO_REAL(CB1.Input.AI3R))/(AnalogPerm.CB1.C1.ActAnalog/AnalogPerm.CB1.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CB1.SpeedAnalog := ((INT_TO_REAL(CB1.Input.AI3R)-1638.4)/(AnalogPerm.CB1.C2.ActAnalog/AnalogPerm.CB1.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CB1.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CB1.SpeedAnalog := LIMIT(1, CB1.SpeedAnalog, 60) ;

	CB1.Inv.Scale1.NoOfPoints := 2 ;
	CB1.Inv.Scale1.ptr_table := ADR(CB1.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CB1.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CB1.Input.ETAD_06) THEN
			CB1.Output.CMDD_01 := TRUE ;
			CB1.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CB1.Input.ETAD_04) AND(CB1.Input.ETAD_05) THEN
			CB1.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CB1.Output.CMDD_00 := FALSE ;
		CB1.Output.CMDD_01 := FALSE ;
		CB1.Output.CMDD_02 := FALSE ;
		CB1.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CB1.Inv.Scale1();
	CB1.o.SpeedRef := CB1.Inv.Scale1.y ;
	CB1.Output.LFR := REAL_TO_INT(CB1.o.SpeedRef) ;

	//INVERTER CB2 CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CB2.Inv.Reference1[0].x := 00.0 ;
	CB2.Inv.Reference1[0].y := 00.0 ;
	CB2.Inv.Reference1[1].x := ScalePerm.CB2Scale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CB2.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CB2.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CB2.SpeedAnalog := ((INT_TO_REAL(CB2.Input.AI1R))/(AnalogPerm.CB2.V1.ActAnalog/AnalogPerm.CB2.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CB2.SpeedAnalog := ((INT_TO_REAL(CB2.Input.AI3R))/(AnalogPerm.CB2.C1.ActAnalog/AnalogPerm.CB2.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CB2.SpeedAnalog := ((INT_TO_REAL(CB2.Input.AI3R)-1638.4)/(AnalogPerm.CB2.C2.ActAnalog/AnalogPerm.CB2.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CB2.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CB2.SpeedAnalog := LIMIT(1, CB2.SpeedAnalog, 60) ;

	CB2.Inv.Scale1.NoOfPoints := 2 ;
	CB2.Inv.Scale1.ptr_table := ADR(CB2.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CB2.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CB2.Input.ETAD_06) THEN
			CB2.Output.CMDD_01 := TRUE ;
			CB2.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CB2.Input.ETAD_04) AND(CB2.Input.ETAD_05) THEN
			CB2.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CB2.Output.CMDD_00 := FALSE ;
		CB2.Output.CMDD_01 := FALSE ;
		CB2.Output.CMDD_02 := FALSE ;
		CB2.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CB2.Inv.Scale1();
	CB2.o.SpeedRef := CB2.Inv.Scale1.y ;
	CB2.Output.LFR := REAL_TO_INT(CB2.o.SpeedRef) ;

	//INVERTER CRB CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CRB.Inv.Reference1[0].x := 00.0 ;
	CRB.Inv.Reference1[0].y := 00.0 ;
	CRB.Inv.Reference1[1].x := ScalePerm.CRBScale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CRB.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CRB.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CRB.SpeedAnalog := ((INT_TO_REAL(CRB.Input.AI1R))/(AnalogPerm.CRB.V1.ActAnalog/AnalogPerm.CRB.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CRB.SpeedAnalog := ((INT_TO_REAL(CRB.Input.AI3R))/(AnalogPerm.CRB.C1.ActAnalog/AnalogPerm.CRB.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CRB.SpeedAnalog := ((INT_TO_REAL(CRB.Input.AI3R)-1638.4)/(AnalogPerm.CRB.C2.ActAnalog/AnalogPerm.CRB.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CRB.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CRB.SpeedAnalog := LIMIT(1, CRB.SpeedAnalog, 60) ;

	CRB.Inv.Scale1.NoOfPoints := 2 ;
	CRB.Inv.Scale1.ptr_table := ADR(CRB.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CRB.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CRB.Input.ETAD_06) THEN
			CRB.Output.CMDD_01 := TRUE ;
			CRB.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CRB.Input.ETAD_04) AND(CRB.Input.ETAD_05) THEN
			CRB.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CRB.Output.CMDD_00 := FALSE ;
		CRB.Output.CMDD_01 := FALSE ;
		CRB.Output.CMDD_02 := FALSE ;
		CRB.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CRB.Inv.Scale1();
	CRB.o.SpeedRef := CRB.Inv.Scale1.y ;
	CRB.Output.LFR := REAL_TO_INT(CRB.o.SpeedRef) ;

	//INVERTER CRE CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CRE.Inv.Reference1[0].x := 00.0 ;
	CRE.Inv.Reference1[0].y := 00.0 ;
	CRE.Inv.Reference1[1].x := ScalePerm.CREScale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CRE.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CRE.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CRE.SpeedAnalog := ((INT_TO_REAL(CRE.Input.AI1R))/(AnalogPerm.CRE.V1.ActAnalog/AnalogPerm.CRE.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CRE.SpeedAnalog := ((INT_TO_REAL(CRE.Input.AI3R))/(AnalogPerm.CRE.C1.ActAnalog/AnalogPerm.CRE.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CRE.SpeedAnalog := ((INT_TO_REAL(CRE.Input.AI3R)-1638.4)/(AnalogPerm.CRE.C2.ActAnalog/AnalogPerm.CRE.C2.ActSpeed)) ; //1638.4 IS 4mA SHIFT FOR 4-20mA RANGE
		CRE.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CRE.SpeedAnalog := LIMIT(1, CRE.SpeedAnalog, 60) ;

	CRE.Inv.Scale1.NoOfPoints := 2 ;
	CRE.Inv.Scale1.ptr_table := ADR(CRE.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CRE.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CRE.Input.ETAD_06) THEN
			CRE.Output.CMDD_01 := TRUE ;
			CRE.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CRE.Input.ETAD_04) AND(CRE.Input.ETAD_05) THEN
			CRE.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CRE.Output.CMDD_00 := FALSE ;
		CRE.Output.CMDD_01 := FALSE ;
		CRE.Output.CMDD_02 := FALSE ;
		CRE.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CRE.Inv.Scale1();
	CRE.o.SpeedRef := CRE.Inv.Scale1.y ;
	CRE.Output.LFR := REAL_TO_INT(CRE.o.SpeedRef) ;

	//INVERTER CLB CONTROLS
	//SCALE DISPLAY VALUES OF M/MIN TO FREQUENCY FOR CONVEYOR SET SPEEDS
	CLB.Inv.Reference1[0].x := 00.0 ;
	CLB.Inv.Reference1[0].y := 00.0 ;
	CLB.Inv.Reference1[1].x := ScalePerm.CLBScale ; //SPEED OF CONVEYOR AT 50HZ. ALTER AS REQUIRED
	CLB.Inv.Reference1[1].y    := 500.0 ;  //500 = 50HZ

	CASE InvPerms.CLB.Analog OF
		NO_ANALOG:
		VOLTAGE_TYPE_1:
			CLB.SpeedAnalog := ((INT_TO_REAL(CLB.Input.AI1R))/(AnalogPerm.CLB.V1.ActAnalog/AnalogPerm.CLB.V1.ActSpeed)) ;
		CURRENT_TYPE_1:
			CLB.SpeedAnalog := ((INT_TO_REAL(CLB.Input.AI3R))/(AnalogPerm.CLB.C1.ActAnalog/AnalogPerm.CLB.C1.ActSpeed)) ;
		CURRENT_TYPE_2:
			CLB.SpeedAnalog := ((INT_TO_REAL(CLB.Input.AI3R)-1638.4)* 1.25) / ((((AnalogPerm.CLB.C2.ActAnalog)-1638.4)*1.25)/ AnalogPerm.CLB.C2.ActSpeed) ;
			//CLB.Inv.Reference1[1].y := 400.0 ; //REDUCE SCALE REFERENCE BY 20% TO ALLOW FOR 4mA SHIFT
	END_CASE
	CLB.SpeedAnalog := LIMIT(1, CLB.SpeedAnalog, 60) ;

	CLB.Inv.Scale1.NoOfPoints := 2 ;
	CLB.Inv.Scale1.ptr_table := ADR(CLB.Inv.Reference1)    ;

	//RESET INVERTER OUTPUTS BEFORE SCAN
	IF NOT(Control.Test) THEN
		memcpy(ADR(CLB.o),ADR(ClearInv),SIZEOF(ClearInv));
	END_IF

	//INVERTER ENABLE CONTROL
	IF(Control.Achieved1) OR(Control.Test) THEN
		IF(CLB.Input.ETAD_06) THEN
			CLB.Output.CMDD_01 := TRUE ;
			CLB.Output.CMDD_02 := TRUE ;
		END_IF
		IF(CLB.Input.ETAD_04) AND(CLB.Input.ETAD_05) THEN
			CLB.Output.CMDD_00 := TRUE ;
		END_IF
	END_IF

	//INVERTER RESET CONTROL
	IF NOT(Control.Achieved1) AND NOT(Control.Test) THEN
		CLB.Output.CMDD_00 := FALSE ;
		CLB.Output.CMDD_01 := FALSE ;
		CLB.Output.CMDD_02 := FALSE ;
		CLB.Output.CMDD_07 := FALSE ;
	END_IF

	//SET INVERTER FREQUENCY
	CLB.Inv.Scale1();
	CLB.o.SpeedRef := CLB.Inv.Scale1.y ;
	CLB.Output.LFR := REAL_TO_INT(CLB.o.SpeedRef) ;

	//RESET ALL .Inv.SCALE1.x FOR DISPLAY PURPOSES.
	CL1.Inv.Scale1.x   :=  0   ;
	CS1.Inv.Scale1.x   :=  0   ;
	CV1.Inv.Scale1.x   :=  0   ;
	CC1.Inv.Scale1.x   :=  0   ;
	CC2.Inv.Scale1.x   :=  0   ;
	CS2.Inv.Scale1.x   :=  0   ;
	CV2.Inv.Scale1.x   :=  0   ;
	CC3.Inv.Scale1.x   :=  0   ;
	CC4.Inv.Scale1.x   :=  0   ;
	CB1.Inv.Scale1.x   :=  0   ;
	CB2.Inv.Scale1.x   :=  0   ;
	CRB.Inv.Scale1.x   :=  0   ;
	CRE.Inv.Scale1.x   :=  0   ;
	CLB.Inv.Scale1.x   :=  0   ;

END_PROGRAM

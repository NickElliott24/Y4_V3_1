(********************************************************************
 * COPYRIGHT -ASHTON INDUSTRIAL 2016-  
 ********************************************************************
 * Program: Page17
 * File: Page17.st
 * Author: NE
 ********************************************************************)

PROGRAM _CYCLIC

	Alarm.Control := 3 ;  	//Enable Alarm Index selection 
	Alarm.Group := 1 ;	// Equals alarm group index 
	Alarm.Alarm := 0 ;	// Not used 
	Alarm.Priority := 0 ;	// Not used 
	
	// Convert alarm inputs to alarm array
	SysTemp.Alarms[0] := MS1Belt1.Trip ;
	SysTemp.Alarms[1] := MS2Belt2.Trip ;
	SysTemp.Alarms[2] := MS3Belt3.Trip ;
	SysTemp.Alarms[3] := MS4Belt4.Trip ;
	SysTemp.Alarms[4] := MS5Belt5.Trip ;
	SysTemp.Alarms[5] := MS6Belt6.Trip ;
	SysTemp.Alarms[6] := MS7Belt7.Trip ;
	SysTemp.Alarms[7] := MS8Belt8.Trip ;
	SysTemp.Alarms[8] := MS9Vac1.Trip ;
	SysTemp.Alarms[9] := MS10Vac2.Trip ;
	SysTemp.Alarms[10] := MS11Vac3.Trip ;
	SysTemp.Alarms[11] := MS12Vac4.Trip ;
	SysTemp.Alarms[12] := MS13Water1.Trip ;
	SysTemp.Alarms[13] := MS14Water2.Trip ;
	SysTemp.Alarms[14] := (CL1.Input.Fault) ;
	SysTemp.Alarms[15] := (CS1.Input.Fault) ;
	SysTemp.Alarms[16] := (CV1.Input.Fault) ;
	SysTemp.Alarms[17] := (CC1.Input.Fault) ;
	SysTemp.Alarms[18] := (CC2.Input.Fault) ;
	SysTemp.Alarms[19] := (CS2.Input.Fault) ;
	SysTemp.Alarms[20] := (CV2.Input.Fault) ;
	SysTemp.Alarms[21] := (CC3.Input.Fault) ;
	SysTemp.Alarms[22] := (CC4.Input.Fault) ;
	SysTemp.Alarms[23] := (CB1.Input.Fault) ;
	SysTemp.Alarms[24] := (CB2.Input.Fault) ;
	SysTemp.Alarms[25] := (CRB.Input.Fault) ;
	SysTemp.Alarms[26] := (CRE.Input.Fault) ;
	SysTemp.Alarms[27] := (CLB.Input.Fault) ;
	SysTemp.Alarms[28] ;
	SysTemp.Alarms[29] ;
	SysTemp.Alarms[30] ;
	SysTemp.Alarms[31] ;
	SysTemp.Alarms[32] ;
	SysTemp.Alarms[33] ;
	SysTemp.Alarms[39] := Ax1.Error AND(Control.Achieved1) ;
	SysTemp.Alarms[40] := Ax2.Error AND(Control.Achieved1) ;
	SysTemp.Alarms[41] := NOT(Servo1POT.In) ;
	SysTemp.Alarms[42] := NOT(Servo1NOT.In) ;
	SysTemp.Alarms[43] := NOT(Servo2POT.In) ;
	SysTemp.Alarms[44] := NOT(Servo2NOT.In) ;
	SysTemp.Alarms[50] := (X2XModule[5].Fuse) ;
	SysTemp.Alarms[51] := (X2XModule[6].Fuse) ;
	SysTemp.Alarms[52] := (X2XModule[7].Fuse) ;

	SysTemp.Alarm := FALSE ;
	FOR i := 0 TO 80 DO
		IF(SysTemp.Alarms[i]) THEN
			SysTemp.Alarm := TRUE ;
			EXIT ;
		END_IF
	END_FOR
	
END_PROGRAM

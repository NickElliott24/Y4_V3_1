(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Control
 * File: ControlCyclic.st
 * Author: nicke
 ********************************************************************
 * Implementation of program Control
 ********************************************************************)

PROGRAM _CYCLIC
	
	Control.BuzzerPT := PresetSys.Buzzer ;
	Control.Paused := Pause.Active ;
	Control.Alarm := SysTemp.Alarm ;
	Control.Warning := SysTemp.Warning ;
	Control.StandbyPT := PresetSys.Standby ;
	Control.CountIN[0] := Tracking00.Busy ;
	Control.CountIN[1] := Tracking01.Busy ;
	Control.CountIN[2] := Tracking10.Busy ;
	Control.CountIN[3] := Tracking11.Busy ;
	Control.CountIN[4] := Tracking20.Busy ;
	Control.CountIN[5] := Tracking30.Busy ;
	Control.CountIN[6] := Tracking40.Busy ;
	Control.CountIN[7] := Tracking41.Busy ;
	Control.CountIN[8] := Tracking50.Busy ;
	Control.CountIN[9] := Tracking60.Busy ;
	Control.CountIN[10] := Tracking70.Busy ;
	Control.CountIN[11] := Tracking51.Busy ;
	
	Control ();
	
	Control.EStop2 := Control.EStop1 ;

END_PROGRAM


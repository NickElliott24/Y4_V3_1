(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Seamers
 * File: SeamersCyclic.st
 * Author: nicke
 ********************************************************************
 * Implementation of program Seamers
 ********************************************************************)

PROGRAM _CYCLIC

//	Seamers.ESClear := Control.ESClear ;
//	Seamers.ControlIN := Control.Achieved1 ;
//	Seamers.Detension := Sol20DT1.Auto ;
//	Seamers.BeltsPT := PresetSys.Belt ;
//	Seamers.VacPT := PresetSys.Vac ;
//	Seamers.VacsStopPT := PresetSys.VacsStop ;
//	Seamers.PumpPT := PresetSys.Water ;
//	Seamers.Trips[1] := MS1Belt1.Trip ;
//	Seamers.Trips[2] := MS2Belt2.Trip ;
//	Seamers.Trips[4] := MS9Vac1.Trip ;
//	Seamers.Trips[7] := MS3Belt3.Trip ;
//	Seamers.Trips[8] := MS4Belt4.Trip ;
//	Seamers.Trips[10] := MS10Vac2.Trip ;
//	Seamers.Trips[13] := MS5Belt5.Trip ;
//	Seamers.Trips[14] := MS6Belt6.Trip ;
//	Seamers.Trips[16] := MS11Vac3.Trip ;
//	Seamers.Trips[19] := MS7Belt7.Trip ;
//	Seamers.Trips[20] := MS8Belt8.Trip ;
//	Seamers.Trips[22] := MS12Vac4.Trip ;
//	Seamers.Float[1] := S64Float.In ;
//	Seamers.Float[2] := S65Float.In ;
//	Seamers ();
//	MS1Belt1.Auto := Seamers.BeltOUT[1] ;
//	MS2Belt2.Auto := Seamers.BeltOUT[2] ;
//	MS3Belt3.Auto := Seamers.BeltOUT[3] ;
//	MS4Belt4.Auto := Seamers.BeltOUT[4] ;
//	MS5Belt5.Auto := Seamers.BeltOUT[5] ;
//	MS6Belt6.Auto := Seamers.BeltOUT[6] ;
//	MS7Belt7.Auto := Seamers.BeltOUT[7] ;
//	MS8Belt8.Auto := Seamers.BeltOUT[8] ;
//	MS9Vac1.Auto := Seamers.VacOUT[1] ;
//	MS11Vac3.Auto := Seamers.VacOUT[2] ;
//	MS10Vac2.Auto := Seamers.VacOUT[3] ;
//	MS12Vac4.Auto := Seamers.VacOUT[4] ;
//	Sol19Pump.Auto := Seamers.PumpOUT[0] ;
//	MS13Water1.Auto := Seamers.PumpOUT[1] ;
//	MS14Water2.Auto := Seamers.PumpOUT[2] ;
//	Seamers.StartAllDisp ;

	(*
	Intercept Interval delay TO be cumulative value OF time that spray nozzles are on (when seaming)
	Use counter FOR scans instead OF TON delay.
	CASE statement OF count FOR interval. Keep TON FOR Open delay.

	Timer in system, as glass is coming round, and times out, pauses line, shuts off the water pump AND vacuum pump FOR a few seconds FOR the bladder TO drain.
	Interval delay between drains.
	*)
	SeamersII.Control.Achieved := Control.Achieved1;
	SeamersII.Control.ESClear := Control.ESClear;
	SeamersII.Detension := Sol20DT1.Auto;
	SeamersII.PresetSys.Belt := PresetSys.Belt;
	SeamersII.PresetSys.Vac := PresetSys.Vac;
	SeamersII.PresetSys.VacsStop := PresetSys.VacsStop;
	SeamersII.PresetSys.Water := PresetSys.Water;
	SeamersII.Trips := SysTemp.Alarms;
	SeamersII.Float[1] := S64Float.In;
	SeamersII.SeekBlock[1] := Ax1.Block;
	SeamersII.SeekBlock[2] := Ax2.Block;
	SeamersII.InterceptInterval := InterceptPT.IntervalPT;
	SeamersII.InterceptOpen := InterceptPT.OpenPT;
	SeamersII ();
	MS1Belt1.Auto := SeamersII.BeltOUT[1];
	MS2Belt2.Auto := SeamersII.BeltOUT[2];
	MS3Belt3.Auto := SeamersII.BeltOUT[3];
	MS4Belt4.Auto := SeamersII.BeltOUT[4];
	MS5Belt5.Auto := SeamersII.BeltOUT[5];
	MS6Belt6.Auto := SeamersII.BeltOUT[6];
	MS7Belt7.Auto := SeamersII.BeltOUT[7];
	MS8Belt8.Auto := SeamersII.BeltOUT[8];
	MS9Vac1.Auto := SeamersII.VacOUT[1];
	MS10Vac2.Auto := SeamersII.VacOUT[2];
	MS11Vac3.Auto := SeamersII.VacOUT[3];
	MS12Vac4.Auto := SeamersII.VacOUT[4];
	Sol19Pump.Auto := SeamersII.ValveOUT[2];
	MS13Water1.Auto := SeamersII.PumpOUT[1];
	
	// NEW SPRAY NOZZLE CONTROL BASED ON U21
	// TURN ON SECOND PUMP WHEN FIRST VACUUM PUMP IS ON
	MS14Water2.Auto := (MS9Vac1.Auto) OR(MS11Vac3.Auto);
	IF(SeamersII.TransportMode)THEN
		MS14Water2.Auto := FALSE;
	END_IF
	IF NOT(S65Float.In)THEN
		MS14Water2.Auto := FALSE;
	END_IF
	
	// DON'T USE PRE TRACKING. TURNS SPRAY OFF
//	Spray1.PreTracking := 0; //CHANGE IF PRETRACKING REQUIRED
	Spray1.Track[0] := Track004.Active;
	Spray1.Track[1] := Track005.Active AND NOT(Tracking00.Blocked);
	Spray1.Track[2] := Track101.Active;
	Spray1.Track[3] := Track104.Active;
	Spray1.VacuumStopDelay := PresetSys.VacsStop;
	Spray1.NozzlePerm := NozzlePerm;
	Spray1.Vacuum := MS10Vac2.Auto;
	Spray1.AutoStart := SeamersII.AutoStart[1];
	Spray1.Control := Control.Achieved1;
	Spray1.TransportMode := SeamersII.TransportMode;
	Spray1 ();
	Sol37Spray.Auto := Spray1.Spray;// UNCOMMENT AFTER TESTING

	//ADD CONDITIONS TO RESET SEQUENCE FROM ALL CASES.

	// DON'T USE PRE TRACKING. TURNS SPRAY OFF
	Spray2.Track[0] := Track114.Active;
	Spray2.Track[1] := Track115.Active AND NOT(Tracking11.Blocked);
	Spray2.Track[2] := Track201.Active;
	Spray2.Track[3] := Track204.Active;
	Spray2.VacuumStopDelay := PresetSys.VacsStop;
	Spray2.NozzlePerm := NozzlePerm;
	Spray2.Vacuum := MS10Vac2.Auto;
	Spray2.AutoStart := SeamersII.AutoStart[1];
	Spray2.Control := Control.Achieved1;
	Spray2.TransportMode := SeamersII.TransportMode;
	Spray2 ();
	Sol47Spray.Auto := Spray2.Spray; //UNCOMMENT AFTER TESTING
	
	//RECIRCULATION VALVE - OPERATE WHEN BOTH SPRAY NOZZLE SOLENOIDS ARE OFF
	Sol53Recirc.Auto := FALSE;
	IF(Spray1.Nozzle.Seq >= NC_CleanDone) AND(Spray2.Nozzle.Seq >= NC_CleanDone)THEN
		IF(Sol37Spray.Auto = FALSE) AND(Sol47Spray.Auto = FALSE)THEN
			Sol53Recirc.Auto := TRUE;
		END_IF
	END_IF
	
END_PROGRAM

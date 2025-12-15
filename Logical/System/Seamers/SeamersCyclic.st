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

	Seamers.ESClear := Control.ESClear ;
	Seamers.ControlIN := Control.Achieved1 ;
	Seamers.Detension := Sol20DT1.Auto ;
	Seamers.BeltsPT := PresetSys.Belt ;
	Seamers.VacPT := PresetSys.Vac ;
	Seamers.VacsStopPT := PresetSys.VacsStop ;
	Seamers.PumpPT := PresetSys.Water ;
	Seamers.Trips[1] := MS1Belt1.Trip ;
	Seamers.Trips[2] := MS2Belt2.Trip ;
	Seamers.Trips[4] := MS9Vac1.Trip ;
	Seamers.Trips[7] := MS3Belt3.Trip ;
	Seamers.Trips[8] := MS4Belt4.Trip ;
	Seamers.Trips[10] := MS10Vac2.Trip ;
	Seamers.Trips[13] := MS5Belt5.Trip ;
	Seamers.Trips[14] := MS6Belt6.Trip ;
	Seamers.Trips[16] := MS11Vac3.Trip ;
	Seamers.Trips[19] := MS7Belt7.Trip ;
	Seamers.Trips[20] := MS8Belt8.Trip ;
	Seamers.Trips[22] := MS12Vac4.Trip ;
	Seamers.Float[1] := S64Float.In ;
	Seamers.Float[2] := S65Float.In ;
	Seamers ();
	MS1Belt1.Auto := Seamers.BeltOUT[1] ;
	MS2Belt2.Auto := Seamers.BeltOUT[2] ;
	MS3Belt3.Auto := Seamers.BeltOUT[3] ;
	MS4Belt4.Auto := Seamers.BeltOUT[4] ;
	MS5Belt5.Auto := Seamers.BeltOUT[5] ;
	MS6Belt6.Auto := Seamers.BeltOUT[6] ;
	MS7Belt7.Auto := Seamers.BeltOUT[7] ;
	MS8Belt8.Auto := Seamers.BeltOUT[8] ;
	MS9Vac1.Auto := Seamers.VacOUT[1] ;
	MS11Vac3.Auto := Seamers.VacOUT[2] ;
	MS10Vac2.Auto := Seamers.VacOUT[3] ;
	MS12Vac4.Auto := Seamers.VacOUT[4] ;
	Sol19Pump.Auto := Seamers.PumpOUT[0] ;
	MS13Water1.Auto := Seamers.PumpOUT[1] ;
	MS14Water2.Auto := Seamers.PumpOUT[2] ;
	Seamers.StartAllDisp ;

	// NEW SPRAY NOZZLE CONTROL BASED ON U21
	// TURN ON SECOND PUMP WHEN FIRST VACUUM PUMP IS ON
	MS14Water2.Auto := (MS9Vac1.Auto) OR(MS11Vac3.Auto);
	IF(Seamers.TransportMode)THEN
		MS14Water2.Auto := FALSE;
	END_IF
	IF NOT(S65Float.In)THEN
		MS14Water2.Auto := FALSE;
	END_IF
	
	// DON'T USE PRE TRACKING. TURNS SPRAY OFF
//	Spray1.PreTracking := 0; //CHANGE IF PRETRACKING REQUIRED
//	Spray1.PreTrack[0] := Tracking00.Blocked;
//	Spray1.PreTrack[1] := Track005.Active;
//	Spray1.PreTrack[2] := Track004.Active;
	Spray1.Track[0] := Track101.Active;
	Spray1.Track[1] := Track104.Active;
	Spray1.VacuumStopDelay := PresetSys.VacsStop;
	Spray1.NozzlePerm := NozzlePerm;
	Spray1.Vacuum := MS10Vac2.Auto;
	Spray1.AutoStart := Seamers.AutoStart[1];
	Spray1.Control := Control.Achieved1;
	Spray1.TransportMode := Seamers.TransportMode;
	Spray1 ();
	Sol37Spray.Auto := Spray1.Spray;// UNCOMMENT AFTER TESTING

	//ADD CONDITIONS TO RESET SEQUENCE FROM ALL CASES.

	// DON'T USE PRE TRACKING. TURNS SPRAY OFF
//	Spray2.PreTracking := 0; //CHANGE IF PRETRACKING REQUIRED
//	Spray2.PreTrack[0] := Track11.Blocked;
//	Spray2.PreTrack[1] := Track11.Bit[5].Active;
//	Spray2.PreTrack[2] := Track11.Bit[4].Active;
	Spray2.Track[0] := Track201.Active;
	Spray2.Track[1] := Track204.Active;
	Spray2.VacuumStopDelay := PresetSys.VacsStop;
	Spray2.NozzlePerm := NozzlePerm;
	Spray2.Vacuum := MS10Vac2.Auto;
	Spray2.AutoStart := Seamers.AutoStart[1];
	Spray2.Control := Control.Achieved1;
	Spray2.TransportMode := Seamers.TransportMode;
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

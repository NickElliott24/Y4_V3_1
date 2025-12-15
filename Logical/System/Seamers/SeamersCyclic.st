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
	
END_PROGRAM

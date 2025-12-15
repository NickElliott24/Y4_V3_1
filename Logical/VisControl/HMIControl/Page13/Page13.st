(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Page13
 * File: Page13.st
 * Author: NickE
 * Created: January 31, 2013
 ********************************************************************
 * Implementation of program Page13
 ********************************************************************)

PROGRAM _CYCLIC

	//SETTINGS SCREEN
	Vis.P13.EnableIndex	:=	LIMIT(0,Vis.P13.EnableIndex,24)	;
	Vis.P13.Status[0]	:=	HIDE	;
	Vis.P13.Status[1]	:=	HIDE	;
	Vis.P13.Status[2]	:=	HIDE	;
	Vis.P13.Status[3]	:=	HIDE	;
	Vis.P13.Status[4]	:=	HIDE	;
	Vis.P13.Status[5]	:=	HIDE	;
	Vis.P13.Status[6]	:=	HIDE	;
	Vis.P13.Status[7]	:=	HIDE	;
	Vis.P13.Status[8]	:=	HIDE	;
	Vis.P13.Status[9]	:=	HIDE	;
	Vis.P13.Status[10]	:=	HIDE	;
	Vis.P13.Colour[1]	:=	BLUE	;
	Vis.P13.Colour[2]	:=	BLUE	;
	Vis.P13.Colour[3]	:=	BLUE	;
	Vis.P13.Colour[4]	:=	BLUE	;
	Vis.P13.Colour[5]	:=	BLUE	;
	Vis.P13.Colour[6]	:=	BLUE	;
	
	
	CASE Vis.P13.EnableIndex OF
		0:
			Vis.P13.Status[0]	:=	SHOW	;
			Vis.CalcBelt.Disp	:=	HIDE	;
		1:
			Vis.P13.Status[1]	:=	SHOW	;
			Vis.P13.Status[9]	:=	SHOW	;
			Vis.P13.Colour[1]	:=	BLUE_ACTIVE	;
		2:
			Vis.P13.Status[2]	:=	SHOW	;
			Vis.P13.Status[9]	:=	SHOW	;
			Vis.P13.Colour[2]	:=	BLUE_ACTIVE	;
			Vis.CalcBelt.Disp	:=	HIDE	;
		3:
			Vis.P13.Status[3]	:=	SHOW	;
			Vis.P13.Status[9]	:=	SHOW	;
			Vis.P13.Colour[3]	:=	BLUE_ACTIVE	;
			Vis.CalcBelt.Disp	:=	HIDE	;
		4:
			Vis.P13.Status[4]	:=	SHOW	;
			Vis.P13.Status[9]	:=	SHOW	;
			Vis.P13.Colour[4]	:=	BLUE_ACTIVE	;
			Vis.CalcBelt.Disp	:=	HIDE	;
		5:
			Vis.P13.Status[5]	:=	SHOW	;
			Vis.P13.Status[9]	:=	SHOW	;
			Vis.P13.Colour[5]	:=	BLUE_ACTIVE	;
			Vis.CalcBelt.Disp	:=	HIDE	;
		6:
			Vis.P13.Status[6]	:=	SHOW	;
			Vis.P13.Status[9]	:=	SHOW	;
			Vis.P13.Colour[6]	:=	BLUE_ACTIVE	;
			Vis.CalcBelt.Disp	:=	HIDE	;
		7:
			Vis.P13.Status[7]	:=	SHOW	;
			Vis.CalcBelt.Disp	:=	HIDE	;
		8:
			Vis.P13.Status[8]	:=	SHOW	;
			Vis.P13.Status[3]	:=	SHOW	;
			Vis.P13.Status[9]	:=	SHOW	;
			Vis.P13.Colour[3]	:=	BLUE_ACTIVE	;
			Vis.CalcBelt.Disp	:=	HIDE	;
		10:
			Vis.P13.Status[10]	:=	SHOW	;
			Vis.P13.Status[6]	:=	SHOW	;
			Vis.P13.Status[9]	:=	SHOW	;
			Vis.P13.Colour[6]	:=	BLUE_ACTIVE	;
			Vis.CalcBelt.Disp	:=	HIDE	;
				
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	Vis.P13.Changed	:=	FALSE	;
	Vis.P13.New	:=	Vis.P13.EnableIndex	;
	IF(Vis.P13.New <> Vis.P13.Old) THEN
		Vis.P13.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(Vis.P13.Changed) THEN
		Vis.P13Delays.EnableIndex	:=	24	;
		Vis.P13Servos.EnableIndex	:=	24	;
		Vis.P13System.EnableIndex	:=	24	;
		Vis.P13Timeouts.EnableIndex	:=	24	;
		Vis.P13Help1.EnableIndex	:=	24	;
		Vis.P13Help2.EnableIndex	:=	24	;
	END_IF
	Vis.P13.Old	:=	Vis.P13.EnableIndex	;

	//SETTINGS DELAYS SCREEN
	Vis.P13Delays.Status[0]	:=	HIDE	;
	Vis.P13Delays.Status[1]	:=	HIDE	;
	Vis.P13Delays.Status[2]	:=	HIDE	;
	Vis.P13Delays.Status[3]	:=	HIDE	;
	Vis.P13Delays.Status[4]	:=	HIDE	;
	Vis.P13Delays.Status[5]	:=	HIDE	;
	Vis.P13Delays.Status[6]	:=	HIDE	;
	Vis.P13Delays.Status[7]	:=	HIDE	;
	Vis.P13Delays.Status[8]	:=	HIDE	;
	Vis.P13Delays.Status[9]	:=	HIDE	;
	Vis.P13Delays.Status[10]	:=	HIDE	;
	Vis.P13Delays.Colour[0]	:=	BLUE	;
	Vis.P13Delays.Colour[1]	:=	BLUE	;
	Vis.P13Delays.Colour[2]	:=	BLUE	;
	Vis.P13Delays.Colour[3]	:=	BLUE	;
	Vis.P13Delays.Colour[4]	:=	BLUE	;
	Vis.P13Delays.Colour[5]	:=	BLUE	;
	Vis.P13Delays.Colour[6]	:=	BLUE	;
	Vis.P13Delays.Colour[7]	:=	BLUE	;
	Vis.P13Delays.Colour[8]	:=	BLUE	;

	CASE Vis.P13Delays.EnableIndex OF
		0..8://LayerDelay[1..9]
			Vis.P13Delays.Status[Vis.P13Delays.EnableIndex]	:=	SHOW	;
			Vis.P13Delays.Colour[Vis.P13Delays.EnableIndex]	:=	BLUE_ACTIVE	;
			Vis.P13Delays.Status[9]	:=	SHOW	;//LayerDelays
			Vis.P13.Status[1]	:=	HIDE	;//Layer2
			Vis.P13.Status[9]	:=	HIDE	;//Layers
		10:
			Vis.P13Delays.Status[10]	:=	SHOW	;
	END_CASE

	CASE Vis.P13Delays.EnableIndex OF
		0,3,4,7,8,24:
			Vis.CalcBelt.Disp	:=	HIDE	;
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	Vis.P13Delays.Changed	:=	FALSE	;
	Vis.P13Delays.New	:=	Vis.P13Delays.EnableIndex	;
	IF(Vis.P13Delays.New <> Vis.P13Delays.Old) THEN
		Vis.P13Delays.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(Vis.P13Delays.Changed) THEN
		Vis.P13Help1.EnableIndex	:=	24	;
		Vis.P13Help2.EnableIndex	:=	24	;
	END_IF
	Vis.P13Delays.Old	:=	Vis.P13Delays.EnableIndex	;

	//CALCULATOR FOR BELT DISPLAY
	IF (Vis.CalcBelt.Disp = SHOW) THEN
		IF (Vis.CalcBelt.Delay) THEN
			Vis.CalcBelt.Adjust	:= 	1 - ((Vis.CalcBelt.Unground + 300)/(Speeds.SpeedSeam/6))	;
		ELSE
			Vis.CalcBelt.Adjust	:= 	(Vis.CalcBelt.Unground + 300)/(Speeds.SpeedSeam/6);
		END_IF
		Vis.CalcBelt.New	:= 	(Vis.CalcBelt.Current + Vis.CalcBelt.Adjust)	;
	
		IF (Vis.CalcBelt.Unground = 0) THEN
			Vis.CalcBelt.Adjust	:= 	0	;
			Vis.CalcBelt.New	:= 	0	;
		END_IF
	END_IF

	//SETTINGS DRIVES SCREEN
	Vis.P13Drives.Status[0]	:=	HIDE	;
	Vis.P13Drives.Status[1]	:=	HIDE	;
	Vis.P13Drives.Status[2]	:=	HIDE	;
	Vis.P13Drives.Status[3]	:=	HIDE	;
	Vis.P13Drives.Status[4]	:=	HIDE	;
	Vis.P13Drives.Status[5]	:=	HIDE	;
	Vis.P13Drives.Status[6]	:=	HIDE	;
	Vis.P13Drives.Status[7]	:=	HIDE	;
	Vis.P13Drives.Status[8]	:=	HIDE	;
	Vis.P13Drives.Status[9]	:=	HIDE	;
	Vis.P13Drives.Status[10]:=	HIDE	;
	Vis.P13Drives.Status[11]:=	HIDE	;
	Vis.P13Drives.Status[12]:=	HIDE	;
	Vis.P13Drives.Status[13]:=	HIDE	;
	Vis.P13Drives.Status[14]:=	HIDE	;
	Vis.P13Drives.Status[15]:=	HIDE	;
	Vis.P13Drives.Status[20]:=	HIDE	;
	Vis.P13Drives.Status[21]:=	HIDE	;
	Vis.P13Drives.Status[22]:=	HIDE	;
	Vis.P13Drives.Colour[0]	:=	BLUE	;
	Vis.P13Drives.Colour[1]	:=	BLUE	;
	Vis.P13Drives.Colour[2]	:=	BLUE	;
	Vis.P13Drives.Colour[3]	:=	BLUE	;
	Vis.P13Drives.Colour[4]	:=	BLUE	;
	Vis.P13Drives.Colour[5]	:=	BLUE	;
	Vis.P13Drives.Colour[6]	:=	BLUE	;

	CASE Vis.P13Drives.EnableIndex OF
		0..6:
			Vis.P13Drives.Status[Vis.P13Drives.EnableIndex]	:=	SHOW	;
			Vis.P13Drives.Colour[Vis.P13Drives.EnableIndex]	:=	BLUE_ACTIVE	;
			Vis.P13Drives.Status[9]	:=	SHOW	;
			Vis.P13.Status[2]	:=	HIDE	;
			Vis.P13.Status[9]	:=	HIDE	;
			IF(Level.Level > SUPERVISOR) THEN
				Vis.P13Drives.Status[Vis.P13Drives.EnableIndex + 9]	:=	SHOW	;
			END_IF
		7:
			Vis.P13Drives.Status[7]	:=	SHOW	;
		8:
			Vis.P13Drives.Status[8]	:=	SHOW	;
	END_CASE

	CASE Vis.P13Drives.EnableIndex OF
		4:
			CASE InvPerms.CLB.Analog OF
				NO_ANALOG:
					AnalogStore.CLB.DisplayRaw := 0 ;
					AnalogStore.CLB.DisplaySpeed :=	0.0 ;
					AnalogStore.CLB.DisplayAnalog := 0.0 ;
				VOLTAGE_TYPE_1:
					AnalogStore.CLB.DisplayRaw := CLB.Input.AI1R ;
					AnalogStore.CLB.DisplaySpeed := AnalogPerm.CLB.V1.ActSpeed ;
					AnalogStore.CLB.DisplayAnalog := AnalogPerm.CLB.V1.ActAnalog ;
				CURRENT_TYPE_1: 
					AnalogStore.CLB.DisplayRaw := CLB.Input.AI3R ;
					AnalogStore.CLB.DisplaySpeed := AnalogPerm.CLB.C1.ActSpeed ;
					AnalogStore.CLB.DisplayAnalog := AnalogPerm.CLB.C1.ActAnalog ;
				CURRENT_TYPE_2:
					AnalogStore.CLB.DisplayRaw := CLB.Input.AI3R ;
					AnalogStore.CLB.DisplaySpeed := AnalogPerm.CLB.C2.ActSpeed ;
					AnalogStore.CLB.DisplayAnalog := AnalogPerm.CLB.C2.ActAnalog ;
			END_CASE

			IF(AnalogStore.CLB.RecordStart) THEN
				Vis.P13Drives.Status[22]	:=	SHOW	;
			END_IF
			IF(AnalogStore.CLB.RecordConfirm) THEN
				CASE InvPerms.CLB.Analog OF
					VOLTAGE_TYPE_1:
						AnalogStore.CLB.DisplayRaw	:=	CLB.Input.AI1R	;
						AnalogPerm.CLB.V1.ActAnalog	:=	UINT_TO_REAL(AnalogStore.CLB.DisplayRaw)	;
						AnalogPerm.CLB.V1.ActSpeed	:=	AnalogStore.CLB.SpeedDisp	;
					CURRENT_TYPE_1:
						AnalogStore.CLB.DisplayRaw	:=	CLB.Input.AI3R	;
						AnalogPerm.CLB.C1.ActAnalog	:=	UINT_TO_REAL(AnalogStore.CLB.DisplayRaw)	;
						AnalogPerm.CLB.C1.ActSpeed	:=	AnalogStore.CLB.SpeedDisp	;
					CURRENT_TYPE_2:
						AnalogStore.CLB.DisplayRaw	:=	CLB.Input.AI3R	;
						AnalogPerm.CLB.C2.ActAnalog	:=	UINT_TO_REAL(AnalogStore.CLB.DisplayRaw)	;
						AnalogPerm.CLB.C2.ActSpeed	:=	AnalogStore.CLB.SpeedDisp	;
				END_CASE
				AnalogStore.CLB.RecordStart	:=	FALSE	;
				AnalogStore.CLB.RecordConfirm	:=	FALSE	;
			END_IF
		ELSE
			AnalogStore.CLB.RecordStart	:=	FALSE	;
			AnalogStore.CLB.RecordConfirm	:=	FALSE	;
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	Vis.P13Drives.Changed	:=	FALSE	;
	Vis.P13Drives.New	:=	Vis.P13Drives.EnableIndex	;
	IF(Vis.P13Drives.New <> Vis.P13Drives.Old) THEN
		Vis.P13Drives.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(Vis.P13Drives.Changed) THEN
		Vis.P13Help1.EnableIndex	:=	24	;
		Vis.P13Help2.EnableIndex	:=	24	;
	END_IF
	Vis.P13Drives.Old	:=	Vis.P13Drives.EnableIndex	;

	//SETTINGS SERVOS SCREEN
	Vis.P13Servos.Status[0]	:=	HIDE	;
	Vis.P13Servos.Status[1]	:=	HIDE	;
	Vis.P13Servos.Status[2]	:=	HIDE	;
	Vis.P13Servos.Status[3]	:=	HIDE	;
	Vis.P13Servos.Status[4]	:=	HIDE	;
	Vis.P13Servos.Status[5]	:=	HIDE	;
	Vis.P13Servos.Status[6]	:=	HIDE	;
	Vis.P13Servos.Status[7]	:=	HIDE	;
	Vis.P13Servos.Status[8]	:=	HIDE	;
	Vis.P13Servos.Status[9]	:=	HIDE	;
	Vis.P13Servos.Colour[0]	:=	BLUE	;
	Vis.P13Servos.Colour[1]	:=	BLUE	;
	Vis.P13Servos.Colour[2]	:=	BLUE	;
	Vis.P13Servos.Colour[3]	:=	BLUE	;
	Vis.P13Servos.Colour[4]	:=	BLUE	;
	Vis.P13Servos.Colour[5]	:=	BLUE	;
	Vis.P13Servos.Colour[6]	:=	BLUE	;

	CASE Vis.P13Servos.EnableIndex OF
		0..6:
			Vis.P13Servos.Status[Vis.P13Servos.EnableIndex]	:=	SHOW	;
			Vis.P13Servos.Colour[Vis.P13Servos.EnableIndex]	:=	BLUE_ACTIVE	;
			Vis.P13Servos.Status[9]	:=	SHOW	;
			Vis.P13.Status[2]	:=	HIDE	;
			Vis.P13.Status[9]	:=	HIDE	;
		7:
			Vis.P13Servos.Status[7]	:=	SHOW	;
		8:
			Vis.P13Servos.Status[8]	:=	SHOW	;
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	Vis.P13Servos.Changed	:=	FALSE	;
	Vis.P13Servos.New	:=	Vis.P13Servos.EnableIndex	;
	IF(Vis.P13Servos.New <> Vis.P13Servos.Old) THEN
		Vis.P13Servos.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(Vis.P13Servos.Changed) THEN
		Vis.P13Help1.EnableIndex	:=	24	;
		Vis.P13Help2.EnableIndex	:=	24	;
	END_IF
	Vis.P13Servos.Old	:=	Vis.P13Servos.EnableIndex	;

	//SETTINGS SYSTEM SCREEN
	Vis.P13System.Status[0]	:=	HIDE	;
	Vis.P13System.Status[1]	:=	HIDE	;
	Vis.P13System.Status[2]	:=	HIDE	;
	Vis.P13System.Status[3]	:=	HIDE	;
	Vis.P13System.Status[4]	:=	HIDE	;
	Vis.P13System.Status[5]	:=	HIDE	;
	Vis.P13System.Status[6]	:=	HIDE	;
	Vis.P13System.Status[7]	:=	HIDE	;
	Vis.P13System.Status[8]	:=	HIDE	;
	Vis.P13System.Status[9]	:=	HIDE	;
	Vis.P13System.Colour[0]	:=	BLUE	;
	Vis.P13System.Colour[1]	:=	BLUE	;
	Vis.P13System.Colour[2]	:=	BLUE	;
	Vis.P13System.Colour[3]	:=	BLUE	;
	Vis.P13System.Colour[4]	:=	BLUE	;
	Vis.P13System.Colour[5]	:=	BLUE	;
	Vis.P13System.Colour[6]	:=	BLUE	;

	CASE Vis.P13System.EnableIndex OF
		0..6:
			Vis.P13System.Status[Vis.P13System.EnableIndex]	:=	SHOW	;
			Vis.P13System.Colour[Vis.P13System.EnableIndex]	:=	BLUE_ACTIVE	;
			Vis.P13System.Status[9]	:=	SHOW	;
			Vis.P13.Status[4]	:=	HIDE	;
			Vis.P13.Status[9]	:=	HIDE	;
		7:
			Vis.P13System.Status[7]	:=	SHOW	;
		8:
			Vis.P13System.Status[8]	:=	SHOW	;
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	Vis.P13System.Changed	:=	FALSE	;
	Vis.P13System.New	:=	Vis.P13System.EnableIndex	;
	IF(Vis.P13System.New <> Vis.P13System.Old) THEN
		Vis.P13System.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(Vis.P13System.Changed) THEN
		Vis.P13Help1.EnableIndex	:=	24	;
		Vis.P13Help2.EnableIndex	:=	24	;
	END_IF
	Vis.P13System.Old	:=	Vis.P13System.EnableIndex	;

	//SETTINGS TIMEOUT SCREEN
	Vis.P13Timeouts.Status[0]	:=	HIDE	;
	Vis.P13Timeouts.Status[1]	:=	HIDE	;
	Vis.P13Timeouts.Status[2]	:=	HIDE	;
	Vis.P13Timeouts.Status[3]	:=	HIDE	;
	Vis.P13Timeouts.Status[4]	:=	HIDE	;
	Vis.P13Timeouts.Status[5]	:=	HIDE	;
	Vis.P13Timeouts.Status[6]	:=	HIDE	;
	Vis.P13Timeouts.Status[7]	:=	HIDE	;
	Vis.P13Timeouts.Status[8]	:=	HIDE	;
	Vis.P13Timeouts.Status[9]	:=	HIDE	;
	Vis.P13Timeouts.Colour[0]	:=	BLUE	;
	Vis.P13Timeouts.Colour[1]	:=	BLUE	;
	Vis.P13Timeouts.Colour[2]	:=	BLUE	;
	Vis.P13Timeouts.Colour[3]	:=	BLUE	;
	Vis.P13Timeouts.Colour[4]	:=	BLUE	;
	Vis.P13Timeouts.Colour[5]	:=	BLUE	;
	Vis.P13Timeouts.Colour[6]	:=	BLUE	;

	CASE Vis.P13Timeouts.EnableIndex OF
		0..6:
			Vis.P13Timeouts.Status[Vis.P13Timeouts.EnableIndex]	:=	SHOW	;
			Vis.P13Timeouts.Colour[Vis.P13Timeouts.EnableIndex]	:=	BLUE_ACTIVE	;
			Vis.P13Timeouts.Status[9]	:=	SHOW	;
			Vis.P13.Status[5]	:=	HIDE	;
			Vis.P13.Status[9]	:=	HIDE	;
		7:
			Vis.P13Timeouts.Status[7]	:=	SHOW	;
		8:
			Vis.P13Timeouts.Status[8]	:=	SHOW	;
	END_CASE
	
	//CALCULATE WHEN LAYER HAS CHANGED
	Vis.P13Timeouts.Changed	:=	FALSE	;
	Vis.P13Timeouts.New	:=	Vis.P13Timeouts.EnableIndex	;
	IF(Vis.P13Timeouts.New <> Vis.P13Timeouts.Old) THEN
		Vis.P13Timeouts.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(Vis.P13Timeouts.Changed) THEN
		Vis.P13Help1.EnableIndex	:=	24	;
		Vis.P13Help2.EnableIndex	:=	24	;
	END_IF
	Vis.P13Timeouts.Old	:=	Vis.P13Timeouts.EnableIndex	;

	//HELP LAYERS CONTROL
	memcpy(ADR(Vis.P13Help1.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	Vis.P13Help1.Colour[0]	:=	BLUE	;	
	Vis.P13Help1.Colour[1]	:=	BLUE	;	
	Vis.P13Help1.Colour[2]	:=	BLUE	;	
	Vis.P13Help1.Colour[3]	:=	BLUE	;	
	Vis.P13Help1.Colour[4]	:=	BLUE	;	
	Vis.P13Help1.Colour[5]	:=	BLUE	;	
	Vis.P13Help1.Colour[6]	:=	BLUE	;	
	Vis.P13Help1.Colour[7]	:=	BLUE	;	
	Vis.P13Help1.Colour[8]	:=	BLUE	;	
	Vis.P13Help1.Colour[9]	:=	BLUE	;	

	CASE Vis.P13Help1.EnableIndex OF
		0..23:
			Vis.P13Help1.Status[Vis.P13Help1.EnableIndex]	:=	SHOW	;
		24:
			Vis.P13Help1.Index	:=	0	;
	END_CASE
	
	CASE Vis.P13Help1.Index OF
		0..9:
			Vis.P13Help1.Colour[Vis.P13Help1.Index]	:=	BLUE_ACTIVE	;
	END_CASE

	//HELP LAYERS CONTROL 2
	memcpy(ADR(Vis.P13Help2.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
	Vis.P13Help2.Colour[0]	:=	BLUE	;	
	Vis.P13Help2.Colour[1]	:=	BLUE	;	
	Vis.P13Help2.Colour[2]	:=	BLUE	;	
	Vis.P13Help2.Colour[3]	:=	BLUE	;	
	Vis.P13Help2.Colour[4]	:=	BLUE	;	
	Vis.P13Help2.Colour[5]	:=	BLUE	;	
	Vis.P13Help2.Colour[6]	:=	BLUE	;	
	Vis.P13Help2.Colour[7]	:=	BLUE	;	
	Vis.P13Help2.Colour[8]	:=	BLUE	;	
	Vis.P13Help2.Colour[9]	:=	BLUE	;	
	Vis.P13Help2.Colour[10]	:=	BLUE	;	

	CASE Vis.P13Help2.EnableIndex OF
		0..23:
			Vis.P13Help2.Status[Vis.P13Help2.EnableIndex]	:=	SHOW	;
		24:
			Vis.P13Help2.Index	:=	0	;
	END_CASE
	
	CASE Vis.P13Help2.Index OF
		0..10:
			Vis.P13Help2.Colour[Vis.P13Help2.Index]	:=	BLUE_ACTIVE	;
	END_CASE

END_PROGRAM

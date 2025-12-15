(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Page13
 * File: S_Page13.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Page13
 ********************************************************************)

PROGRAM _CYCLIC

	//SETTINGS SCREEN
	ServiceVis.P13.EnableIndex	:=	LIMIT(0,ServiceVis.P13.EnableIndex,24)	;
	ServiceVis.P13.Status[0]	:=	HIDE	;
	ServiceVis.P13.Status[1]	:=	HIDE	;
	ServiceVis.P13.Status[2]	:=	HIDE	;
	ServiceVis.P13.Status[3]	:=	HIDE	;
	ServiceVis.P13.Status[4]	:=	HIDE	;
	ServiceVis.P13.Status[5]	:=	HIDE	;
	ServiceVis.P13.Status[6]	:=	HIDE	;
	ServiceVis.P13.Status[7]	:=	HIDE	;
	ServiceVis.P13.Status[8]	:=	HIDE	;
	ServiceVis.P13.Status[9]	:=	HIDE	;
	ServiceVis.P13.Status[10]	:=	HIDE	;
	ServiceVis.P13.Colour[1]	:=	BLUE	;
	ServiceVis.P13.Colour[2]	:=	BLUE	;
	ServiceVis.P13.Colour[3]	:=	BLUE	;
	ServiceVis.P13.Colour[4]	:=	BLUE	;
	ServiceVis.P13.Colour[5]	:=	BLUE	;
	ServiceVis.P13.Colour[6]	:=	BLUE	;
	
	
	CASE ServiceVis.P13.EnableIndex OF
		0:
			ServiceVis.P13.Status[0]	:=	SHOW	;
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
		1:
			ServiceVis.P13.Status[1]	:=	SHOW	;
			ServiceVis.P13.Status[9]	:=	SHOW	;
			ServiceVis.P13.Colour[1]	:=	BLUE_ACTIVE	;
		2:
			ServiceVis.P13.Status[2]	:=	SHOW	;
			ServiceVis.P13.Status[9]	:=	SHOW	;
			ServiceVis.P13.Colour[2]	:=	BLUE_ACTIVE	;
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
		3:
			ServiceVis.P13.Status[3]	:=	SHOW	;
			ServiceVis.P13.Status[9]	:=	SHOW	;
			ServiceVis.P13.Colour[3]	:=	BLUE_ACTIVE	;
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
		4:
			ServiceVis.P13.Status[4]	:=	SHOW	;
			ServiceVis.P13.Status[9]	:=	SHOW	;
			ServiceVis.P13.Colour[4]	:=	BLUE_ACTIVE	;
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
		5:
			ServiceVis.P13.Status[5]	:=	SHOW	;
			ServiceVis.P13.Status[9]	:=	SHOW	;
			ServiceVis.P13.Colour[5]	:=	BLUE_ACTIVE	;
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
		6:
			ServiceVis.P13.Status[6]	:=	SHOW	;
			ServiceVis.P13.Status[9]	:=	SHOW	;
			ServiceVis.P13.Colour[6]	:=	BLUE_ACTIVE	;
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
		7:
			ServiceVis.P13.Status[7]	:=	SHOW	;
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
		8:
			ServiceVis.P13.Status[8]	:=	SHOW	;
			ServiceVis.P13.Status[3]	:=	SHOW	;
			ServiceVis.P13.Status[9]	:=	SHOW	;
			ServiceVis.P13.Colour[3]	:=	BLUE_ACTIVE	;
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
		10:
			ServiceVis.P13.Status[10]	:=	SHOW	;
			ServiceVis.P13.Status[6]	:=	SHOW	;
			ServiceVis.P13.Status[9]	:=	SHOW	;
			ServiceVis.P13.Colour[6]	:=	BLUE_ACTIVE	;
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
			
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	ServiceVis.P13.Changed	:=	FALSE	;
	ServiceVis.P13.New	:=	ServiceVis.P13.EnableIndex	;
	IF(ServiceVis.P13.New <> ServiceVis.P13.Old) THEN
		ServiceVis.P13.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(ServiceVis.P13.Changed) THEN
		ServiceVis.P13Delays.EnableIndex	:=	24	;
		ServiceVis.P13Servos.EnableIndex	:=	24	;
		ServiceVis.P13System.EnableIndex	:=	24	;
		ServiceVis.P13Timeouts.EnableIndex	:=	24	;
		ServiceVis.P13Help1.EnableIndex	:=	24	;
		ServiceVis.P13Help2.EnableIndex	:=	24	;
	END_IF
	ServiceVis.P13.Old	:=	ServiceVis.P13.EnableIndex	;

	//SETTINGS DELAYS SCREEN
	ServiceVis.P13Delays.Status[0]	:=	HIDE	;
	ServiceVis.P13Delays.Status[1]	:=	HIDE	;
	ServiceVis.P13Delays.Status[2]	:=	HIDE	;
	ServiceVis.P13Delays.Status[3]	:=	HIDE	;
	ServiceVis.P13Delays.Status[4]	:=	HIDE	;
	ServiceVis.P13Delays.Status[5]	:=	HIDE	;
	ServiceVis.P13Delays.Status[6]	:=	HIDE	;
	ServiceVis.P13Delays.Status[7]	:=	HIDE	;
	ServiceVis.P13Delays.Status[8]	:=	HIDE	;
	ServiceVis.P13Delays.Status[9]	:=	HIDE	;
	ServiceVis.P13Delays.Status[10]	:=	HIDE	;
	ServiceVis.P13Delays.Colour[0]	:=	BLUE	;
	ServiceVis.P13Delays.Colour[1]	:=	BLUE	;
	ServiceVis.P13Delays.Colour[2]	:=	BLUE	;
	ServiceVis.P13Delays.Colour[3]	:=	BLUE	;
	ServiceVis.P13Delays.Colour[4]	:=	BLUE	;
	ServiceVis.P13Delays.Colour[5]	:=	BLUE	;
	ServiceVis.P13Delays.Colour[6]	:=	BLUE	;
	ServiceVis.P13Delays.Colour[7]	:=	BLUE	;
	ServiceVis.P13Delays.Colour[8]	:=	BLUE	;

	CASE ServiceVis.P13Delays.EnableIndex OF
		0..8://LayerDelay[1..9]
			ServiceVis.P13Delays.Status[ServiceVis.P13Delays.EnableIndex]	:=	SHOW	;
			ServiceVis.P13Delays.Colour[ServiceVis.P13Delays.EnableIndex]	:=	BLUE_ACTIVE	;
			ServiceVis.P13Delays.Status[9]	:=	SHOW	;//LayerDelays
			ServiceVis.P13.Status[1]	:=	HIDE	;//Layer2
			ServiceVis.P13.Status[9]	:=	HIDE	;//Layers
		10:
			ServiceVis.P13Delays.Status[10]	:=	SHOW	;
	END_CASE

	CASE ServiceVis.P13Delays.EnableIndex OF
		0,2,4,5,6,7,8,24:
			ServiceVis.CalcBelt.Disp	:=	HIDE	;
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	ServiceVis.P13Delays.Changed	:=	FALSE	;
	ServiceVis.P13Delays.New	:=	ServiceVis.P13Delays.EnableIndex	;
	IF(ServiceVis.P13Delays.New <> ServiceVis.P13Delays.Old) THEN
		ServiceVis.P13Delays.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(ServiceVis.P13Delays.Changed) THEN
		ServiceVis.P13Help1.EnableIndex	:=	24	;
		ServiceVis.P13Help2.EnableIndex	:=	24	;
	END_IF
	ServiceVis.P13Delays.Old	:=	ServiceVis.P13Delays.EnableIndex	;

	//CALCULATOR FOR BELT DISPLAY
	IF (ServiceVis.CalcBelt.Disp = SHOW) THEN
		IF (ServiceVis.CalcBelt.Delay) THEN
			ServiceVis.CalcBelt.Adjust	:= 	1 - ((ServiceVis.CalcBelt.Unground + 300)/(Speeds.SpeedSeam/6))	;
		ELSE
			ServiceVis.CalcBelt.Adjust	:= 	(ServiceVis.CalcBelt.Unground + 300)/(Speeds.SpeedSeam/6);
		END_IF
		ServiceVis.CalcBelt.New	:= 	(ServiceVis.CalcBelt.Current + ServiceVis.CalcBelt.Adjust)	;
	
		IF (ServiceVis.CalcBelt.Unground = 0) THEN
			ServiceVis.CalcBelt.Adjust	:= 	0	;
			ServiceVis.CalcBelt.New	:= 	0	;
		END_IF
	END_IF

	//SETTINGS DRIVES SCREEN
	ServiceVis.P13Drives.Status[0]	:=	HIDE	;
	ServiceVis.P13Drives.Status[1]	:=	HIDE	;
	ServiceVis.P13Drives.Status[2]	:=	HIDE	;
	ServiceVis.P13Drives.Status[3]	:=	HIDE	;
	ServiceVis.P13Drives.Status[4]	:=	HIDE	;
	ServiceVis.P13Drives.Status[5]	:=	HIDE	;
	ServiceVis.P13Drives.Status[6]	:=	HIDE	;
	ServiceVis.P13Drives.Status[7]	:=	HIDE	;
	ServiceVis.P13Drives.Status[8]	:=	HIDE	;
	ServiceVis.P13Drives.Status[9]	:=	HIDE	;
	ServiceVis.P13Drives.Status[10]:=	HIDE	;
	ServiceVis.P13Drives.Status[11]:=	HIDE	;
	ServiceVis.P13Drives.Status[12]:=	HIDE	;
	ServiceVis.P13Drives.Status[13]:=	HIDE	;
	ServiceVis.P13Drives.Status[14]:=	HIDE	;
	ServiceVis.P13Drives.Status[15]:=	HIDE	;
	ServiceVis.P13Drives.Status[20]:=	HIDE	;
	ServiceVis.P13Drives.Status[21]:=	HIDE	;
	ServiceVis.P13Drives.Status[22]:=	HIDE	;
	ServiceVis.P13Drives.Colour[0]	:=	BLUE	;
	ServiceVis.P13Drives.Colour[1]	:=	BLUE	;
	ServiceVis.P13Drives.Colour[2]	:=	BLUE	;
	ServiceVis.P13Drives.Colour[3]	:=	BLUE	;
	ServiceVis.P13Drives.Colour[4]	:=	BLUE	;
	ServiceVis.P13Drives.Colour[5]	:=	BLUE	;
	ServiceVis.P13Drives.Colour[6]	:=	BLUE	;

	CASE ServiceVis.P13Drives.EnableIndex OF
		0..6:
			ServiceVis.P13Drives.Status[ServiceVis.P13Drives.EnableIndex]	:=	SHOW	;
			ServiceVis.P13Drives.Colour[ServiceVis.P13Drives.EnableIndex]	:=	BLUE_ACTIVE	;
			ServiceVis.P13Drives.Status[9]	:=	SHOW	;
			ServiceVis.P13.Status[2]	:=	HIDE	;
			ServiceVis.P13.Status[9]	:=	HIDE	;
			IF(ServiceLevel.Level > SUPERVISOR) THEN
				ServiceVis.P13Drives.Status[ServiceVis.P13Drives.EnableIndex + 9]	:=	SHOW	;
			END_IF
		7:
			ServiceVis.P13Drives.Status[7]	:=	SHOW	;
		8:
			ServiceVis.P13Drives.Status[8]	:=	SHOW	;
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	ServiceVis.P13Drives.Changed	:=	FALSE	;
	ServiceVis.P13Drives.New	:=	ServiceVis.P13Drives.EnableIndex	;
	IF(ServiceVis.P13Drives.New <> ServiceVis.P13Drives.Old) THEN
		ServiceVis.P13Drives.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(ServiceVis.P13Drives.Changed) THEN
		ServiceVis.P13Help1.EnableIndex	:=	24	;
		ServiceVis.P13Help2.EnableIndex	:=	24	;
	END_IF
	ServiceVis.P13Drives.Old	:=	ServiceVis.P13Drives.EnableIndex	;

	//HIGHLIGHT SELECTED BATCHING MODE COLOUR
	CASE InvPerms.CLB.Analog OF
		NO_ANALOG:
			ServiceVis.P13.Colour[7]	:=	WHITE			;
			ServiceVis.P13.Colour[8]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[9]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[10]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[11]	:=	DROP_UNSELECTED	;
		VOLTAGE_TYPE_1:
			ServiceVis.P13.Colour[7]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[8]	:=	WHITE			;
			ServiceVis.P13.Colour[9]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[10]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[11]	:=	DROP_UNSELECTED	;
		CURRENT_TYPE_1:
			ServiceVis.P13.Colour[7]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[8]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[9]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[10]	:=	WHITE			;
			ServiceVis.P13.Colour[11]	:=	DROP_UNSELECTED	;
		CURRENT_TYPE_2:
			ServiceVis.P13.Colour[7]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[8]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[9]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[10]	:=	DROP_UNSELECTED	;
			ServiceVis.P13.Colour[11]	:=	WHITE			;
	END_CASE
		
	//SETTINGS SERVOS SCREEN
	ServiceVis.P13Servos.Status[0]	:=	HIDE	;
	ServiceVis.P13Servos.Status[1]	:=	HIDE	;
	ServiceVis.P13Servos.Status[2]	:=	HIDE	;
	ServiceVis.P13Servos.Status[3]	:=	HIDE	;
	ServiceVis.P13Servos.Status[4]	:=	HIDE	;
	ServiceVis.P13Servos.Status[5]	:=	HIDE	;
	ServiceVis.P13Servos.Status[6]	:=	HIDE	;
	ServiceVis.P13Servos.Status[7]	:=	HIDE	;
	ServiceVis.P13Servos.Status[8]	:=	HIDE	;
	ServiceVis.P13Servos.Status[9]	:=	HIDE	;
	ServiceVis.P13Servos.Colour[0]	:=	BLUE	;
	ServiceVis.P13Servos.Colour[1]	:=	BLUE	;
	ServiceVis.P13Servos.Colour[2]	:=	BLUE	;
	ServiceVis.P13Servos.Colour[3]	:=	BLUE	;
	ServiceVis.P13Servos.Colour[4]	:=	BLUE	;
	ServiceVis.P13Servos.Colour[5]	:=	BLUE	;
	ServiceVis.P13Servos.Colour[6]	:=	BLUE	;

	CASE ServiceVis.P13Servos.EnableIndex OF
		0..6:
			ServiceVis.P13Servos.Status[ServiceVis.P13Servos.EnableIndex]	:=	SHOW	;
			ServiceVis.P13Servos.Colour[ServiceVis.P13Servos.EnableIndex]	:=	BLUE_ACTIVE	;
			ServiceVis.P13Servos.Status[9]	:=	SHOW	;
			ServiceVis.P13.Status[2]	:=	HIDE	;
			ServiceVis.P13.Status[9]	:=	HIDE	;
		7:
			ServiceVis.P13Servos.Status[7]	:=	SHOW	;
		8:
			ServiceVis.P13Servos.Status[8]	:=	SHOW	;
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	ServiceVis.P13Servos.Changed	:=	FALSE	;
	ServiceVis.P13Servos.New	:=	ServiceVis.P13Servos.EnableIndex	;
	IF(ServiceVis.P13Servos.New <> ServiceVis.P13Servos.Old) THEN
		ServiceVis.P13Servos.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(ServiceVis.P13Servos.Changed) THEN
		ServiceVis.P13Help1.EnableIndex	:=	24	;
		ServiceVis.P13Help2.EnableIndex	:=	24	;
	END_IF
	ServiceVis.P13Servos.Old	:=	ServiceVis.P13Servos.EnableIndex	;

	//SETTINGS SYSTEM SCREEN
	ServiceVis.P13System.Status[0]	:=	HIDE	;
	ServiceVis.P13System.Status[1]	:=	HIDE	;
	ServiceVis.P13System.Status[2]	:=	HIDE	;
	ServiceVis.P13System.Status[3]	:=	HIDE	;
	ServiceVis.P13System.Status[4]	:=	HIDE	;
	ServiceVis.P13System.Status[5]	:=	HIDE	;
	ServiceVis.P13System.Status[6]	:=	HIDE	;
	ServiceVis.P13System.Status[7]	:=	HIDE	;
	ServiceVis.P13System.Status[8]	:=	HIDE	;
	ServiceVis.P13System.Status[9]	:=	HIDE	;
	ServiceVis.P13System.Colour[0]	:=	BLUE	;
	ServiceVis.P13System.Colour[1]	:=	BLUE	;
	ServiceVis.P13System.Colour[2]	:=	BLUE	;
	ServiceVis.P13System.Colour[3]	:=	BLUE	;
	ServiceVis.P13System.Colour[4]	:=	BLUE	;
	ServiceVis.P13System.Colour[5]	:=	BLUE	;
	ServiceVis.P13System.Colour[6]	:=	BLUE	;

	CASE ServiceVis.P13System.EnableIndex OF
		0..6:
			ServiceVis.P13System.Status[ServiceVis.P13System.EnableIndex]	:=	SHOW	;
			ServiceVis.P13System.Colour[ServiceVis.P13System.EnableIndex]	:=	BLUE_ACTIVE	;
			ServiceVis.P13System.Status[9]	:=	SHOW	;
			ServiceVis.P13.Status[4]	:=	HIDE	;
			ServiceVis.P13.Status[9]	:=	HIDE	;
		7:
			ServiceVis.P13System.Status[7]	:=	SHOW	;
		8:
			ServiceVis.P13System.Status[8]	:=	SHOW	;
	END_CASE

	//CALCULATE WHEN LAYER HAS CHANGED
	ServiceVis.P13System.Changed	:=	FALSE	;
	ServiceVis.P13System.New	:=	ServiceVis.P13System.EnableIndex	;
	IF(ServiceVis.P13System.New <> ServiceVis.P13System.Old) THEN
		ServiceVis.P13System.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(ServiceVis.P13System.Changed) THEN
		ServiceVis.P13Help1.EnableIndex	:=	24	;
		ServiceVis.P13Help2.EnableIndex	:=	24	;
	END_IF
	ServiceVis.P13System.Old	:=	ServiceVis.P13System.EnableIndex	;

	//SETTINGS TIMEOUT SCREEN
	ServiceVis.P13Timeouts.Status[0]	:=	HIDE	;
	ServiceVis.P13Timeouts.Status[1]	:=	HIDE	;
	ServiceVis.P13Timeouts.Status[2]	:=	HIDE	;
	ServiceVis.P13Timeouts.Status[3]	:=	HIDE	;
	ServiceVis.P13Timeouts.Status[4]	:=	HIDE	;
	ServiceVis.P13Timeouts.Status[5]	:=	HIDE	;
	ServiceVis.P13Timeouts.Status[6]	:=	HIDE	;
	ServiceVis.P13Timeouts.Status[7]	:=	HIDE	;
	ServiceVis.P13Timeouts.Status[8]	:=	HIDE	;
	ServiceVis.P13Timeouts.Status[9]	:=	HIDE	;
	ServiceVis.P13Timeouts.Colour[0]	:=	BLUE	;
	ServiceVis.P13Timeouts.Colour[1]	:=	BLUE	;
	ServiceVis.P13Timeouts.Colour[2]	:=	BLUE	;
	ServiceVis.P13Timeouts.Colour[3]	:=	BLUE	;
	ServiceVis.P13Timeouts.Colour[4]	:=	BLUE	;
	ServiceVis.P13Timeouts.Colour[5]	:=	BLUE	;
	ServiceVis.P13Timeouts.Colour[6]	:=	BLUE	;

	CASE ServiceVis.P13Timeouts.EnableIndex OF
		0..6:
			ServiceVis.P13Timeouts.Status[ServiceVis.P13Timeouts.EnableIndex]	:=	SHOW	;
			ServiceVis.P13Timeouts.Colour[ServiceVis.P13Timeouts.EnableIndex]	:=	BLUE_ACTIVE	;
			ServiceVis.P13Timeouts.Status[9]	:=	SHOW	;
			ServiceVis.P13.Status[5]	:=	HIDE	;
			ServiceVis.P13.Status[9]	:=	HIDE	;
		7:
			ServiceVis.P13Timeouts.Status[7]	:=	SHOW	;
		8:
			ServiceVis.P13Timeouts.Status[8]	:=	SHOW	;
	END_CASE
	
	//CALCULATE WHEN LAYER HAS CHANGED
	ServiceVis.P13Timeouts.Changed	:=	FALSE	;
	ServiceVis.P13Timeouts.New	:=	ServiceVis.P13Timeouts.EnableIndex	;
	IF(ServiceVis.P13Timeouts.New <> ServiceVis.P13Timeouts.Old) THEN
		ServiceVis.P13Timeouts.Changed	:=	TRUE	;
	END_IF
	IF EDGEPOS(ServiceVis.P13Timeouts.Changed) THEN
		ServiceVis.P13Help1.EnableIndex	:=	24	;
		ServiceVis.P13Help2.EnableIndex	:=	24	;
	END_IF
	ServiceVis.P13Timeouts.Old	:=	ServiceVis.P13Timeouts.EnableIndex	;

	//HELP LAYERS CONTROL
	memcpy(ADR(ServiceVis.P13Help1.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
	ServiceVis.P13Help1.Colour[0]	:=	BLUE	;	
	ServiceVis.P13Help1.Colour[1]	:=	BLUE	;	
	ServiceVis.P13Help1.Colour[2]	:=	BLUE	;	
	ServiceVis.P13Help1.Colour[3]	:=	BLUE	;	
	ServiceVis.P13Help1.Colour[4]	:=	BLUE	;	
	ServiceVis.P13Help1.Colour[5]	:=	BLUE	;	
	ServiceVis.P13Help1.Colour[6]	:=	BLUE	;	
	ServiceVis.P13Help1.Colour[7]	:=	BLUE	;	
	ServiceVis.P13Help1.Colour[8]	:=	BLUE	;	
	ServiceVis.P13Help1.Colour[9]	:=	BLUE	;	

	CASE ServiceVis.P13Help1.EnableIndex OF
		0..23:
			ServiceVis.P13Help1.Status[ServiceVis.P13Help1.EnableIndex]	:=	SHOW	;
		24:
			ServiceVis.P13Help1.Index	:=	0	;
	END_CASE
	
	CASE ServiceVis.P13Help1.Index OF
		0..9:
			ServiceVis.P13Help1.Colour[ServiceVis.P13Help1.Index]	:=	BLUE_ACTIVE	;
	END_CASE
	
	//HELP LAYERS CONTROL 2
	memcpy(ADR(ServiceVis.P13Help2.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
	ServiceVis.P13Help2.Colour[0]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[1]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[2]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[3]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[4]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[5]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[6]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[7]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[8]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[9]	:=	BLUE	;	
	ServiceVis.P13Help2.Colour[10]	:=	BLUE	;	

	CASE ServiceVis.P13Help2.EnableIndex OF
		0..23:
			ServiceVis.P13Help2.Status[ServiceVis.P13Help2.EnableIndex]	:=	SHOW	;
		24:
			ServiceVis.P13Help2.Index	:=	0	;
	END_CASE
	
	CASE ServiceVis.P13Help2.Index OF
		0..10:
			ServiceVis.P13Help2.Colour[ServiceVis.P13Help2.Index]	:=	BLUE_ACTIVE	;
	END_CASE
		
END_PROGRAM

(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Page11
 * File: S_Page11.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Page11
 ********************************************************************)

PROGRAM _CYCLIC

    //MIMIC SCREEN
    memcpy(ADR(ServiceVis.P11.Status),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
    memcpy(ADR(ServiceVis.P11.Status1),ADR(ServiceVis.HideAll),SIZEOF(ServiceVis.HideAll));
    //DISPLAY TRACK BLOCK CONDITION CONTROL
    ServiceVis.P11.Layers.Layer1 := HIDE ;
    ServiceVis.P11.Layers.Layer2 := HIDE ;
    ServiceVis.P11.Layers.Layer3 := HIDE ;
    ServiceVis.P11.Layers.Layer4 := HIDE ;
    ServiceVis.P11.Layers.Layer5 := HIDE ;
    ServiceVis.P11.Layers.Layer6 := HIDE ;
    ServiceVis.P11.Layers.Layer7 := HIDE ;
    ServiceVis.P11.Layers.Layer8 := HIDE ;
    ServiceVis.P11.Layers.Layer9 := HIDE ;
    ServiceVis.P11.Layers.Layer10 := HIDE ;
    ServiceVis.P11.Layers.Layer11 := HIDE ;
    ServiceVis.P11.Layers.Layer12 := HIDE ;
    ServiceVis.P11.Layers.Layer13 := HIDE ;
    ServiceVis.P11.Layers.Layer14 := HIDE ;
    ServiceVis.P11.Layers.Layer15 := HIDE ;

    CASE ServiceVis.P11.EnableIndex OF
		0:
			ServiceVis.P11.Status[0] := SHOW ;
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking20.Busy) THEN
				ServiceVis.P11.Status1[0] := SHOW ;
			END_IF
			IF(Track208.Active) AND(Tracking20.Blocked) THEN
				ServiceVis.P11.Layers.Layer1 := SHOW ;
			END_IF
		1:
			ServiceVis.P11.Status[1] := SHOW ;
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking30.Busy) THEN
				ServiceVis.P11.Status1[1] := SHOW ;
			END_IF
			IF(Track302.Active) AND(Tracking30.Blocked) THEN
				ServiceVis.P11.Layers.Layer2 := SHOW ;
			END_IF
		2:
			ServiceVis.P11.Status[2] := SHOW ;
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking40.Busy) THEN
				ServiceVis.P11.Status1[2] := SHOW ;
			END_IF
			IF(Track402.Active) AND(Tracking40.Blocked) THEN
				ServiceVis.P11.Layers.Layer3 := SHOW ;
			END_IF
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking41.Busy) THEN
				ServiceVis.P11.Status1[3] := SHOW ;
			END_IF
		3:
			ServiceVis.P11.Status[3] := SHOW ;
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking50.Busy) THEN
				ServiceVis.P11.Status1[4] := SHOW ;
			END_IF
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking80.Busy) THEN
				ServiceVis.P11.Status1[5] := SHOW ;
			END_IF
		4:
			ServiceVis.P11.Status[4] := SHOW ;
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking60.Busy) THEN
				ServiceVis.P11.Status1[6] := SHOW ;
			END_IF
			IF(Track603.Active) AND(Tracking60.Blocked) THEN
				ServiceVis.P11.Layers.Layer4 := SHOW ;
			END_IF
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking70.Busy) THEN
				ServiceVis.P11.Status1[7] := SHOW ;
			END_IF
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking81.Busy) THEN
				ServiceVis.P11.Status1[8] := SHOW ;
			END_IF
			IF(Track812.Active) AND(Tracking81.Blocked) THEN
				ServiceVis.P11.Layers.Layer5 := SHOW ;
			END_IF
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking82.Busy) THEN
				ServiceVis.P11.Status1[9] := SHOW ;
			END_IF
		5:
			ServiceVis.P11.Status[5] := SHOW ;
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking00.Busy) THEN
				ServiceVis.P11.Status1[10] := SHOW ;
			END_IF
			IF(Track005.Active) AND(Tracking00.Blocked) THEN
				ServiceVis.P11.Layers.Layer6 := SHOW ;
			END_IF
			IF(Track004.Active) AND(Ax1.Block) THEN
				ServiceVis.P11.Layers.Layer7 := SHOW ;
			END_IF
		6:
			ServiceVis.P11.Status[6] := SHOW ;
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking10.Busy) THEN
				ServiceVis.P11.Status1[11] := SHOW ;
			END_IF
			IF(Track108.Active) AND(Tracking10.Blocked) THEN
				ServiceVis.P11.Layers.Layer8 := SHOW ;
			END_IF
		7:
			ServiceVis.P11.Status[7] := SHOW ;
			IF(ServiceLevel.Level > OPERATOR) AND(Tracking11.Busy) THEN
				ServiceVis.P11.Status1[12] := SHOW ;
			END_IF
			IF(Track115.Active) AND(Tracking11.Blocked) THEN
				ServiceVis.P11.Layers.Layer9 := SHOW ;
			END_IF
			IF(Track114.Active) AND(Ax2.Block) THEN
				ServiceVis.P11.Layers.Layer10 := SHOW ;
			END_IF
		8:
			ServiceVis.P11.Status[8] := SHOW ;
			IF(Reset.Count) THEN
				Reset.Grind := TRUE ;
				Reset.Time := TRUE ;
			ELSE
				Reset.Grind := FALSE ;
				Reset.Time := FALSE ;
			END_IF
		9:
			ServiceVis.P11.Status[9]	:=	SHOW	;
			IF((Track501.Active) OR(Track601.Active)) AND NOT((Tracking00.Busy) OR(Tracking10.Busy) OR(Tracking11.Busy) OR(Tracking20.Busy) OR(Tracking30.Busy) OR(Tracking30.Busy) OR(Tracking41.Busy) OR(Tracking70.Busy)) THEN //CHANGE TRACKING REGISTER AS REQUIRED
				ServiceVis.P11.Status1[17]	:=	SHOW	;
			END_IF
		10:
			ServiceVis.P11.Status[10]	:=	SHOW	;
		20:
			ServiceVis.P11.Status[20]	:=	SHOW	;
			ServiceVis.Start.Enable	:=	HIDE	;
		21:
			ServiceVis.P11.Status[21]	:=	SHOW	;
		22:
			ServiceVis.P11.Status[22]	:=	SHOW	;	
	END_CASE
	
	IF NOT(Control.Achieved1) THEN
		ServiceVis.P11.Status[16] :=	SHOW	;
	END_IF
	IF NOT(Control.Achieved2) THEN
		ServiceVis.P11.Status[17] :=	SHOW	;
	END_IF
	IF NOT(WashRun.In) THEN
		ServiceVis.P11.Status[18] :=	SHOW	;
	END_IF
	IF NOT(FurnReady.Int) THEN
		ServiceVis.P11.Status[19] :=	SHOW	;
	END_IF

END_PROGRAM

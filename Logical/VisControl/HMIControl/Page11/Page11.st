(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Page11
 * File: Page11.st
 * Author: NickE
 * Created: January 31, 2013
 ********************************************************************
 * Implementation of program Page11
 ********************************************************************)

PROGRAM _CYCLIC

    //MIMIC SCREEN
    memcpy(ADR(Vis.P11.Status),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
    memcpy(ADR(Vis.P11.Status1),ADR(Vis.HideAll),SIZEOF(Vis.HideAll));
    //DISPLAY TRACK BLOCK CONDITION CONTROL
    Vis.P11.Layers.Layer1 := HIDE ;
    Vis.P11.Layers.Layer2 := HIDE ;
    Vis.P11.Layers.Layer3 := HIDE ;
    Vis.P11.Layers.Layer4 := HIDE ;
    Vis.P11.Layers.Layer5 := HIDE ;
    Vis.P11.Layers.Layer6 := HIDE ;
    Vis.P11.Layers.Layer7 := HIDE ;
    Vis.P11.Layers.Layer8 := HIDE ;
    Vis.P11.Layers.Layer9 := HIDE ;
    Vis.P11.Layers.Layer10 := HIDE ;
    Vis.P11.Layers.Layer11 := HIDE ;
    Vis.P11.Layers.Layer12 := HIDE ;
    Vis.P11.Layers.Layer13 := HIDE ;
    Vis.P11.Layers.Layer14 := HIDE ;
    Vis.P11.Layers.Layer15 := HIDE ;

    CASE Vis.P11.EnableIndex OF
        0:
            Vis.P11.Status[0] := SHOW ;
            IF(Level.Level > OPERATOR) AND(Tracking20.Busy) THEN
                Vis.P11.Status1[0] := SHOW ;
            END_IF
            IF(Track208.Active) AND(Tracking20.Blocked) THEN
                Vis.P11.Layers.Layer1 := SHOW ;
            END_IF
        1:
            Vis.P11.Status[1] := SHOW ;
            IF(Level.Level > OPERATOR) AND(Tracking30.Busy) THEN
                Vis.P11.Status1[1] := SHOW ;
            END_IF
			IF(Track302.Active) AND(Tracking30.Blocked) THEN
				Vis.P11.Layers.Layer2 := SHOW ;
			END_IF
        2:
            Vis.P11.Status[2] := SHOW ;
            IF(Level.Level > OPERATOR) AND(Tracking40.Busy) THEN
                Vis.P11.Status1[2] := SHOW ;
            END_IF
			IF(Track402.Active) AND(Tracking40.Blocked) THEN
				Vis.P11.Layers.Layer3 := SHOW ;
			END_IF
			IF(Level.Level > OPERATOR) AND(Tracking41.Busy) THEN
				Vis.P11.Status1[3] := SHOW ;
			END_IF
        3:
            Vis.P11.Status[3] := SHOW ;
            IF(Level.Level > OPERATOR) AND(Tracking50.Busy) THEN
                Vis.P11.Status1[4] := SHOW ;
            END_IF
			IF(Level.Level > OPERATOR) AND(Tracking80.Busy) THEN
				Vis.P11.Status1[5] := SHOW ;
			END_IF
			IF(Level.Level > OPERATOR) AND(Tracking51.Busy) THEN
				Vis.P11.Status[13] := SHOW ;
			END_IF
			IF(Track513.Active) AND(Tracking51.Blocked) THEN
				Vis.P11.Layers.Layer11 := SHOW ;
			END_IF
		4:
			Vis.P11.Status[4] := SHOW ;
			IF(Level.Level > OPERATOR) AND(Tracking60.Busy) THEN
				Vis.P11.Status1[6] := SHOW ;
			END_IF
			IF(Track603.Active) AND(Tracking60.Blocked) THEN
				Vis.P11.Layers.Layer4 := SHOW ;
			END_IF
			IF(Level.Level > OPERATOR) AND(Tracking70.Busy) THEN
				Vis.P11.Status1[7] := SHOW ;
			END_IF
			IF(Level.Level > OPERATOR) AND(Tracking81.Busy) THEN
				Vis.P11.Status1[8] := SHOW ;
			END_IF
			IF(Track812.Active) AND(Tracking81.Blocked) THEN
				Vis.P11.Layers.Layer5 := SHOW ;
			END_IF
			IF(Level.Level > OPERATOR) AND(Tracking82.Busy) THEN
				Vis.P11.Status1[9] := SHOW ;
			END_IF
			IF(Track521.Active) AND(Tracking52.Blocked) THEN
				Vis.P11.Layers.Layer12 := SHOW ;
			END_IF
			IF(Level.Level > OPERATOR) AND(Tracking52.Busy) THEN
				Vis.P11.Status1[13] := SHOW ;
			END_IF
		5:
			Vis.P11.Status[5] := SHOW ;
			IF(Level.Level > OPERATOR) AND(Tracking00.Busy) THEN
				Vis.P11.Status1[10] := SHOW ;
			END_IF
			IF(Track005.Active) AND(Tracking00.Blocked) THEN
				Vis.P11.Layers.Layer6 := SHOW ;
			END_IF
			IF(Track004.Active) AND(Ax1.Block) THEN
				Vis.P11.Layers.Layer7 := SHOW ;
			END_IF
		6:
			Vis.P11.Status[6] := SHOW ;
			IF(Level.Level > OPERATOR) AND(Tracking10.Busy) THEN
				Vis.P11.Status1[11] := SHOW ;
			END_IF
			IF(Track108.Active) AND(Tracking10.Blocked) THEN
				Vis.P11.Layers.Layer8 := SHOW ;
			END_IF
		7:
			Vis.P11.Status[7] := SHOW ;
			IF(Level.Level > OPERATOR) AND(Tracking11.Busy) THEN
				Vis.P11.Status1[12] := SHOW ;
			END_IF
			IF(Track115.Active) AND(Tracking11.Blocked) THEN
				Vis.P11.Layers.Layer9 := SHOW ;
			END_IF
			IF(Track114.Active) AND(Ax2.Block) THEN
				Vis.P11.Layers.Layer10 := SHOW ;
			END_IF
		8:
			Vis.P11.Status[8] := SHOW ;
			IF(Reset.Count) THEN
				Reset.Grind := TRUE ;
                Reset.Time := TRUE ;
            ELSE
                Reset.Grind := FALSE ;
                Reset.Time := FALSE ;
            END_IF
		9:
			Vis.P11.Status[9]	:=	SHOW	;
			IF((Track501.Active) OR(Track601.Active)) AND NOT((Tracking00.Busy) OR(Tracking10.Busy) OR(Tracking11.Busy) OR(Tracking20.Busy) OR(Tracking40.Busy) OR(Tracking30.Busy) OR(Tracking41.Busy) OR(Tracking70.Busy)) THEN //CHANGE TRACKING REGISTER AS REQUIRED
				Vis.P11.Status1[17]	:=	SHOW	;
			END_IF
		10:
			Vis.P11.Status[10]	:=	SHOW	;
		20:
			Vis.P11.Status[20]	:=	SHOW	;
			Vis.Start.Enable	:=	HIDE	;
		21:
			Vis.P11.Status[21]	:=	SHOW	;
		22:
			Vis.P11.Status[22]	:=	SHOW	;	
	END_CASE
	
	IF NOT(Control.Achieved1) THEN
		Vis.P11.Status[16] :=	SHOW	;
	END_IF
	IF NOT(Control.Achieved2) THEN
		Vis.P11.Status[17] :=	SHOW	;
	END_IF
	IF NOT(WashRun.In) THEN
		Vis.P11.Status[18] :=	SHOW	;
	END_IF
	IF NOT(FurnReady.Int) THEN
		Vis.P11.Status[19] :=	SHOW	;
	END_IF
	IF NOT(AGVReady.In)THEN
		Vis.P11.Status[23] :=	SHOW	;
	END_IF
	IF(S57Lever.Int) THEN
		Vis.P11.Status[15] := SHOW ;
	END_IF 
	IF(S58Lever.Int) THEN
		Vis.P11.Status[14] := SHOW ;
	END_IF 
		
	
	//INFORMATION DISPLAY CONTROL
	IF Grind1.TotalMUpp > 0 THEN
		GrindDisp1.TotalDisp	:= 	SHOW	;
	ELSE
		GrindDisp1.TotalDisp	:= 	HIDE	;
	END_IF
	
	IF Grind2.TotalMUpp > 0 THEN
		GrindDisp2.TotalDisp	:= 	SHOW	;
	ELSE
		GrindDisp2.TotalDisp	:= 	HIDE	;
	END_IF
			
	IF Grind1.ShiftMUpp > 0 THEN
		GrindDisp1.ShiftDisp	:= 	SHOW	;
	ELSE
		GrindDisp1.ShiftDisp	:= 	HIDE	;
	END_IF
			
	IF Grind2.ShiftMUpp > 0 THEN
		GrindDisp2.ShiftDisp	:= 	SHOW	;
	ELSE
		GrindDisp2.ShiftDisp	:= 	HIDE	;
	END_IF	

	//SENSOR BLOCK DISP
	S1Photo.BlockDisp := HIDE ;
	S2Photo.BlockDisp := HIDE ;
	S3Photo.BlockDisp := HIDE ;
	S4Photo.BlockDisp := HIDE ;
	S5Photo.BlockDisp := HIDE ;
	S6Photo.BlockDisp := HIDE ;
	S7Photo.BlockDisp := HIDE ;
	S8Photo.BlockDisp := HIDE ;
	S9Photo.BlockDisp := HIDE ;
	S12Photo.BlockDisp := HIDE ;
	S13Photo.BlockDisp := HIDE ;
	S14Photo.BlockDisp := HIDE ;
	S15Photo.BlockDisp := HIDE ;
	S16Photo.BlockDisp := HIDE ;
	S17Photo.BlockDisp := HIDE ;
	S18Photo.BlockDisp := HIDE ;
	S19Photo.BlockDisp := HIDE ;
	S20Photo.BlockDisp := HIDE ;
	S21Photo.BlockDisp := HIDE ;
	S50Reed.BlockDisp := HIDE ;
	IF(Tracking00.Blocks[9]) AND(Track005.Active) AND NOT(Tracking00.BlockInhib) THEN	
		S3Photo.BlockDisp := SHOW ;
		Tracking00.Blocks[9] := FALSE ;
	END_IF	
	IF(Tracking00.Blocks[10]) AND(Track005.Active) AND NOT(Tracking00.BlockInhib) THEN	
		S4Photo.BlockDisp := SHOW ;
		Tracking00.Blocks[10] := FALSE ;
	END_IF	
	IF(Tracking00.Blocks[12]) AND(Track005.Active) AND NOT(Tracking00.BlockInhib) THEN	
		S50Reed.BlockDisp := SHOW ;
		Tracking00.Blocks[12] := FALSE ;
	END_IF	
	IF(Tracking10.Blocks[9]) AND(Track108.Active) AND NOT(Tracking11.Busy) THEN	
		S5Photo.BlockDisp := SHOW ;
		Tracking10.Blocks[9] := FALSE ;
	END_IF	
	IF(Tracking10.Blocks[10]) AND(Track108.Active) AND NOT(Tracking11.Busy) THEN	
		S6Photo.BlockDisp := SHOW ;
		Tracking10.Blocks[10] := FALSE ;
	END_IF	
	IF(Tracking10.Blocks[11]) AND(Track108.Active) AND NOT(Tracking11.Busy) THEN	
		S7Photo.BlockDisp := SHOW ;
		Tracking10.Blocks[11] := FALSE ;
	END_IF	
	IF(Tracking11.Blocks[9]) AND(Track115.Active) AND NOT(Tracking11.BlockInhib) THEN	
		S8Photo.BlockDisp := SHOW ;
		Tracking11.Blocks[9] := FALSE ;
	END_IF	
	IF(Tracking11.Blocks[10]) AND(Track115.Active) AND NOT(Tracking11.BlockInhib) THEN	
		S12Photo.BlockDisp := SHOW ;
		Tracking11.Blocks[10] := FALSE ;
	END_IF	
	IF(Tracking20.Blocks[9]) AND(Track208.Active) AND NOT(Track302.Active) THEN	
		S14Photo.BlockDisp := SHOW ;
		Tracking20.Blocks[9] := FALSE ;
	END_IF	
	IF(Tracking20.Blocks[10]) AND(Track208.Active) AND NOT(Track302.Active) THEN	
		S15Photo.BlockDisp := SHOW ;
		Tracking20.Blocks[10] := FALSE ;
	END_IF	
	IF(Tracking30.Blocks[9]) AND(Track302.Active) AND NOT(Track402.Active) THEN	
		S16Photo.BlockDisp := SHOW ;
		Tracking30.Blocks[9] := FALSE ;
	END_IF	
	IF(Tracking30.Blocks[10]) AND(Track302.Active) THEN	
		S17Photo.BlockDisp := SHOW ;
		Tracking30.Blocks[10] := FALSE ;
	END_IF	
	IF(Tracking40.Blocks[9]) AND(Track402.Active) THEN	
		S17Photo.BlockDisp := SHOW ;
		Tracking40.Blocks[9] := FALSE ;
	END_IF	
	IF(Tracking40.Blocks[10]) AND(Track402.Active) THEN	
		S18Photo.BlockDisp := SHOW ;
		Tracking40.Blocks[10] := FALSE ;
	END_IF	
	IF(Tracking50.Blocks[9]) AND(Track503.Active) THEN	
		S19Photo.BlockDisp := SHOW ;
		Tracking50.Blocks[9] := FALSE ;
	END_IF	
	IF(Tracking50.Blocks[10]) AND(Track503.Active) THEN	
		S20Photo.BlockDisp := SHOW ;
		Tracking50.Blocks[10] := FALSE ;
	END_IF	
	IF(Tracking50.Blocks[11]) AND(Track503.Active) AND NOT(Track603.Active) THEN	
		S21Photo.BlockDisp := SHOW ;
		Tracking50.Blocks[11] := FALSE ;
	END_IF	
	IF(Tracking80.Blocks[9]) AND(Track803.Active) THEN	
		S19Photo.BlockDisp := SHOW ;
		Tracking80.Blocks[9] := FALSE ;
	END_IF	

END_PROGRAM

(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Status
 * File: Status.st
 * Author: NickE
 * Created: January 21, 2013
 ********************************************************************
 * Implementation of program Status
 ********************************************************************)

PROGRAM _CYCLIC

	//SEAMER CONTROL SYSTEM STATUS
	IF NOT(Control.Achieved1) THEN
		Vis.Status.StatusSeamer	:=	YELLOW		;
	END_IF
	
	IF(Control.Achieved1) THEN
		Vis.Status.StatusSeamer	:=	GREEN	;
	END_IF
	
	IF(Pause.Active) THEN
		Vis.Status.StatusSeamer	:=	Vis.Status.GrnLmp	;
	END_IF

	IF(Control.ESClear) THEN
		Vis.Status.StatusSeamer	:=	BLUE	;
	END_IF

	//OFFLINE CONTROL STATUS
	IF NOT(Control.Achieved2) THEN
		Vis.Status.StatusOffline	:=	YELLOW		;
	END_IF
	
	IF(Control.Achieved2) THEN
		Vis.Status.StatusOffline	:=	GREEN	;
	END_IF
	
	IF(Pause.Active) THEN
		Vis.Status.StatusOffline	:=	Vis.Status.GrnLmp	;
	END_IF

	//NUMBER OF ACTIVE WARNINGS
	Vis.Status.WarningCount		:=	0		;

	IF(Control.Warning) THEN
		Vis.Status.StatusSeamer	:=	ORANGE	;
		Vis.Status.WarningEnable	:=	SHOW	;
		FOR i:= 0 TO UINT_TO_INT(Warn.iMax) DO
			IF(Warn.Timeout[i]) THEN
				Vis.Status.WarningCount	:=	Vis.Status.WarningCount + 1	;
			END_IF
		END_FOR
	ELSE
		Vis.Status.WarningEnable	:=	HIDE	;
		Vis.Status.WarningCount		:=	0		;
	END_IF

	//NUMBER OF ACTIVE ALARMS
	Vis.Status.AlarmCount	:=	0		;

	IF(Control.Alarm) THEN
		Vis.Status.StatusSeamer	:=	RED		;
		Vis.Status.AlarmEnable	:=	SHOW	;
		FOR i := 0 TO 60 DO
			IF(SysTemp.Alarms[i]) THEN
				Vis.Status.AlarmCount	:=	Vis.Status.AlarmCount + 1	;
			END_IF
		END_FOR
	ELSE
		Vis.Status.AlarmEnable	:=	HIDE	;
		Vis.Status.AlarmCount	:=	0		;
	END_IF

	//SERVO STATUS
	IF NOT(Ax1.Error) AND NOT(Ax2.Error) AND NOT(Ax3.Error) THEN
		Vis.Status.StatusServo	:=	GREEN	;
	ELSE
		Vis.Status.StatusServo	:=	YELLOW	;
	END_IF
	IF(Ax1.Error) OR(Ax2.Error) OR(Ax3.Error) THEN  
		Vis.Status.StatusServo	:=	RED	;
	END_IF

	//LASER STATUS
	IF(S56Lever.In) THEN
		Vis.Status.StatusLaser	:=	GREEN	;
	ELSE
		Vis.Status.StatusLaser	:=	YELLOW	;
	END_IF
	
	//LIGHTSTACK COLOURS
	IF(Control.RedLmp) THEN
		Vis.Status.RedLmp	:=	RED		;
		Vis.Status.TextRed	:=	1		;
	ELSE
		Vis.Status.RedLmp	:=	GREY	;
		Vis.Status.TextRed	:=	0		;
	END_IF

	IF(Control.GrnLmp) THEN
		Vis.Status.GrnLmp	:=	GREEN	;
		Vis.Status.TextGrn	:=	1		;
		IF(Pause.Active) THEN
			Vis.Status.TextGrn	:=	2	;
		END_IF
	ELSE
		Vis.Status.GrnLmp	:=	GREY	;
		Vis.Status.TextGrn	:=	0		;
		IF(Pause.Active) THEN
			Vis.Status.TextGrn	:=	2	;
		END_IF
	END_IF

	IF(Control.YelLmp) THEN
		Vis.Status.YelLmp	:=	BLUE	;
		Vis.Status.TextYel	:=	1		;
	ELSE
		Vis.Status.YelLmp	:=	GREY	;
		Vis.Status.TextYel	:=	0		;
	END_IF

	//RESET DROP DOWN SCREENS WHEN STATUS DISPLAYED
	IF EDGEPOS(Vis.Status.Enable = SHOW) THEN
		Vis.Start.Enable	:=	HIDE	;
		Vis.IP.Enable		:=	HIDE	;
		Level.Enable	:=	HIDE	;
		Level.EnableSup	:=	HIDE	;
		Level.EnableEng	:=	HIDE	;
		Level.EnableTech	:=	HIDE	;
	END_IF

END_PROGRAM

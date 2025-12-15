(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: S_Status
 * File: S_Status.st
 * Author: nicke
 * Created: May 02, 2013
 ********************************************************************
 * Implementation of program S_Status
 ********************************************************************)

PROGRAM _CYCLIC

	//SEAMER CONTROL SYSTEM STATUS
	IF NOT(Control.Achieved1) THEN
		ServiceVis.Status.StatusSeamer	:=	YELLOW		;
	END_IF
	
	IF(Control.Achieved1) THEN
		ServiceVis.Status.StatusSeamer	:=	GREEN	;
	END_IF
	
	IF(Pause.Active) THEN
		ServiceVis.Status.StatusSeamer	:=	ServiceVis.Status.GrnLmp	;
	END_IF

	IF(Control.ESClear) THEN
		ServiceVis.Status.StatusSeamer	:=	BLUE	;
	END_IF

	//NUMBER OF ACTIVE WARNINGS
	ServiceVis.Status.WarningCount		:=	0		;

	IF(Control.Warning) THEN
		ServiceVis.Status.StatusSeamer	:=	ORANGE	;
		ServiceVis.Status.WarningEnable	:=	SHOW	;
		FOR i:= 0 TO USINT_TO_INT(Warn.iMax) DO
			IF(Warn.Timeout[i]) THEN
				ServiceVis.Status.WarningCount	:=	ServiceVis.Status.WarningCount + 1	;
			END_IF
		END_FOR
	ELSE
		ServiceVis.Status.WarningEnable	:=	HIDE	;
		ServiceVis.Status.WarningCount		:=	0		;
	END_IF

	//NUMBER OF ACTIVE ALARMS
	ServiceVis.Status.AlarmCount	:=	0		;

	IF(Control.Alarm) THEN
		ServiceVis.Status.StatusSeamer	:=	RED		;
		ServiceVis.Status.AlarmEnable	:=	SHOW	;
		FOR i := 0 TO 60 DO
			IF(SysTemp.Alarms[i]) THEN
				ServiceVis.Status.AlarmCount	:=	ServiceVis.Status.AlarmCount + 1	;
			END_IF
		END_FOR
	ELSE
		ServiceVis.Status.AlarmEnable	:=	HIDE	;
		ServiceVis.Status.AlarmCount	:=	0		;
	END_IF

	//SERVO STATUS
	IF NOT(Ax1.Error) AND NOT(Ax2.Error) AND NOT(Ax3.Error) THEN
		ServiceVis.Status.StatusServo	:=	GREEN	;
	ELSE
		ServiceVis.Status.StatusServo	:=	YELLOW	;
	END_IF
	IF(Ax1.Error) OR(Ax2.Error) OR(Ax3.Error) THEN  
		ServiceVis.Status.StatusServo	:=	RED	;
	END_IF

	//LASER STATUS
	IF(S56Lever.In) THEN
		ServiceVis.Status.StatusLaser	:=	GREEN	;
	ELSE
		ServiceVis.Status.StatusLaser	:=	YELLOW	;
	END_IF
	
	//LIGHTSTACK COLOURS
	IF(Control.RedLmp) THEN
		ServiceVis.Status.RedLmp	:=	RED		;
		ServiceVis.Status.TextRed	:=	1		;
	ELSE
		ServiceVis.Status.RedLmp	:=	GREY	;
		ServiceVis.Status.TextRed	:=	0		;
	END_IF

	IF(Control.GrnLmp) THEN
		ServiceVis.Status.GrnLmp	:=	GREEN	;
		ServiceVis.Status.TextGrn	:=	1		;
		IF(Pause.Active) THEN
			ServiceVis.Status.TextGrn	:=	2	;
		END_IF
	ELSE
		ServiceVis.Status.GrnLmp	:=	GREY	;
		ServiceVis.Status.TextGrn	:=	0		;
		IF(Pause.Active) THEN
			ServiceVis.Status.TextGrn	:=	2	;
		END_IF
	END_IF

	IF(Control.YelLmp) THEN
		ServiceVis.Status.YelLmp	:=	BLUE	;
		ServiceVis.Status.TextYel	:=	1		;
	ELSE
		ServiceVis.Status.YelLmp	:=	GREY	;
		ServiceVis.Status.TextYel	:=	0		;
	END_IF

	//RESET DROP DOWN SCREENS WHEN STATUS DISPLAYED
	IF EDGEPOS(ServiceVis.Status.Enable = SHOW) THEN
		ServiceVis.Start.Enable	:=	HIDE	;
		ServiceVis.IP.Enable		:=	HIDE	;
		ServiceLevel.Enable	:=	HIDE	;
		ServiceLevel.EnableSup	:=	HIDE	;
		ServiceLevel.EnableEng	:=	HIDE	;
		ServiceLevel.EnableTech	:=	HIDE	;
	END_IF

END_PROGRAM

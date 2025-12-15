(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: Level
 * File: Level.st
 * Author: NickE
 * Created: January 18, 2013
 ********************************************************************
 * Implementation of program Level
 ********************************************************************)

PROGRAM _INIT

	Vis.API.VC_HANDLE	:=	0	;
	
END_PROGRAM


PROGRAM _CYCLIC

	CASE Vis.Page.Current OF
		P00_INITIALIZE:
			//Init time - 3 sec
			Vis.Init.TimeoutEnable	:= TRUE					;
			Vis.Init.TON.IN			:= Vis.Init.TimeoutEnable	;
			Vis.Init.TON.PT			:= T#3000ms				;
			Vis.Init.TON ();
		
			Vis.Init.Progress	:=	UDINT_TO_USINT(TIME_TO_UDINT(Vis.Init.TON.ET) / 30);
			IF (Vis.Init.TON.Q) THEN
				//Switch to Menu Screen
				Vis.Page.New			:= 	P10_MENU	;
				Vis.Init.TimeoutEnable	:= 	FALSE		;
			END_IF
	END_CASE

	(*Hidden message control*)
	Vis.Message.Display	;
	Vis.Message.Text	;

	//GET TOUCH ACTION FROM SCREEN
	IF(Vis.API.READY <> 1) THEN
		Vis.API.VC_HANDLE := VA_Setup(1 , 'HMIXGA')	;
  
		IF(Vis.API.VC_HANDLE <> 0) THEN
			Vis.API.READY := 1	;
		END_IF
	END_IF

	IF(Vis.API.READY = 1) THEN
		IF(VA_Saccess(1,Vis.API.VC_HANDLE)= 0) THEN
			VA_GetTouchAction (1,Vis.API.VC_HANDLE,0,(ADR(Vis.API.TOUCH))) ;
			VA_Srelease(1,Vis.API.VC_HANDLE)	;
		END_IF
	END_IF
	
	IF(Vis.API.TOUCH.status = 1) THEN
		Level.ScreenTouch	:=	TRUE	;
	END_IF
	
	//PAGE CHANGE
	IF(Vis.Page.Current <> Vis.Page.Old) THEN
		Vis.Page.Changed	:=	TRUE	;
	ELSE
		Vis.Page.Changed	:=	FALSE	;
	END_IF
	Vis.Page.Old	:=	Vis.Page.Current;

	//HIDE DROP DOWN SCREENS
	IF(Vis.Page.Changed) THEN
		Vis.Start.Enable	:=	HIDE	;
		Vis.IP.Enable		:=	HIDE	;
		Vis.Status.Enable	:=	HIDE	;
		Level.Enable	:=	HIDE	;
		Level.EnableSup	:=	HIDE	;
		Level.EnableEng	:=	HIDE	;
//		Level.EnableTech	:=	HIDE	;
		IF NOT(Control.ESClear) THEN
			Vis.P11.EnableIndex		:=	24	;
		END_IF
		Vis.P12.EnableIndex		:=	24	;
	END_IF

	//HEADER BAR COLOUR DISPLAY
	CASE Vis.Page.Current OF
		P10_MENU:
			Vis.HeaderColour	:=	RED_MENU	;
		P11_MIMIC:
			Vis.HeaderColour	:=	GREY_MIMIC	;
		P12_OPTIONS:
			Vis.HeaderColour	:=	GREEN_OPTIONS	;
		P13_SETTINGS:
			Vis.HeaderColour	:=	BLUE	;
		P14_DRIVES:
			Vis.HeaderColour	:=	VIOLET	;
		P15_SERVOS:
			Vis.HeaderColour	:=	GREEN1	;
		P16_RIO:
			Vis.HeaderColour	:=	LIGHTBLUE	;
		P17_ALARM:
			Vis.HeaderColour	:=	RED	;
		P18_WARNING:
			Vis.HeaderColour	:=	ORANGE	;
		P19_EVENT:
			Vis.HeaderColour	:=	YELLOW_EVENT	;
		P20_ASHTON_TECH:
			Vis.HeaderColour	:=	GREY_ASHTON	;
		P21_SDM:
			Vis.HeaderColour	:=	ORANGE_SDM	;
		P30_VARIABLES:
			Vis.HeaderColour	:=	LILAC	;
	END_CASE
		
	//RESET SYSTEM PASSWORD
	IF NOT(SysPerm.PasswordDefault) THEN	
		SysPerm.Password[0]		:= 	''		;
		SysPerm.Password[1]		:= 	'1'		;
		SysPerm.Password[2]		:= 	'5'		;
		SysPerm.Password[3]		:= 	'4046'	;
		SysPerm.PasswordDefault	:= 	TRUE	;
		Level.Delay.IN			:=	TRUE	;
		Level.Enable			:=	HIDE	;
		Level.ResetEnable		:=	SHOW	;
	END_IF

	//ENABLE SUPERVISOR LEVEL FOR TESTING
	Level.Level	:=	LIMIT(0,Level.Level,3)	;

	//Password control. Use level to enable different layers on screen rather than seperate screens.
	CASE Level.Level OF
		OPERATOR:	
			Level.SupResetStart			:=	FALSE	;
			Level.EngResetStart			:=	FALSE	;
			Level.TechResetStart		:=	FALSE	;
			Level.EnableSup				:=	HIDE	;
			Level.EnableEng				:=	HIDE	;
			Level.EnableTech			:=	HIDE	;
			Level.GTOperatorEnable		:=	HIDE	;
			Level.GTSupervisorEnable	:=	HIDE	;
			Level.GTEngineerEnable		:=	HIDE	;
			Level.TestMode				:=	HIDE	;
			Control.Test				:=	FALSE	;
			Level.TestModeEnable		:=	HIDE	;
			MeterageReset1.Runtime := FB_HIDE;
			MeterageReset2.Runtime := FB_HIDE;
		SUPERVISOR:
			Level.SupResetStart			:=	TRUE	;
			Level.EnableSup				:=	Level.Enable	;
			Level.EnableEng				:=	HIDE	;
			Level.EnableTech			:=	HIDE	;
			Level.GTOperatorEnable		:=	SHOW	;
			Level.GTSupervisorEnable	:=	HIDE	;
			Level.GTEngineerEnable		:=	HIDE	;
			Level.TestMode				:=	HIDE	;
			Control.Test				:=	FALSE	;
			Level.TestModeEnable		:=	HIDE	;
			MeterageReset1.Runtime := FB_HIDE;
			MeterageReset2.Runtime := FB_HIDE;
			IF (Meterage1 = FB_SHOW) THEN
				MeterageReset1.Runtime := FB_SHOW;
			END_IF
			IF (Meterage2 = FB_SHOW) THEN
				MeterageReset2.Runtime := FB_SHOW;
			END_IF
		ENGINEER:
			Level.EngResetStart			:=	TRUE	;
			Level.EnableSup				:=	HIDE	;
			Level.EnableEng				:=	Level.Enable	;
			Level.EnableTech			:=	HIDE	;
			Level.GTOperatorEnable		:=	SHOW	;
			Level.GTSupervisorEnable	:=	SHOW	;
			Level.GTEngineerEnable		:=	HIDE	;
			Level.TestMode				:=	HIDE	;
			Level.TestModeEnable		:=	HIDE	;
			IF(Control.Empty) AND(Control.Achieved1) THEN
				Level.TestMode	:=	SHOW	;
			END_IF
			IF(Control.Test)THEN
				Level.TestModeEnable	:=	SHOW	;
				Level.TestMode	:=	SHOW	;
			END_IF	
			MeterageReset1.Runtime := FB_SHOW;
			MeterageReset2.Runtime := FB_SHOW;
		ASHTON_TECH:
			Level.TechResetStart		:=	TRUE	;
			
			Level.EnableSup				:=	HIDE	;
			Level.EnableEng				:=	HIDE	;
			Level.EnableTech			:=	Level.Enable	;
			Level.GTOperatorEnable		:=	SHOW	;
			Level.GTSupervisorEnable	:=	SHOW	;
			Level.GTEngineerEnable		:=	SHOW	;
			Level.TestMode				:=	HIDE	;
			Level.TestModeEnable		:=	HIDE	;
			IF(Control.Empty) AND(Control.Achieved1) THEN
				Level.TestMode	:=	SHOW	;
			END_IF
			IF(Control.Test)THEN
				Level.TestModeEnable	:=	SHOW	;
				Level.TestMode	:=	SHOW	;
			END_IF	
			MeterageReset1.Runtime := FB_SHOW;
			MeterageReset2.Runtime := FB_SHOW;
	END_CASE

	//Local Events List
	SysTemp.Events[95]	:=	Level.SupResetStart	;
	SysTemp.Events[96]	:=	Level.EngResetStart	;
	SysTemp.Events[97]	:=	Level.TechResetStart	;

	//RESET DROP DOWN SCREENS WHEN PASSWORD DISPLAYED
	IF EDGEPOS(Level.Enable = SHOW) THEN
		Vis.Start.Enable	:=	HIDE	;
		Vis.IP.Enable		:=	HIDE	;
		Vis.Status.Enable	:=	HIDE	;
	END_IF

	//ScreenTouch control for cancel password delay.
	Level.SupDelay.IN	:=	(Level.SupResetStart) AND NOT(Level.ScreenTouch)	;
	Level.SupDelay.PT	:=	t#2m	;
	Level.SupDelay();
	
	IF EDGEPOS(Level.SupDelay.Q) THEN
		Level.Level	:=	0	;
	END_IF

	Level.EngDelay.IN	:=	(Level.EngResetStart) AND NOT(Level.ScreenTouch) AND NOT(Level.BlockEng)	;
	Level.EngDelay.PT	:=	t#2m	;
	Level.EngDelay();
	
	IF EDGEPOS(Level.EngDelay.Q) THEN
		Level.Level	:=	0	;
	END_IF
	
	Level.TechDelay.IN	:=	(Level.TechResetStart) AND NOT(Level.ScreenTouch) AND NOT(Level.BlockTech)	;
	Level.TechDelay.PT	:=	t#2m	;
	Level.TechDelay();
	
	IF EDGEPOS(Level.TechDelay.Q) THEN
		Level.Level	:=	0	;
	END_IF
	
	Level.ScreenTouch	:=	FALSE	;

	IF(Control.Test) THEN
		Level.BlockEng	:=	TRUE	;
		Level.BlockTech	:=	TRUE	;
	ELSE
		Level.BlockEng	:=	FALSE	;
		Level.BlockTech	:=	FALSE	;
	END_IF
		
	IF(Vis.Page.Current >= P20_ASHTON_TECH) THEN
		Level.BlockTech	:=	TRUE	;
	ELSE
		Level.BlockTech	:=	FALSE	;
	END_IF
	
	IF(Control.Achieved1) AND(Control.Empty) THEN
		Level.EngRefused	:=	HIDE	;
	END_IF

	IF(Level.RefusedConfirm) THEN
		Level.EngRefused	:=	HIDE	;
		Level.Enable		:=	HIDE	;
	END_IF

	(*Change Password*)
	IF (Level.SupConfirm) THEN
		SysPerm.Password[1]	:= 	Level.SupNew	;
		Level.Delay.IN	:=	TRUE			;
		Level.SupEnable	:=	SHOW			;
	END_IF

	IF (Level.EngConfirm) THEN
		SysPerm.Password[2]	:= 	Level.EngNew	;
		Level.Delay.IN	:=	TRUE			;
		Level.EngEnable	:=	SHOW			;
	END_IF

	Level.Delay.PT	:=	T#2000ms	;
	Level.Delay ();
	
	IF(Level.Delay.Q) THEN
		Level.SupConfirm	:= 	FALSE	;
		Level.EngConfirm	:= 	FALSE	;
		Level.SupNew		:= 	''		;
		Level.EngNew		:= 	''		;
		Level.SupEnable		:=	HIDE	;
		Level.EngEnable		:=	HIDE	;
		Level.ResetEnable	:=	HIDE	;
		Level.Enable		:= 	HIDE	;
		Level.Delay.IN		:=	FALSE	;
	END_IF

	IF (Level.Entered) THEN
		Level.Enable	:= 	HIDE	;
		Level.Entered	:= 	FALSE	;
	END_IF

END_PROGRAM

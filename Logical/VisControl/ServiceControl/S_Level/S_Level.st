(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * PROGRAM: S_Level
 * File: S_ServiceLevel.st
 * Author: nicke
 * Created: May 01, 2013
 ********************************************************************
 * Implementation OF PROGRAM S_Level
 ********************************************************************)

PROGRAM _INIT

	ServiceVis.API.VC_HANDLE	:=	0	;

END_PROGRAM


PROGRAM _CYCLIC

	CASE ServiceVis.Page.Current OF
		P00_INITIALIZE:
			//Init time - 3 sec
			ServiceVis.Init.TimeoutEnable	:= TRUE					;
			ServiceVis.Init.TON.IN			:= ServiceVis.Init.TimeoutEnable	;
			ServiceVis.Init.TON.PT			:= T#3000ms				;
			ServiceVis.Init.TON ();
		
			ServiceVis.Init.Progress	:=	UDINT_TO_USINT(TIME_TO_UDINT(ServiceVis.Init.TON.ET) / 30);
			IF (ServiceVis.Init.TON.Q) THEN
				//Switch to Menu Screen
				ServiceVis.Page.New			:= 	P10_MENU	;
				ServiceVis.Init.TimeoutEnable	:= 	FALSE		;
			END_IF
	END_CASE

	(*Hidden message control*)
	ServiceVis.Message.Display	;
	ServiceVis.Message.Text	;

	//GET TOUCH ACTION FROM SCREEN
	IF(ServiceVis.API.READY <> 1) THEN
		ServiceVis.API.VC_HANDLE := VA_Setup(1 , 'Servic')	;
  
		IF(ServiceVis.API.VC_HANDLE <> 0) THEN
			ServiceVis.API.READY := 1	;
		END_IF
	END_IF

	IF(ServiceVis.API.READY = 1) THEN
		IF(VA_Saccess(1,ServiceVis.API.VC_HANDLE)= 0) THEN
			VA_GetTouchAction (1,ServiceVis.API.VC_HANDLE,0,(ADR(ServiceVis.API.TOUCH))) ;
			VA_Srelease(1,ServiceVis.API.VC_HANDLE)	;
		END_IF
	END_IF
	
	IF(ServiceVis.API.TOUCH.status = 1) THEN
		ServiceLevel.ScreenTouch	:=	TRUE	;
	END_IF
	
	//PAGE CHANGE
	IF(ServiceVis.Page.Current <> ServiceVis.Page.Old) THEN
		ServiceVis.Page.Changed	:=	TRUE	;
	ELSE
		ServiceVis.Page.Changed	:=	FALSE	;
	END_IF
	ServiceVis.Page.Old	:=	ServiceVis.Page.Current;

	//HIDE DROP DOWN SCREENS
	IF(ServiceVis.Page.Changed) THEN
		ServiceVis.Start.Enable	:=	HIDE	;
		ServiceVis.IP.Enable		:=	HIDE	;
		ServiceVis.Status.Enable	:=	HIDE	;
		ServiceLevel.Enable	:=	HIDE	;
		ServiceLevel.EnableSup	:=	HIDE	;
		ServiceLevel.EnableEng	:=	HIDE	;
		ServiceLevel.EnableTech	:=	HIDE	;
		IF NOT(Control.ESClear) THEN
			ServiceVis.P11.EnableIndex		:=	24	;
		END_IF
		ServiceVis.P12.EnableIndex		:=	24	;
	END_IF

	//HEADER BAR COLOUR DISPLAY
	CASE ServiceVis.Page.Current OF
		P10_MENU:
			ServiceVis.HeaderColour	:=	RED_MENU	;
		P11_MIMIC:
			ServiceVis.HeaderColour	:=	GREY_MIMIC	;
		P12_OPTIONS:
			ServiceVis.HeaderColour	:=	GREEN_OPTIONS	;
		P13_SETTINGS:
			ServiceVis.HeaderColour	:=	BLUE	;
		P14_DRIVES:
			ServiceVis.HeaderColour	:=	VIOLET	;
		P15_SERVOS:
			ServiceVis.HeaderColour	:=	GREEN1	;
		P16_RIO:
			ServiceVis.HeaderColour	:=	LIGHTBLUE	;
		P17_ALARM:
			ServiceVis.HeaderColour	:=	RED	;
		P18_WARNING:
			ServiceVis.HeaderColour	:=	ORANGE	;
		P19_EVENT:
			ServiceVis.HeaderColour	:=	YELLOW_EVENT	;
		P20_ASHTON_TECH:
			ServiceVis.HeaderColour	:=	GREY_ASHTON	;
		P21_SDM:
			ServiceVis.HeaderColour	:=	ORANGE_SDM	;
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
		ServiceLevel.Delay.IN			:=	TRUE	;
		ServiceLevel.Enable			:=	HIDE	;
		ServiceLevel.ResetEnable		:=	SHOW	;
	END_IF

	//ENABLE SUPERVISOR LEVEL FOR TESTING
	ServiceLevel.Level	:=	LIMIT(3,ServiceLevel.Level,3)	;

	//	//Password control. Use level to enable different layers on screen rather than seperate screens.
	CASE ServiceLevel.Level OF
		//		OPERATOR:	
		//			ServiceLevel.SupResetStart			:=	FALSE	;
		//			ServiceLevel.EngResetStart			:=	FALSE	;
		//			ServiceLevel.TechResetStart		:=	FALSE	;
		//			ServiceLevel.EnableSup				:=	HIDE	;
		//			ServiceLevel.EnableEng				:=	HIDE	;
		//			ServiceLevel.EnableTech			:=	HIDE	;
		//			ServiceLevel.GTOperatorEnable		:=	HIDE	;
		//			ServiceLevel.GTSupervisorEnable	:=	HIDE	;
		//			ServiceLevel.GTEngineerEnable		:=	HIDE	;
		//			ServiceLevel.TestMode				:=	HIDE	;
		//			Control.Test				:=	FALSE	;
		//			ServiceLevel.TestModeEnable		:=	HIDE	;
		//		SUPERVISOR:
		//			ServiceLevel.SupResetStart			:=	TRUE	;
		//			ServiceLevel.EnableSup				:=	ServiceLevel.Enable	;
		//			ServiceLevel.EnableEng				:=	HIDE	;
		//			ServiceLevel.EnableTech			:=	HIDE	;
		//			ServiceLevel.GTOperatorEnable		:=	SHOW	;
		//			ServiceLevel.GTSupervisorEnable	:=	HIDE	;
		//			ServiceLevel.GTEngineerEnable		:=	HIDE	;
		//			ServiceLevel.TestMode				:=	HIDE	;
		//			Control.Test				:=	FALSE	;
		//			ServiceLevel.TestModeEnable		:=	HIDE	;
		//		ENGINEER:
		//			ServiceLevel.EngResetStart			:=	TRUE	;
		//			ServiceLevel.EnableSup				:=	HIDE	;
		//			ServiceLevel.EnableEng				:=	ServiceLevel.Enable	;
		//			ServiceLevel.EnableTech			:=	HIDE	;
		//			ServiceLevel.GTOperatorEnable		:=	SHOW	;
		//			ServiceLevel.GTSupervisorEnable	:=	SHOW	;
		//			ServiceLevel.GTEngineerEnable		:=	HIDE	;
		//			ServiceLevel.TestMode				:=	HIDE	;
		//			ServiceLevel.TestModeEnable		:=	HIDE	;
		//			IF(Control.Empty) AND(Control.Achieved) THEN
		//				ServiceLevel.TestMode	:=	SHOW	;
		//			END_IF
		//			IF(Control.Test)THEN
		//				ServiceLevel.TestModeEnable	:=	SHOW	;
		//				ServiceLevel.TestMode	:=	SHOW	;
		//			END_IF	
		ASHTON_TECH:
			ServiceLevel.TechResetStart		:=	TRUE	;
			ServiceLevel.EnableSup				:=	HIDE	;
			ServiceLevel.EnableEng				:=	HIDE	;
			ServiceLevel.EnableTech			:=	ServiceLevel.Enable	;
			ServiceLevel.GTOperatorEnable		:=	SHOW	;
			ServiceLevel.GTSupervisorEnable	:=	SHOW	;
			ServiceLevel.GTEngineerEnable		:=	SHOW	;
			ServiceLevel.TestMode				:=	HIDE	;
			ServiceLevel.TestModeEnable		:=	HIDE	;
			IF(Control.Empty) AND(Control.Achieved1) THEN
				ServiceLevel.TestMode	:=	SHOW	;
			END_IF
			IF(Control.Test)THEN
				ServiceLevel.TestModeEnable	:=	SHOW	;
				ServiceLevel.TestMode	:=	SHOW	;
			END_IF	
	END_CASE

	//RESET DROP DOWN SCREENS WHEN PASSWORD DISPLAYED
	IF EDGEPOS(ServiceLevel.Enable = SHOW) THEN
		ServiceVis.Start.Enable	:=	HIDE	;
		ServiceVis.IP.Enable		:=	HIDE	;
		ServiceVis.Status.Enable	:=	HIDE	;
	END_IF

	//	//ScreenTouch control for cancel password delay.
	//	ServiceLevel.SupDelay.IN	:=	(ServiceLevel.SupResetStart) AND NOT(ServiceLevel.ScreenTouch)	;
	//	ServiceLevel.SupDelay.PT	:=	t#2m	;
	//	ServiceLevel.SupDelay();
	//	
	//	IF EDGEPOS(ServiceLevel.SupDelay.Q) THEN
	//		ServiceLevel.Level	:=	0	;
	//	END_IF
	//
	//	ServiceLevel.EngDelay.IN	:=	(ServiceLevel.EngResetStart) AND NOT(ServiceLevel.ScreenTouch) AND NOT(ServiceLevel.BlockEng)	;
	//	ServiceLevel.EngDelay.PT	:=	t#2m	;
	//	ServiceLevel.EngDelay();
	//	
	//	IF EDGEPOS(ServiceLevel.EngDelay.Q) THEN
	//		ServiceLevel.Level	:=	0	;
	//	END_IF
	//	
	//	ServiceLevel.TechDelay.IN	:=	(ServiceLevel.TechResetStart) AND NOT(ServiceLevel.ScreenTouch) AND NOT(ServiceLevel.BlockTech)	;
	//	ServiceLevel.TechDelay.PT	:=	t#2m	;
	//	ServiceLevel.TechDelay();
	//	
	//	IF EDGEPOS(ServiceLevel.TechDelay.Q) THEN
	//		ServiceLevel.Level	:=	0	;
	//	END_IF
	//	
	ServiceLevel.ScreenTouch	:=	FALSE	;
	//
	//	IF(Control.Test) THEN
	//		ServiceLevel.BlockEng	:=	TRUE	;
	//		ServiceLevel.BlockTech	:=	TRUE	;
	//	ELSE
	//		ServiceLevel.BlockEng	:=	FALSE	;
	//		ServiceLevel.BlockTech	:=	FALSE	;
	//	END_IF
	//		
	//	IF(ServiceVis.Page.Current = P20_ASHTON_TECH) OR(ServiceVis.Page.Current = P21_SDM) THEN
	//		ServiceLevel.BlockTech	:=	TRUE	;
	//	ELSE
	//		ServiceLevel.BlockTech	:=	FALSE	;
	//	END_IF
	//	
	//	IF(Control.Achieved) AND(Control.Empty) THEN
	//		ServiceLevel.EngRefused	:=	HIDE	;
	//	END_IF
	//
	//	IF(ServiceLevel.RefusedConfirm) THEN
	//		ServiceLevel.EngRefused	:=	HIDE	;
	//		ServiceLevel.Enable		:=	HIDE	;
	//	END_IF
	//
	//	(*Change Password*)
	//	IF (ServiceLevel.SupConfirm) THEN
	//		SysPerm.Password[1]	:= 	ServiceLevel.SupNew	;
	//		ServiceLevel.Delay.IN	:=	TRUE			;
	//		ServiceLevel.SupEnable	:=	SHOW			;
	//	END_IF
	//
	//	IF (ServiceLevel.EngConfirm) THEN
	//		SysPerm.Password[2]	:= 	ServiceLevel.EngNew	;
	//		ServiceLevel.Delay.IN	:=	TRUE			;
	//		ServiceLevel.EngEnable	:=	SHOW			;
	//	END_IF
	//
	//	ServiceLevel.Delay.PT	:=	T#2000ms	;
	//	ServiceLevel.Delay ();
	//	
	//	IF(ServiceLevel.Delay.Q) THEN
	//		ServiceLevel.SupConfirm	:= 	FALSE	;
	//		ServiceLevel.EngConfirm	:= 	FALSE	;
	//		ServiceLevel.SupNew		:= 	''		;
	//		ServiceLevel.EngNew		:= 	''		;
	//		ServiceLevel.SupEnable		:=	HIDE	;
	//		ServiceLevel.EngEnable		:=	HIDE	;
	//		ServiceLevel.ResetEnable	:=	HIDE	;
	//		ServiceLevel.Enable		:= 	HIDE	;
	//		ServiceLevel.Delay.IN		:=	FALSE	;
	//	END_IF
	//
	//	IF (ServiceLevel.Entered) THEN
	//		ServiceLevel.Enable	:= 	HIDE	;
	//		ServiceLevel.Entered	:= 	FALSE	;
	//	END_IF

END_PROGRAM

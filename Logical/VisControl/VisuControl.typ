(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: VisuControl
 * File: VisuControl.typ
 * Author: nicke
 * Created: January 17, 2013
 ********************************************************************
 * Local data types of program VisuControl
 ********************************************************************)

TYPE
	CalcFreq_typ : 	STRUCT 
		CurrentFreq : REAL; (*Current frequency*)
		NewFreq : REAL; (*New frequency*)
		NewSpeed : REAL; (*New speed*)
		CurrentSpeed : REAL; (*Current speed*)
		Disp : Status_enum := HIDE; (*Visu control*)
	END_STRUCT;
	CalcBelt_typ : 	STRUCT 
		Unground : REAL; (*Unground size*)
		Current : REAL; (*Current preset*)
		New : REAL; (*New preset*)
		Adjust : REAL; (*Adjust delay by*)
		Disp : Status_enum := HIDE; (*Visu control*)
		Delay : BOOL; (*0 = OFF, 0 = ON*)
	END_STRUCT;
	INIT_typ : 	STRUCT 
		TimeoutEnable : BOOL; (*Start initialisation delay*)
		TON : TON; (*Initialisation delay*)
		Progress : USINT; (*Progress bar value*)
	END_STRUCT;
	IP_typ : 	STRUCT 
		Enable : Status_enum := HIDE; (*Enable IP Change*)
		ButtonEnable : Status_enum := HIDE; (*Enable button for IP Change*)
	END_STRUCT;
	Start_0_typ : 	STRUCT 
		ResetEnable : Status_enum := HIDE; (*Show Inverter Reset Button*)
		Enable : Status_enum := HIDE; (*Show start information*)
		StatusSeam1 : Colour_enum := GREY; (*Seamer 1 Status Colour*)
		StatusSeam2 : Colour_enum := GREY; (*Seamer2 Status Colour*)
		StatusED : Colour_enum := GREY; (*Edge Deletion Status Colour*)
		TestEnable : Status_enum := HIDE; (*Show Test Buttons*)
	END_STRUCT;
	STATEREADY_enum : 
		(
		WAIT := 0, (*Waiting for ready.*)
		READY_CONTROL := 1, (*Control circuit ready*)
		READY_SERVOS := 2, (*Servo systems ready*)
		READY_SEAMERS := 3, (*Grinding motors ready*)
		READY_CONTROL_SERVOS := 4, (*Control and Servos ready*)
		READY_CONTROL_SEAMERS := 5, (*Control and Grinding ready*)
		READY_ALL := 10 (*All systems ready.*)
		);
	Colour_enum : 
		(
		BLACK := 0, (*Colour Black*)
		GREY := 7, (*Colour Grey*)
		WHITE := 15, (*Colour White*)
		RED := 45, (*Colour Red*)
		YELLOW := 46, (*Colour Yellow*)
		YELLOW_EVENT := 47, (*Event Yellow*)
		ORANGE_SDM := 49, (*SDM Orange*)
		RED_MENU := 87, (*Menu Red*)
		LILAC := 90, (*Lilac*)
		VIOLET_ACTIVE := 97, (*Selected Violet*)
		VIOLET := 98, (*Colour Violet*)
		GREEN_DARK := 180, (*Colour Dark Green*)
		GREEN := 184, (*Colour Green*)
		GREEN_OPTIONS := 185, (*Options Green*)
		GREEN1_ACTIVE := 191, (*Selected Green - Servo*)
		GREEN1 := 192, (*Colour Green - Servo*)
		LIGHTBLUE_ACTIVE := 196, (*Selected Light Blue*)
		LIGHTBLUE := 197, (*Colour Light Blue*)
		BLUE_ACTIVE := 4039, (*Selected Blue (199) with white (15) foreground*)
		BLUE := 4040, (*Colour Blue (200) with white(15) foreground*)
		GREY_ASHTON := 251, (*Ashton Grey*)
		ORANGE := 253, (*Colour Orange*)
		GREY_MIMIC := 255, (*Mimic Grey*)
		FONT_BLUE := 256,
		FONT_GREEN := 512,
		FONT_DARK_RED := 1024,
		FONT_MAGENTA := 1280,
		FONT_LIGHT_GREY := 1792,
		FONT_DARK_GREY := 2048,
		FONT_LIGHT_BLUE := 2816,
		FONT_WHITE := 3840,
		DROP_UNSELECTED := 3847, (*Foreground White (15) Background Grey (7)*)
		FONT_ORANGE := 10752,
		FONT_RED := 11520,
		FONT_YELLOW := 11776
		);
	Status_typ : 	STRUCT 
		StatusSeamer : Colour_enum := RED; (*Seamer Status Colour*)
		StatusOffline : Colour_enum := RED; (*Offline Control Status Colour*)
		StatusServo : Colour_enum := RED; (*Imaging Status Colour*)
		StatusLaser : Colour_enum := RED; (*Robot Status Colour*)
		Enable : Status_enum := HIDE; (*Show status information*)
		TextYel : USINT := 0; (*Yellow Lamp text level*)
		TextGrn : USINT := 0; (*Green Lamp text level*)
		TextRed : USINT := 0; (*Red Lamp text level*)
		GrnLmp : Colour_enum := GREY; (*Green Lamp Colour*)
		YelLmp : Colour_enum := GREY; (*Yellow Lamp Colour (Shown as Blue)*)
		RedLmp : Colour_enum := GREY; (*Red Lamp Colour*)
		AlarmCount : USINT := 0; (*Alarm Count*)
		AlarmEnable : Status_enum := HIDE; (*Alarm display control*)
		WarningCount : USINT := 0; (*Warning Count*)
		WarningEnable : Status_enum := HIDE; (*Warning display control*)
	END_STRUCT;
	ESTOP_typ : 	STRUCT 
		Confirm : ARRAY[0..4]OF BOOL; (*Visu control*)
		Disp : ARRAY[0..4]OF Status_enum; (*Visu control*)
		Recovery : BOOL; (*During recovery sequence*)
	END_STRUCT;
	Message_typ : 	STRUCT 
		Text : STRING[75]; (*Message string to display. Controlled by NE*)
		Display : Status_enum := HIDE; (*Show or hide message.*)
	END_STRUCT;
	Visapi_typ : 	STRUCT 
		READY : UINT := 0; (*VISAPI library control*)
		VC_HANDLE : UDINT := 0; (*VISAPI library control*)
		TOUCH : TouchAction := (0); (*VISAPI library control*)
		Status : UINT; (*VISAPI library control*)
	END_STRUCT;
	Vis_typ : 	STRUCT 
		Page : PageControl_typ; (*Change sccreen control*)
		API : Visapi_typ; (*VISAPI library controls*)
		Init : INIT_typ; (*Screen Initialisation*)
		Message : Message_typ; (*NE Message display*)
		IP : IP_typ; (*IP screen control*)
		Start : Start_0_typ; (*Start screen control*)
		Status : Status_typ; (*Status screen control*)
		StepReady : STATEREADY_enum := WAIT; (*State Machine*)
		P10 : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P10 Menu visualisation controls*)
		P11 : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P11 Mimic visualisation controls*)
		P12 : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P12 Options visualisation controls*)
		P13 : LayersNew_typ := (Index:=1,EnableIndex:=0); (*P13 Settings visualisation controls*)
		P13Drives : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P13 Drives visualisation controls*)
		P13Delays : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P13 Delays visualisation controls*)
		P13Servos : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P13 Servos visualisation controls*)
		P13System : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P13 System  visualisation controls*)
		P13Timeouts : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P13 Timeouts visualisation controls*)
		P13Help1 : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P13 Help visualisation controls 1*)
		P13Help2 : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P13 Help visualisation controls 2*)
		P14Help : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P14 Drives Help visualisation controls*)
		P14 : LayersNew_typ := (Index:=1,EnableIndex:=0); (*P14 Drives visualisation controls*)
		P14Layer : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P14 Drives Layer visualisation controls*)
		P14Status : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P14 Drives Status visualisation controls*)
		P15 : LayersNew_typ := (Index:=1,EnableIndex:=0); (*P15 Servos visualisation controls*)
		P15Layer : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P15 Servos Layer visualisation controls*)
		P16 : LayersNew_typ := (Index:=1,EnableIndex:=0); (*P16 Remote visualisation controls*)
		P16Layer : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P16 Remote Layer visualisation controls*)
		P20 : LayersNew_typ := (Index:=1,EnableIndex:=0); (*P20 Ashton Tech visualisation controls*)
		P30 : LayersNew_typ := (Index:=1,EnableIndex:=0); (*P30 Variables visualisation controls*)
		EMO : ESTOP_typ; (*Estop recovery controls*)
		HideAll : ARRAY[0..23]OF Status_enum := [24(HIDE)]; (*Hide all before case statements*)
		HeaderColour : Colour_enum; (*Header Bar Colour*)
		ConDisp : ARRAY[0..24]OF USINT; (*Conveyor text level control*)
		CalcBelt : CalcBelt_typ; (*Belt timings calculator*)
		CalcFreq : CalcFreq_typ; (*Frequency calculator*)
		FlipDisp1 : VisFlip_typ; (*Runtime control for warning Displays*)
		FlipDisp2 : VisFlip_typ; (*Runtime control for warning Displays*)
	END_STRUCT;
	VisBatch_typ : 	STRUCT 
		Page : PageControl_typ; (*Change sccreen control*)
		API : Visapi_typ; (*VISAPI library controls*)
		P1 : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P1 Batch Display visualisation controls*)
		P2 : LayersNew_typ := (Index:=1,EnableIndex:=24); (*P2 Batch List visualisation controls*)
		HideAll : ARRAY[0..23]OF Status_enum := [24(HIDE)]; (*Hide all before case statements*)
		Param : VisapiParam_typ;
		State : ScaleBatch_enum;
		Control : ScaleStateControl_typ;
		Displayed : Displayed_typ;
	END_STRUCT;
	ScaleStateControl_typ : 	STRUCT 
		RowsIndex : USINT; (*Index for number of rows in batch*)
		RowIndex : USINT; (*Index for number of pieces in row*)
		RowWidthRaw : REAL; (*Extracted Row Width size - always extract from Loads.FurnaceExit.Rows[1].Row[0].Width - use to calculate y1 value for first piece in row*)
		WidthRaw : REAL; (*Extracted raw width of next piece*)
		LengthRaw : REAL; (*Extracted raw length of next piece*)
		WidthScaled : UINT; (*Scaled width of next piece*)
		LengthScaled : UINT; (*Scaled length of next piece*)
		WidthExtracted : BOOL; (*Set to TRUE when Width has been extracted from Loads.FurnaceExit.Rows[1].Row[0].Width*)
		X1Old : UINT; (*Last X1 value*)
		LongestOld : UINT; (*Scaled longest in previous row value*)
		LongestScaled : UINT; (*Scaled longest in row value*)
		GapLScaled : UINT; (*Scaled length gap*)
		GapWScaled : UINT; (*Scaled width gap*)
		RowWidthScaled : UINT; (*Scaled row width size*)
		Y1Old : UINT; (*Last Y1 value*)
		StrTemp : STRING[12]; (*Temporary register for text creation*)
		StrInt : INT; (*Temporary register for english text creation*)
		StrReal : REAL; (*Temporary register for english text creation*)
	END_STRUCT;
	Displayed_typ : 	STRUCT 
		Index : UINT;
		Data : ARRAY[0..200]OF DisplayBatch_typ;
		RefreshIndex : UINT;
	END_STRUCT;
	ScaleBatch_enum : 
		(
		RESET_WAIT := 0,
		CONFIRM_LOAD := 8,
		CONFIRM_CLEAR := 9,
		EXTRACT_VALUES := 10,
		CALCULATE_X1 := 11,
		CALCULATE_X2 := 12,
		CALCULATE_X3 := 13,
		CHECK_NEXT := 14,
		CALCULATE_Y1 := 15,
		CALCULATE_Y2 := 16,
		CALCULATE_Y3 := 17,
		REDRAW := 20,
		REFRESH := 21,
		REFRESH_RECTANGLE := 22,
		REFRESH_TEXTOUT1 := 23,
		REFRESH_TEXTOUT2 := 24,
		REFRESH_TEXTOUT3 := 25
		);
	ScaleBatch_typ : 	STRUCT 
		RefX1 : ARRAY[0..1]OF lcrCurveByPoints_TabEntry_type;
		ScaleX1 : LCRCurveByPoints;
		RefY1 : ARRAY[0..1]OF lcrCurveByPoints_TabEntry_type;
		ScaleY1 : LCRCurveByPoints;
		RefWidth : ARRAY[0..1]OF lcrCurveByPoints_TabEntry_type;
		ScaleWidth : LCRCurveByPoints;
		RefLength : ARRAY[0..1]OF lcrCurveByPoints_TabEntry_type;
		ScaleLength : LCRCurveByPoints;
		RefGapW : ARRAY[0..1]OF lcrCurveByPoints_TabEntry_type;
		ScaleGapW : LCRCurveByPoints;
		RefGapL : ARRAY[0..1]OF lcrCurveByPoints_TabEntry_type;
		ScaleGapL : LCRCurveByPoints;
	END_STRUCT;
	DisplayBatch_typ : 	STRUCT 
		x1 : UINT; (*Top left x co-ordinate*)
		y1 : UINT; (*Top left y co-ordinate*)
		width : UINT; (*Rect Width value*)
		height : UINT; (*Rect Height value*)
		str : STRING[19];
	END_STRUCT;
	VisapiParam_typ : 	STRUCT 
		font1 : UINT; (*Textout font index*)
		font2 : UINT; (*Textout font index*)
		x1 : UINT; (*Top left x co-ordinate*)
		x2 : UINT; (*Top left x co-ordinate, Str[0]*)
		x3 : UINT; (*Top left x co-ordinate, Str[2]*)
		y1 : UINT; (*Top left y co-ordinate*)
		y2 : UINT; (*Top left y co-ordinate, Str[0]*)
		y3 : UINT; (*Top left y co-ordinate, Str[2]*)
		width : UINT; (*Rect Width value*)
		height : UINT; (*Rect Height value*)
		fill : USINT; (*Rect fill color index*)
		color : USINT; (*Rect border color index*)
		fore1 : USINT; (*Textout foreground color index*)
		fore2 : USINT; (*Textout foreground color index*)
		back : USINT; (*Textout background color index*)
		str : STRING[19]; (*Textout text to be output*)
	END_STRUCT;
	PageControl_typ : 	STRUCT 
		Old : PAGE_enum; (*Visu control last scan page*)
		New : PAGE_enum; (*Visu control new page*)
		Current : PAGE_enum; (*Visu control current page*)
		Changed : BOOL; (*Page changed*)
	END_STRUCT;
	LayersNew_typ : 	STRUCT 
		Layers : LayerRef_typ; (*Layer control*)
		Status1 : ARRAY[0..23]OF Status_enum := [24(HIDE)]; (*Enable controls array*)
		Status : ARRAY[0..23]OF Status_enum := [24(HIDE)]; (*Enable controls array*)
		Colour : ARRAY[0..23]OF Colour_enum; (*Colour control*)
		Old : USINT; (*Old index value*)
		New : USINT; (*New index value*)
		Changed : BOOL; (*Layer changed*)
		IndexMax : USINT;
		IndexMin : USINT;
		Index : USINT; (*Layer index*)
		EnableIndex : USINT; (*Enable Controls Index*)
	END_STRUCT;
	LayerRef_typ : 	STRUCT 
		Button1 : VisuControl_enum;
		Button2 : VisuControl_enum;
		Button3 : VisuControl_enum;
		Button4 : VisuControl_enum;
		Button5 : VisuControl_enum;
		Button6 : VisuControl_enum;
		Button7 : VisuControl_enum;
		Button8 : VisuControl_enum;
		Button9 : VisuControl_enum;
		Help1 : Status_enum := HIDE;
		Help2 : Status_enum := HIDE;
		Help3 : Status_enum := HIDE;
		Help4 : Status_enum := HIDE;
		Help5 : Status_enum := HIDE;
		Help6 : Status_enum := HIDE;
		Help7 : Status_enum := HIDE;
		Help8 : Status_enum := HIDE;
		Help9 : Status_enum := HIDE;
		Layer1 : Status_enum := HIDE;
		Layer2 : Status_enum := HIDE;
		Layer3 : Status_enum := HIDE;
		Layer4 : Status_enum := HIDE;
		Layer5 : Status_enum := HIDE;
		Layer6 : Status_enum := HIDE;
		Layer7 : Status_enum := HIDE;
		Layer8 : Status_enum := HIDE;
		Layer9 : Status_enum := HIDE;
		Layer10 : Status_enum := HIDE;
		Layer11 : Status_enum := HIDE;
		Layer12 : Status_enum := HIDE;
		Layer13 : Status_enum := HIDE;
		Layer14 : Status_enum := HIDE;
		Layer15 : Status_enum := HIDE;
	END_STRUCT;
	PAGE_enum : 
		(
		P00_INITIALIZE := 0,
		P10_MENU := 10,
		P11_MIMIC := 11,
		P12_OPTIONS := 12,
		P13_SETTINGS := 13,
		P14_DRIVES := 14,
		P15_SERVOS := 15,
		P16_RIO := 16,
		P17_ALARM := 17,
		P18_WARNING := 18,
		P19_EVENT := 19,
		P20_ASHTON_TECH := 20,
		P21_SDM := 21,
		P30_VARIABLES := 30,
		VIS_IDLE := 65535
		);
	VisuNew_typ : 	STRUCT 
		Color : USINT; (*Appearance Color Datapoint*)
		PressedColor : USINT; (*Appearance Pressed Color Datapoint*)
		Index : USINT; (*Value Index Datapoint*)
		Min : USINT; (*Value Min Index Datapoint*)
		Max : USINT; (*Value Max Index Datapoint*)
		Value : USINT; (*Datapoint Value*)
		Status : Status_enum := HIDE; (*Runtime Status Datapoint*)
		P10 : LayersNew_typ := (Index:=1); (*P10 Menu visualisation controls*)
	END_STRUCT;
	Level_typ : 	STRUCT 
		Delay : TON; (*Delay before confirm complete*)
		EnableSup : Status_enum := HIDE; (*Enable Supervisor level input*)
		EnableEng : Status_enum := HIDE; (*Enable Engineer level input*)
		EnableTech : Status_enum := HIDE; (*Enable Ashton Tech level input*)
		ResetEnable : Status_enum := HIDE; (*Enable Reset Defaults text*)
		EngEnable : Status_enum := HIDE; (*Enable Engineer change text*)
		SupEnable : Status_enum := HIDE; (*Enable Supervisor change text*)
		Enable : Status_enum := HIDE; (*Enable password input*)
		Entered : BOOL := FALSE; (*Password entered*)
		Eng : Status_enum := HIDE; (*Engineer level*)
		EngConfirm : BOOL := FALSE; (*Confirm new password entered*)
		EngNew : STRING[4]; (*New engineer password*)
		Level : Level_enum := OPERATOR; (*Level indicator*)
		Reset : BOOL := FALSE; (*Default reset*)
		Sup : Status_enum := HIDE; (*Supervisor level*)
		SupConfirm : BOOL := FALSE; (*Confirm new password entered*)
		SupNew : STRING[4]; (*New supervisor password*)
		EngRefused : Status_enum := HIDE; (*Display text  why engineering menu not available*)
		RefusedConfirm : BOOL; (*Confirm EngRefused*)
		ScreenTouch : BOOL; (*Turn on when screen touched.*)
		TechDelay : TON; (*Inactivity delay for password reset*)
		EngDelay : TON; (*Inactivity delay for password reset*)
		SupDelay : TON; (*Inactivity delay for password reset*)
		TechResetStart : BOOL; (*Start for reset delay*)
		EngResetStart : BOOL; (*Start for reset delay*)
		SupResetStart : BOOL; (*Start for reset delay*)
		BlockTech : BOOL; (*Block Tech reset delays when on specific screens*)
		BlockEng : BOOL; (*Block Engineering reset delays when on specific screens*)
		GTEngineerEnable : Status_enum := HIDE; (*Enable greater than Engineer level controls*)
		GTSupervisorEnable : Status_enum := HIDE; (*Enable greater than Supervisor level controls*)
		GTOperatorEnable : Status_enum := HIDE; (*Enable greater than Operator level controls*)
		TestModeEnable : Status_enum := HIDE; (*Test Mode enabled*)
		TestMode : Status_enum := HIDE; (*Test Mode enable*)
	END_STRUCT;
	CycleTest_typ : 	STRUCT 
		Track001Time : UDINT := 500;
		Track002Time : UDINT := 500;
		Track003Time : UDINT := 3350;
		Track004Time : UDINT := 1200;
		Track09Time : UDINT := 3000;
		Track11Time : UDINT := 2230;
		Track12Time : UDINT := 340;
		Track413Time : UDINT := 1370;
		Track414Time : UDINT := 150;
		Track516Time : UDINT := 5010;
		Track517Time : UDINT := 1200;
		Track519Time : UDINT := 500;
		Track26Time : UDINT := 260;
		Track27Time : UDINT := 900;
		Track29Time : UDINT := 3000;
		Track31Time : UDINT := 1460;
		Track32Time : UDINT := 340;
		Track34Time : UDINT := 1310;
		Track35Time : UDINT := 1460;
		Track38Time : UDINT := 340;
		Track39Time : UDINT := 600;
		Track52Time : UDINT := 150;
		Track53Time : UDINT := 500;
		Track154Time : UDINT := 200;
		Track155Time : UDINT := 2600;
		Track256Time : UDINT := 1700;
		Track257Time : UDINT := 13000;
		Track558Time : UDINT := 7950;
		Track559Time : UDINT := 13000;
		Track64Time : UDINT := 10000;
		PivotTime : UDINT := 8000;
		TrackDelay : TON;
	END_STRUCT;
	Level_enum : 
		(
		OPERATOR := 0,
		SUPERVISOR := 1,
		ENGINEER := 2,
		ASHTON_TECH := 3
		);
END_TYPE

(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Ashton
 * File: Ashton.fun
 * Author: nicke
 * Created: May 27, 2008
 ********************************************************************
 * Functions and function blocks of library Ashton
 ********************************************************************)

FUNCTION_BLOCK TrackCount (*Count Tracked pieces*)
	VAR_INPUT
		IN1 : USINT; (*Add your parameter comment*)
		IN2 : USINT; (*Add your parameter comment*)
		IN3 : USINT; (*Add your parameter comment*)
		IN4 : USINT; (*Add your parameter comment*)
		IN5 : USINT; (*Add your parameter comment*)
		IN6 : USINT; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		Count : USINT; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK Photo (*Anti bounce input filter*)
	VAR_INPUT
		SensorIN : BOOL; (*Add your parameter comment*)
		SpeedON : REAL; (*Add your parameter comment*)
		SpeedOFF : REAL; (*Add your parameter comment*)
		OverrideON : UDINT;
		OverrideOFF : UDINT;
	END_VAR
	VAR_OUTPUT
		SensorOUT : BOOL; (*Add your parameter comment*)
		PTON : TIME;
		PTOFF : TIME;
		Measured : REAL;
	END_VAR
	VAR
		Measure : CycleTime_typ;
		DelayB4ON : TON; (*Add your parameter comment*)
		DelayB4OFF : TON; (*Add your parameter comment*)
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		zzEdge00003 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TrackProc (*TODO: Add your comment here*)
	VAR_INPUT
		ONStart : BOOL; (*Add your parameter comment*)
		OFFStart : BOOL; (*Add your parameter comment*)
		EStop : BOOL; (*Add your parameter comment*)
		PT_On : UDINT; (*Add your parameter comment*)
		PT_Off : UDINT; (*Add your parameter comment*)
		End : BOOL;
	END_VAR
	VAR_OUTPUT
		Out : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		ON : TON; (*Add your parameter comment*)
		OFF : TON; (*Add your parameter comment*)
		BeforeOn : BOOL;
		BeforeOff : BOOL;
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		zzEdge00003 : BOOL;
		zzEdge00004 : BOOL;
		PTOnEStop : TIME;
		PTOffEStop : TIME;
		Recover : BOOL;
		ONPT : TIME;
		OFFPT : TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK C5Restart (*Calculate Restart delay for C5R*)
	VAR_INPUT
		Start : BOOL; (*Add your parameter comment*)
		Speed : REAL; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		Out : BOOL; (*Add your parameter comment*)
	END_VAR
	VAR
		TON_001 : TON; (*Add your parameter comment*)
		Preset : REAL; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK RunTime (*Calculate system run time*)
	VAR_INPUT
		On : BOOL; (*Add your parameter comment*)
		TotReset : BOOL; (*Total Reset*)
		ShftReset : BOOL; (*Shift Reset*)
		TotMinIn : UINT; (*Total minutes In*)
		TotHrIn : UINT; (*Total hours In*)
		TotDayIn : UINT; (*Total days In*)
		TotYrIn : UINT; (*Total years In*)
		ShftMinIn : UINT; (*Shft minutes In*)
		ShftHrIn : UINT; (*Shift hours In*)
		ShftDayIn : UINT; (*Shift days In*)
		ShftYrIn : UINT; (*Shift years In*)
	END_VAR
	VAR_OUTPUT
		TotMin : UINT; (*Total Minutes*)
		TotHr : UINT; (*Total Hours*)
		TotDay : UINT; (*Total Days*)
		TotYr : UINT; (*Total Years*)
		ShftMin : UINT; (*Shift Minutes*)
		ShftHr : UINT; (*Shift Hours*)
		ShftDay : UINT; (*Shift Days*)
		ShftYr : UINT; (*Shift Years*)
	END_VAR
	VAR
		Minute : TON; (*Minute timer*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK GrindTime (*Calculate grind time and length*)
	VAR_INPUT
		On : BOOL; (*Start trigger*)
		TotReset : BOOL; (*Total Reset*)
		ShftReset : BOOL; (*Shift Reset*)
		Speed : REAL; (*Seaming speed*)
		Measured : REAL; (*Measured length/width*)
		TotMSIn : UINT; (*Total Milliseconds*)
		TotSecIn : UINT; (*Total Seconds*)
		TotMinIn : UINT; (*Total Minutes*)
		TotHrIn : UINT; (*Total Hours*)
		TotDayIn : UINT; (*Total Days*)
		ShftMSIn : UINT; (*Shift Milliseconds*)
		ShftSecIn : UINT; (*Shift Seconds*)
		ShftMinIn : UINT; (*Shift Minutes*)
		ShftHrIn : UINT; (*Shift Hours*)
		ShftDayIn : UINT; (*Shift Days*)
		TotMtrs1In : UDINT; (*Total Meters 1*)
		TotMtrs2In : UDINT; (*Total Meters 2*)
		TotFt1In : UDINT; (*Total Feet 1*)
		TotFt2In : UDINT; (*Total Feet 2*)
		ShftMtrs1In : UDINT; (*Shift Meters 1*)
		ShftMtrs2In : UDINT; (*Shift Meters 2*)
		ShftFt1In : UDINT; (*Shift Feet 1*)
		ShftFt2In : UDINT; (*Shift Feet 2*)
	END_VAR
	VAR_OUTPUT
		TotMS : UINT; (*Total Milliseconds*)
		TotSec : UINT; (*Total Seconds*)
		TotMin : UINT; (*Total Minutes*)
		TotHr : UINT; (*Total Hours*)
		TotDay : UINT; (*Total Days*)
		ShftMS : UINT; (*Shift Milliseconds*)
		ShftSec : UINT; (*Shift Seconds*)
		ShftMin : UINT; (*Shift Minutes*)
		ShftHr : UINT; (*Shift Hours*)
		ShftDay : UINT; (*Shift Days*)
		TotMtrs1 : UDINT; (*Total Meters 1*)
		TotMtrs2 : UDINT; (*Total Meters 2*)
		TotFt1 : UDINT; (*Total Feet 1*)
		TotFt2 : UDINT; (*Total Feet 2*)
		ShftMtrs1 : UDINT; (*Shift Meters 1*)
		ShftMtrs2 : UDINT; (*Shift Meters 2*)
		ShftFt1 : UDINT; (*Shift Feet 1*)
		ShftFt2 : UDINT; (*Shift Feet 2*)
	END_VAR
	VAR
		CurrentMS : REAL; (*Current measured length in millisec*)
		WholeSec : UINT; (*Calculated whole seconds*)
		CurrentMSUINT : UINT; (*CurrentMS in UINT*)
		WholeMSec : UINT;
		Calc3 : UINT;
		MeasuredFtUD : UDINT; (*Measured feet UDINT*)
		MeasuredUD : UDINT; (*Measured Mtrs UDINT*)
		MeasuredM : REAL; (*Measured Mtrs*)
		MeasuredFt : REAL; (*Measured feet*)
		zzEdge00000 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK Center2 (*TODO: Add your comment here*)
	VAR_INPUT
		WidthIn : REAL; (*Add your parameter comment*)
		Speed : REAL; (*Add your parameter comment*)
		Centre : REAL; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		PT : UDINT; (*Add your parameter comment*)
	END_VAR
	VAR
		Calc1 : REAL; (*Add your parameter comment*)
		DecTime : REAL; (*Add your parameter comment*)
		DecDist : REAL; (*Add your parameter comment*)
		PTReal : REAL; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK Center (*TODO: Add your comment here*)
	VAR_INPUT
		WidthIn : REAL; (*Add your parameter comment*)
		Speed : REAL; (*Add your parameter comment*)
		Centre : REAL; (*Add your parameter comment*)
	END_VAR
	VAR_OUTPUT
		PT : UDINT; (*Add your parameter comment*)
	END_VAR
	VAR
		Calc1 : REAL; (*Add your parameter comment*)
		AccTime : REAL; (*Add your parameter comment*)
		AccDecDist : REAL; (*Add your parameter comment*)
		PTReal : REAL; (*Add your parameter comment*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TrackBit (*Tracking Bit Controls*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		FixedIN : TrackBit_Fixed_typ;
		RunBlock : BOOL;
		SolBlock : BOOL;
		Analog : FB_ANALOG_enum;
		Speed : REAL;
		SpeedAnalog : REAL;
		SpeedMatchEN : BOOL;
		SpeedMatch : REAL;
		TimeoutBlock : BOOL;
		TimeoutEN : BOOL;
		TrackDelayEN : BOOL;
		DelayPT : UDINT;
		TimeoutACK : BOOL;
		DoneIN : BOOL;
	END_VAR
	VAR_OUTPUT
		Active : BOOL;
		Done : BOOL;
		Disp : Display_enum;
		ESDisp : {REDUND_UNREPLICABLE} Display_enum;
		RunOUT : BOOL;
		SolOUT : BOOL;
		SpeedOUT : REAL;
		TimeoutOUT : BOOL;
	END_VAR
	VAR
		DelayTON : TON;
		TimeoutACKLatch : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TrackingSection (*TRACKING SECTION CONTROLS*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		ControlIN : BOOL;
		ESClear : BOOL;
		Cleared : BOOL;
		EMOStart : BOOL;
		Blocks : ARRAY[0..12] OF BOOL;
		BlockInhib : BOOL;
		ResES : BOOL;
		ResMan : BOOL;
		ESDispInhib : BOOL;
		IndexIN : USINT;
		WidthIN : REAL;
		LengthIN : REAL;
		BatchClearIN : BOOL;
		LongestIN : REAL;
		RowBlockIN : BOOL;
		ChangeIN : BOOL;
		ArrissUpperIN : BOOL;
		ArrissLowerIN : BOOL;
		EdgeDeleteIN : BOOL;
		VerticalBeltIN : BOOL;
	END_VAR
	VAR_OUTPUT
		FixedOUT : TrackBit_Fixed_typ;
		Blocked : BOOL;
		Busy : BOOL;
		Index : USINT;
		Width : REAL;
		Length : REAL;
		BatchClear : BOOL;
		Longest : REAL;
		RowBlock : BOOL;
		Change : BOOL;
		ArrissUpper : BOOL;
		ArrissLower : BOOL;
		EdgeDelete : BOOL;
		VerticalBelt : BOOL;
		Cycle : REAL;
		BusyDisp : Display_enum;
	END_VAR
	VAR
		CurrentTime : TIME;
		PreviousTime : TIME;
		ElapsedTime : UDINT;
		i : INT;
		zzEdge00000 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ControlFB
	VAR_INPUT
		Start : BOOL;
		Stop : BOOL;
		EStop1 : BOOL;
		EStop2 : BOOL;
		BuzzBlock : BOOL;
		StandbyBlock : BOOL;
		Auto : BOOL;
		Test : BOOL;
		ESClear : BOOL;
		Paused : BOOL;
		Alarm : BOOL;
		Warning : BOOL;
		CountIN : ARRAY[0..19] OF BOOL;
		BuzzerPT : UDINT;
		StandbyPT : UDINT;
	END_VAR
	VAR_OUTPUT
		Achieved1 : BOOL;
		Achieved2 : BOOL;
		Buzzer : BOOL;
		Empty : BOOL;
		OnLmp1 : BOOL;
		OnLmp2 : BOOL;
		GrnLmp : BOOL;
		YelLmp : BOOL;
		RedLmp : BOOL;
	END_VAR
	VAR
		BuzzerTON : TON;
		StandbyTON : TON;
		Grn : ARRAY[0..2] OF BOOL;
		Yel : ARRAY[0..2] OF BOOL;
		Red : ARRAY[0..2] OF BOOL;
		TSecOff : BOOL;
		TSecOn : BOOL;
		TSecOFF : TON;
		TSecON : TON;
		StopLatch : BOOL;
		StopDone : BOOL;
		i : USINT;
		zzEdge1 : BOOL;
		zzEdge2 : BOOL;
		zzEdge3 : BOOL;
		zzEdge4 : BOOL;
		zzEdge5 : BOOL;
		EStopStartTON : TON;
		zzEdge6 : BOOL;
		zzEdge7 : BOOL;
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		zzEdge00003 : BOOL;
		zzEdge00004 : BOOL;
		zzEdge00005 : BOOL;
		zzEdge00006 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SeamersFB
	VAR_INPUT
		Enable : ARRAY[0..4] OF BOOL;
		AutoStart : ARRAY[0..4] OF BOOL;
		ESClear : BOOL;
		ControlIN : BOOL;
		EDOn : BOOL;
		TransportMode : BOOL;
		Detension : BOOL;
		Trips : ARRAY[0..24] OF BOOL;
		Float : ARRAY[0..2] OF BOOL;
		BeltsPT : UDINT;
		VacPT : UDINT;
		EDPT : UDINT;
		ExtractionPT : UDINT;
		PumpPT : ARRAY[0..4] OF UDINT;
		VacsStopPT : UDINT;
	END_VAR
	VAR_OUTPUT
		StartAllDisp : Display_enum;
		BeltOUT : ARRAY[0..12] OF BOOL;
		VacOUT : ARRAY[0..4] OF BOOL;
		EDOUT : ARRAY[0..4] OF BOOL;
		ExtractionOUT : ARRAY[0..4] OF BOOL;
		PumpOUT : ARRAY[0..2] OF BOOL;
		DoneOUT : ARRAY[0..4] OF BOOL;
	END_VAR
	VAR
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		zzEdge00003 : BOOL;
		zzEdge00004 : BOOL;
		zzEdge00005 : BOOL;
		zzEdge00006 : BOOL;
		zzEdge00007 : BOOL;
		zzEdge00008 : BOOL;
		zzEdge00009 : BOOL;
		zzEdge00010 : BOOL;
		zzEdge00011 : BOOL;
		zzEdge00012 : BOOL;
		zzEdge00013 : BOOL;
		zzEdge00014 : BOOL;
		zzEdge00015 : BOOL;
		zzEdge00016 : BOOL;
		zzEdge00017 : BOOL;
		zzEdge00018 : BOOL;
		zzEdge00019 : BOOL;
		zzEdge00020 : BOOL;
		zzEdge00021 : BOOL;
		zzEdge00022 : BOOL;
		zzEdge00023 : BOOL;
		zzEdge00024 : BOOL;
		zzEdge00025 : BOOL;
		zzEdge00026 : BOOL;
		zzEdge00027 : BOOL;
		Latch : BOOL;
		LatchES : BOOL;
		Starting1 : BOOL;
		Starting2 : BOOL;
		Starting3 : BOOL;
		Starting4 : BOOL;
		Belt1TON : TON;
		Belt2TON : TON;
		Belt3TON : TON;
		Belt4TON : TON;
		Belt5TON : TON;
		Belt6TON : TON;
		Belt7TON : TON;
		Belt8TON : TON;
		Belt9TON : TON;
		Belt10TON : TON;
		Belt11TON : TON;
		Belt12TON : TON;
		ED1TON : TON;
		ED2TON : TON;
		ED3TON : TON;
		ED4TON : TON;
		Vac1TON : TON;
		Vac2TON : TON;
		Vac3TON : TON;
		Vac4TON : TON;
		Extract1TON : TON;
		Extract2TON : TON;
		Extract3TON : TON;
		Extract4TON : TON;
		Pump4TON : TON;
		Pump3TON : TON;
		Pump1TON : TON;
		Pump2TON : TON;
		i : INT;
		VacStopTON : TON;
		zzEdge00028 : BOOL;
		zzEdge00029 : BOOL;
		zzEdge00030 : BOOL;
		zzEdge00031 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK InvTestFB
	VAR_INPUT
		Index : USINT;
		AutoSpeedIN : REAL;
		SpeedIN : PLInvPerm;
		TestSpeedIN : REAL;
		AnalogSpeedIN : REAL;
	END_VAR
	VAR_OUTPUT
		Run : BOOL;
		Rev : BOOL;
		Speed : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK Batch (*ROW BUILDING CALCULATIONS*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Calculate : BOOL;
		ClearIN : BOOL;
		Building : BOOL;
		Gap : REAL;
		MaxSize : REAL;
		CenterDist : REAL;
		CenterSpeed : REAL;
		FollowingIN : ARRAY[0..9] OF REAL;
		LengthIN : REAL;
		BatchMode : BATCHING_enum;
		Type : BATCHTYPE_enum;
	END_VAR
	VAR_OUTPUT
		Longest : REAL;
		Current : REAL;
		Next : REAL;
		Done : BOOL;
		CenterPT : UDINT;
		Remaining : REAL;
	END_VAR
	VAR
		i : USINT;
		MinRemaining : REAL;
		NextSize : REAL;
		NextLengthINT : REAL;
		NextINT : REAL;
		DoubleCount : USINT;
		Center : Center;
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		zzEdge00003 : BOOL;
		zzEdge00004 : BOOL;
		zzEdge00005 : BOOL;
		zzEdge00006 : BOOL;
		zzEdge00007 : BOOL;
		zzEdge00008 : BOOL;
		zzEdge00009 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK SeamersSMProFB (*Seamers start up control SMPro*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : ARRAY[0..4] OF BOOL;
		AutoStart : ARRAY[0..4] OF BOOL;
		ESClear : BOOL;
		ControlIN : BOOL;
		EDOn : BOOL;
		TransportMode : BOOL;
		Detension : BOOL;
		Trips : ARRAY[0..24] OF BOOL;
		Float : ARRAY[0..2] OF BOOL;
		BeltsPT : UDINT;
		VacPT : UDINT;
		EDPT : UDINT;
		ExtractionPT : UDINT;
		PumpPT : ARRAY[0..4] OF UDINT;
		VacsStopPT : UDINT;
	END_VAR
	VAR_OUTPUT
		StartAllDisp : Display_enum;
		BeltOUT : ARRAY[0..12] OF BOOL;
		VacOUT : ARRAY[0..4] OF BOOL;
		EDOUT : ARRAY[0..4] OF BOOL;
		ExtractionOUT : ARRAY[0..4] OF BOOL;
		PumpOUT : ARRAY[0..2] OF BOOL;
		DoneOUT : ARRAY[0..4] OF BOOL;
	END_VAR
	VAR
		Latch : BOOL;
		LatchES : BOOL;
		Starting1 : BOOL;
		Starting2 : BOOL;
		Belt1TON : TON;
		Belt2TON : TON;
		Belt3TON : TON;
		Belt4TON : TON;
		Belt5TON : TON;
		Belt6TON : TON;
		Belt7TON : TON;
		Belt8TON : TON;
		Belt9TON : TON;
		Belt10TON : TON;
		Belt11TON : TON;
		Belt12TON : TON;
		ED1TON : TON;
		ED2TON : TON;
		ED3TON : TON;
		ED4TON : TON;
		Vac1TON : TON;
		Vac2TON : TON;
		Vac3TON : TON;
		Vac4TON : TON;
		Extract1TON : TON;
		Extract2TON : TON;
		Extract3TON : TON;
		Extract4TON : TON;
		Pump4TON : TON;
		Pump3TON : TON;
		Pump1TON : TON;
		Pump2TON : TON;
		i : INT;
		VacStopTON : TON;
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		zzEdge00003 : BOOL;
		zzEdge00004 : BOOL;
		zzEdge00005 : BOOL;
		zzEdge00006 : BOOL;
		zzEdge00007 : BOOL;
		zzEdge00008 : BOOL;
		zzEdge00009 : BOOL;
		zzEdge00010 : BOOL;
		zzEdge00011 : BOOL;
		zzEdge00012 : BOOL;
		zzEdge00013 : BOOL;
		zzEdge00014 : BOOL;
		zzEdge00015 : BOOL;
		zzEdge00016 : BOOL;
		zzEdge00017 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK FlipUps (*FLIP UP ARMS CONTROL*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		ActPos : REAL; (*Seamer Actual Position*)
		ArmPos : ARRAY[0..5] OF REAL; (*Arm Actual Positions*)
		Up : ARRAY[0..10] OF BOOL; (*Array for arms up reed switches*)
		i : INT; (*Index for FOR loops*)
		Down : ARRAY[0..10] OF BOOL; (*Array for arms down reed switches*)
		HiVol : BOOL; (*Mode Selection*)
		Arms : USINT; (*Number of Arms*)
		Raise : BOOL; (*Condition to raise arms*)
	END_VAR
	VAR_OUTPUT
		UpDone : BOOL; (*Selected arms up*)
		OUT : ARRAY[0..5] OF BOOL; (*Raise Arms Output*)
		DownDone : BOOL; (*All arms down*)
		CheckRaised : INT; (*Number of arms to raise*)
	END_VAR
	VAR
		zzEdge00000 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

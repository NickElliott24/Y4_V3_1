
TYPE
	IntervalDelays_typ : 	STRUCT 
		IntervalPT : UDINT;
		OpenPT : UDINT;
	END_STRUCT;
	IntervalOpen_enum : 
		(
		IO_IDLE,
		IO_INTERVAL,
		IO_OPEN
		);
	CycleTime_typ : 	STRUCT 
		Current : TIME; (*Current captured time*)
		Previous : TIME; (*Previous captured time*)
		Elapsed : UDINT; (*Elapsed/Cycle time*)
	END_STRUCT;
	Display_enum : 
		(
		FB_SHOW := 0,
		FB_HIDE := 1
		);
	TrackBit_Fixed_typ : 	STRUCT 
		Control : BOOL;
		ESClearing : BOOL;
		ESClear : BOOL;
		EMOStart : BOOL;
	END_STRUCT;
	FB_ANALOG_enum : 
		(
		NO_ANALOG := 0, (*ANALOG NOT SELECTED*)
		VOLTAGE_TYPE_1 := 1, (*0-10V Voltage Type*)
		CURRENT_TYPE_1 := 2, (*0-20mA Current Type*)
		CURRENT_TYPE_2 := 3 (*4-20mA Current Type*)
		);
	PLInvPerm : 	STRUCT 
		SpeedMax : REAL; (*Maximum Speed*)
		SpeedSeam : REAL; (*Seaming Speed*)
		SpeedTrans : REAL; (*Transfer Speed*)
		SpeedSlow : REAL; (*Squaring speed*)
		SpeedLaser : REAL; (*Positioning Speed E.G. Laser*)
		SpeedWash : REAL; (*Washer Speed*)
		SpeedCntr : REAL; (*Centering Speed*)
		SpeedBatch : REAL; (*Batching Speed*)
		SpeedEntry : REAL; (*Entry Speed - to match other equipment*)
		SpeedExit : REAL; (*Exit Speed - to match other equipment*)
		SpeedSeamSlow : REAL; (*Slow Seaming Speed*)
	END_STRUCT;
	BATCHTYPE_enum : 
		(
		ROW := 0, (*Row Builidng*)
		LOAD := 1 (*Load Building*)
		);
	BATCHING_enum : 
		(
		AUTO := 0, (*Auto Batching, to max limits*)
		SINGLE := 1, (*Batching only single pieces*)
		PAIRS := 2, (*Batching only 1 row of 2 pieces*)
		TWOS := 3, (*Batching only 2 rows of 1 piece/row*)
		FOURS := 4 (*Batching only 2 rows of 2 pieces*)
		);
	NozzleControl_enum : 
		(
		NC_Idle,
		NC_Open,
		NC_Close,
		NC_CleanDone,
		NC_ControlStop1,
		NC_ControlStop2
		);
	NozzleControl_typ : 	STRUCT 
		CountPurge : INT;
		Seq : NozzleControl_enum;
		PurgeCount : INT;
		Delay : INT;
		VacuumStopDelay : DINT;
		NozzleOpenDelay : DINT;
	END_STRUCT;
	NozzlePerm_typ : 	STRUCT 
		PurgeCount : INT;
		OpenDelay : DINT;
	END_STRUCT;
	Preset_Seamers_typ : 	STRUCT 
		Belt : UDINT; (*During Belt auto start*)
		Vac : UDINT; (*During Vacuum auto start*)
		ED : UDINT; (*During ED auto start*)
		Extraction : UDINT; (*During Extraction auto start*)
		VacsStop : UDINT; (*Vacuum run on after control stop*)
		Water : ARRAY[0..4]OF UDINT; (*Water Pump delays*)
	END_STRUCT;
	Control_typ : 	STRUCT 
		Achieved : BOOL;
		ESClear : BOOL;
	END_STRUCT;
	Interval_typ : 	STRUCT 
		Out : BOOL; (*Valve output*)
		Open : TON; (*Valve open delay*)
		Interval : TON; (*Interval delay*)
		TestIndex2 : USINT;
		TestIndex1 : USINT;
		FreqIndex : USINT;
	END_STRUCT;
	SeamerStart_enum : 
		(
		SS_Reset := 0,
		SS_Ready := 1,
		SS_BeltMotor1 := 2, (*Control for 1st belt motor*)
		SS_BeltMotor2 := 3, (*Control for 2nd belt motor*)
		SS_BeltMotor3 := 4, (*Control for 3rd belt motor*)
		SS_BeltMotor4 := 5, (*Control for 4th belt motor*)
		SS_BeltMotor5 := 6, (*Control for 5th belt motor (Vertical)*)
		SS_BeltMotor6 := 7, (*Control for 6th belt motor (Vertical)*)
		SS_VacuumPump1 := 8, (*Control for 1st vacuum pump*)
		SS_VacuumPump2 := 9, (*Control for 2nd vacuum pump*)
		SS_Extraction1 := 10, (*Control for 1st extraction pump (Dry)*)
		SS_Extraction2 := 11, (*Control for 2nd extraction pump (Dry)*)
		SS_Started := 12,
		SS_TransportMode := 13
		);
	Control_BackGround_typ : 	STRUCT 
		Achieved1 : BOOL;
		Achieved2 : BOOL;
		ESClear : BOOL;
		Warning : BOOL;
		Alarm : BOOL;
		AutoStart : ARRAY[0..2]OF BOOL;
		Enable : ARRAY[0..2]OF BOOL;
		ED : BOOL;
	END_STRUCT;
	VacuumRunOn_enum : 
		(
		VR_Idle := 0,
		VR_Running := 1,
		VR_Done := 2
		);
	IntervalDelay_enum : 
		(
		ID_Idle := 0,
		ID_Interval := 1,
		ID_Open := 2
		);
END_TYPE

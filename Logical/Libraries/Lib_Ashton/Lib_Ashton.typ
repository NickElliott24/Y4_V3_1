
TYPE
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
END_TYPE

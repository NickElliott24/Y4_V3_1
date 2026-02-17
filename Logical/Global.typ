(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * File: Global.typ
 * Author: NickE
 * Created: April 2, 2015
 ********************************************************************
 * Global data types of project N_Default
 ********************************************************************)

TYPE
	SizeData_enum : 
		(
		SD_Idle := 0, (*Wait*)
		SD_WidthData := 1, (*Set Width Data*)
		SD_WidthACK := 2, (*Wait for acknowledgement that width data has been received*)
		SD_NotWidthACK := 3, (*Wait for acknowlede off, data has transmitted*)
		SD_LengthData := 4, (*Set Length Data*)
		SD_LengthACK := 5, (*Wait for acknowledgement that length data has been received*)
		SD_NotLengthACK := 6 (*Wait for acknowlede off, data has transmitted*)
		);
	SizeData_typ : 	STRUCT 
		Sizes : ARRAY[0..11]OF BOOL; (*Bit array to pass data to AGV controller*)
		Sequence : SizeData_enum;
		CurrentWidth : UINT;
		CurrentLength : UINT;
		WidthMask : BOOL;
		LengthMask : BOOL;
	END_STRUCT;
	Measurement_typ : 	STRUCT 
		Reset : BOOL;
		Runtime : Display_enum;
	END_STRUCT;
	Alarm_typ : 	STRUCT 
		Control : USINT; (*Visu alarm control*)
		Group : USINT; (*Visu alarm control*)
		Alarm : USINT; (*Visu alarm control*)
		Priority : USINT; (*Visu alarm control*)
	END_STRUCT;
	ANALOGCAPTURE_typ : 	STRUCT 
		CLB : ANALOGRECORD_typ;
	END_STRUCT;
	ANALOGPERMS_typ : 	STRUCT 
		V1 : ANALOGPERM_typ;
		C1 : ANALOGPERM_typ;
		C2 : ANALOGPERM_typ;
	END_STRUCT;
	ANALOGPERM_typ : 	STRUCT 
		ActAnalog : REAL;
		ActSpeed : REAL;
	END_STRUCT;
	ANALOGRECORD_typ : 	STRUCT 
		RecordStart : BOOL;
		RecordConfirm : BOOL;
		SpeedDisp : REAL;
		DisplayRaw : UINT;
		DisplaySpeed : REAL;
		DisplayAnalog : REAL;
	END_STRUCT;
	ANALOGS_typ : 	STRUCT 
		CL1 : ANALOGPERMS_typ;
		CS1 : ANALOGPERMS_typ;
		CV1 : ANALOGPERMS_typ;
		CC1 : ANALOGPERMS_typ;
		CC2 : ANALOGPERMS_typ;
		CS2 : ANALOGPERMS_typ;
		CV2 : ANALOGPERMS_typ;
		CC3 : ANALOGPERMS_typ;
		CC4 : ANALOGPERMS_typ;
		CB1 : ANALOGPERMS_typ;
		CB2 : ANALOGPERMS_typ;
		CRB : ANALOGPERMS_typ;
		CRE : ANALOGPERMS_typ;
		CLB : ANALOGPERMS_typ;
	END_STRUCT;
	ArmsPerm_typ : 	STRUCT 
		Position : ARRAY[0..5]OF REAL; (*Position for operation comparison*)
	END_STRUCT;
	ArmsTemp_typ : 	STRUCT 
		HoldUp : TrackCount; (*Count for arms hold up*)
		UpCheck : INT; (*Case statement index*)
		DownDone : BOOL; (*Done bit for all down condition*)
		UpDone : BOOL; (*Done bit for selected up comparison.*)
		Down : ARRAY[0..10]OF BOOL; (*Down comparison bits*)
		Up : ARRAY[0..10]OF BOOL; (*Up comparison bits*)
		ActPos : REAL; (*Actual Position*)
	END_STRUCT;
	AxisBasic_typ : 	STRUCT 
		Power : BOOL; (*Turns the power on*)
		Home : BOOL; (*homes the axis*)
		MoveAbsolute : BOOL; (*Starts the absolute movement*)
		Stop : BOOL; (*Stops a movement*)
		MoveJogPos : BOOL; (*Starts the jog movement in positive direction*)
		MoveJogNeg : BOOL; (*Starts the jog movement in negative direction*)
		ErrorAcknowledge : BOOL; (*Acknowledge an error with a pos. Edge*)
		ParaPosition : REAL; (*Parameter absolute target position*)
		ParaVelocity : REAL; (*Parameter target velocity*)
		ParaDirection : USINT; (*Parameter movement direction*)
		ParaAcceleration : REAL; (* Parameter movement acceleration*)
		ParaDeceleration : REAL; (* Parameter movement deceleration*)
		ParaHomePosition : REAL; (*Parameter home position*)
		ParaJogVelocity : REAL; (*Parameter jog movement target velocity*)
		ParaOverrideVelocity : REAL; (*Parameter velocity override (0.0 - 2.0)*)
		ParaOverrideAcceleration : REAL; (*Parameter acceleration override (0.0001 - 2.0)*)
		ErrorID : UINT; (*Shows the Error ID (0 = No Error)*)
		ErrorText : ARRAY[0..3]OF STRING[79]; (*Shows the Acopos Errortext as string*)
		ActPosition : REAL; (*actual position*)
		ActVelocity : REAL; (*actual velocity*)
		StatusDisabled : BOOL; (*Status power disabled*)
		StatusStandstill : BOOL; (*Status axis at standstill*)
		StatusStopping : BOOL; (*Status axis is stopping*)
		StatusHoming : BOOL; (*Status axis is homing*)
		StatusMotionDiscrete : BOOL; (*Status discrete motion is active*)
		StatusMotionContinous : BOOL; (*Status continous motion is active*)
		StatusMotionSynchronized : BOOL; (*Status synchronized motion is active*)
		StatusErrorstop : BOOL; (*Status axis stopped after error*)
		Obj : UDINT; (*Pointer to NC structure*)
		Step : USINT; (*State index*)
		ErrorNcAccess : UINT; (*ncaccess function status*)
		CyclicBits : UDINT; (*Cyclic read data address*)
		StartHome : BOOL; (*Start homing*)
		Homed : BOOL; (*Homing done*)
		Ret : UDINT; (*memcpy status*)
		CyclicReadExecute : BOOL; (*Execute cyclic read*)
		OKtoRun : BOOL; (*Cyclic read completed*)
		DigiSetup : BOOL; (*Map X67 inputs to ACOPOS*)
	END_STRUCT;
	AxisPerm_typ : 	STRUCT 
		FastSpeed : REAL; (*Fast search velocity*)
		SlowSpeed : REAL; (*Slow search velocity*)
		FCSpeed : REAL; (*Forward check search speed*)
		FwdFeed : REAL; (*Forward feed length*)
		RevFeed : REAL; (*Reverse feed length*)
		AbsMax : REAL; (*Maximum absolute position*)
		AbsMin : REAL; (*Minimum absolute position*)
		FFAbsMax : REAL; (*Fast forward absolute position*)
		FRAbsMin : REAL; (*Fast rev absolute position*)
		FCDist : REAL; (*Forward check distance*)
		SlowAdj1 : REAL; (*Reverse slow adjustment*)
		SlowAdj2 : REAL; (*Forward slow adjustment*)
		SlowAdj3 : REAL; (*Forward check adjustment*)
		SlowDist : REAL; (*Slow move distance*)
		Origin : REAL; (*Origin Preset Position*)
	END_STRUCT;
	AXIS_STATE_enum : 
		(
		STATE_DIGI_SETUP := 0, (*constant for mapping PL inputs to ACOPOS*)
		STATE_WAIT := 1, (*constant for a waiting step*)
		STATE_POWER_ON := 2, (*constant for the step in which the controller is switched on*)
		STATE_HOME := 3, (*constant for the step in which the axis is homed*)
		STATE_READY := 10, (*constant for a waiting step*)
		STATE_STOP := 11, (*constant for the step in which movements are stopped*)
		STATE_MOVE_ABSOLUTE := 14, (*constant for the step in which a movement to defined position is started*)
		STATE_JOG_POSITIVE := 12, (*constant for the step in which a positive jogging movement is executed*)
		STATE_JOG_NEGATIVE := 13, (*constant for the step in which a negative jogging movement is executed*)
		STATE_MOVE_ADDITIVE := 15, (*constant for the step in which a movement with defiened distance is started*)
		STATE_MOVE_VELOCITY := 16, (*constant for the step in which a movement with defined velocity is started*)
		STATE_HALT := 17, (*constant for the step in which movements are stopped*)
		STATE_ERROR_AXIS := 100, (*constant for the axis error step*)
		STATE_ERROR := 101, (*constant for the error step*)
		STATE_ERROR_RESET := 102 (*constant for the step in which the errors are reset*)
		);
	Axis_typ : 	STRUCT 
		CheckPosition : REAL; (*Absolute move start position*)
		Error : BOOL; (*Axis error*)
		OriginSet : BOOL; (*Origin search complete*)
		Reset : BOOL; (*Reset after error*)
		SeekFin : BOOL; (*Seek and find complete*)
		Seek1 : BOOL; (*Start seek and find*)
		Seek1Disp : USINT; (*Runtime control*)
		Seek2 : BOOL; (*Restart seek and find*)
		Count : USINT; (*Seek and find completion count*)
		Measure : REAL; (*Final stop position*)
		Pattern : PATTERN_enum; (*Seek and find case control*)
		ResetEnable : Status_enum := HIDE; (*Enable reset button for Visu*)
		Sensors : USINT; (*Seek and find sensor array status*)
		Text : USINT; (*Seek and find status*)
		Max : Limit_typ; (*Maximum limits*)
		Min : Limit_typ; (*Minimum limits*)
		Block : BOOL; (*Block axis movement*)
		Blocks : ARRAY[0..12]OF BOOL; (*Block conditions*)
		HiVol : BOOL; (*High Volume Latch*)
		RaiseArms : BOOL; (*On only when arms to be raised*)
		Active : BOOL; (*On only when seek and find to be active*)
		Seek2Runtime : USINT; (*Runtime control for manual seek and find*)
		MovetoPosition : REAL; (*Optimisation position to move to*)
		StartCheck : BOOL; (*Check Move Started*)
		Node : STRING[49]; (*Module address for motion limits*)
	END_STRUCT;
	basic_axisState_typ : 	STRUCT  (*axis state structure*)
		Disabled : BOOL; (*if set, axis is in state Disabled*)
		StandStill : BOOL; (*if set, axis is in state StandsStill*)
		Homing : BOOL; (*if set, axis is in state Homing*)
		Stopping : BOOL; (*if set, axis is in state Stopping*)
		DiscreteMotion : BOOL; (*if set, axis is in state DiscreteMotion*)
		ContinuousMotion : BOOL; (*if set, axis is in state ContinousMotion*)
		SynchronizedMotion : BOOL; (*if set, axis is in state SynchronizedMotion*)
		ErrorStop : BOOL; (*if set, axis is in state ErrorStop*)
	END_STRUCT;
	basic_command_typ : 	STRUCT  (*command structure*)
		Obj : UDINT; (*axis reference*)
		Step : AXIS_STATE_enum; (*current step in the step sequence*)
		Power : BOOL; (*switch on the controller*)
		Home : BOOL; (*reference the axis*)
		MoveAbsolute : BOOL; (*move to an defined position*)
		MoveAdditive : BOOL; (*move a defiened distance*)
		MoveVelocity : BOOL; (*start a movement with a defiened velocity*)
		Halt : BOOL; (*stop every active movement*)
		Stop : BOOL; (*stop every active movement as long as is set*)
		MoveJogPos : BOOL; (*move in positive direction as long as is set*)
		MoveJogNeg : BOOL; (*move in negative direction as long as is set*)
		ErrorAcknowledge : BOOL; (*reset active errors*)
	END_STRUCT;
	basic_parameter_typ : 	STRUCT  (*parameter structure*)
		Position : REAL; (*target-position for MoveAbsolute-Command*)
		Distance : REAL; (*distance for MoveAdditive-Command*)
		Velocity : REAL; (*velocity for MoveVelocity-Command*)
		Direction : USINT; (*direction for commanded movements*)
		Acceleration : REAL; (*acceleration for commanded movements*)
		Deceleration : REAL; (*deceleration for commanded movements*)
		HomePosition : REAL; (*target-position for referencing the axis*)
		HomeMode : USINT; (*homing mode*)
		JogVelocity : REAL; (*velocity for jogging movement*)
	END_STRUCT;
	basic_status_typ : 	STRUCT  (*status structure*)
		ErrorID : UINT; (*ErrorID of any occured error*)
		ErrorText : ARRAY[0..3]OF STRING[79]; (*Error Text*)
		ActPosition : REAL; (*actual position of the axis*)
		ActVelocity : REAL; (*actual velocity of the axis*)
		DriveStatus : MC_DRIVESTATUS_TYP; (*actual status of the axis*)
	END_STRUCT;
	basic_typ : 	STRUCT  (*control structure*)
		Command : basic_command_typ; (*command structure*)
		Parameter : basic_parameter_typ; (*parameter structure*)
		Status : basic_status_typ; (*status structure*)
		AxisState : basic_axisState_typ; (*axis state structure*)
	END_STRUCT;
	BeltClear_typ : 	STRUCT 
		NonProcess1 : BOOL; (*Non additional process belt 1*)
		NonProcess2 : BOOL; (*Non additional process belt 2*)
		Process1 : BOOL; (*Additional process belt 1*)
		Process2 : BOOL; (*Additional process belt 2*)
		Start : BOOL; (*Start latch*)
		Done : BOOL; (*Clear of Belts*)
	END_STRUCT;
	DataFlow_typ : 	STRUCT 
		IndexRow : USINT;
		IndexLoad : USINT;
	END_STRUCT;
	EMO_typ : 	STRUCT 
		Confirm : ARRAY[0..4]OF BOOL; (*Visu control*)
		Disp : ARRAY[0..4]OF Status_enum; (*Visu control*)
		Latch1 : BOOL; (*Latch to block conveyor movement*)
		Latch2 : BOOL; (*Latch to block conveyor movement*)
		Latch3 : BOOL; (*Latch to block conveyor movement*)
		Latch4 : BOOL; (*Latch to block conveyor movement*)
		LatchTON1 : TON; (*EMO finish delay timer*)
		LatchTON2 : TON; (*EMO finish delay timer*)
		LatchTON3 : TON; (*EMO finish delay timer*)
		LatchTON4 : TON; (*EMO finish delay timer*)
		Recovery : BOOL; (*During recovery sequence*)
		Start : TON; (*EMO start delay timer*)
		StartLatch : BOOL; (*Latch condition after EMO*)
	END_STRUCT;
	EPLState_typ : 	STRUCT 
		LinkOK : BOOL;
		CycleOK : BOOL;
		SyncOK : BOOL;
	END_STRUCT;
	Filstar_typ : 	STRUCT 
		Out : BOOL; (*Valve output*)
		Open : TON; (*Valve open delay*)
		Interval : TON; (*Interval delay*)
	END_STRUCT;
	GrindDisp_typ : 	STRUCT 
		ShiftDisp : Status_enum; (*Visu control*)
		TotalDisp : Status_enum; (*Visu control*)
	END_STRUCT;
	Grind_typ : 	STRUCT 
		ShiftMs : UINT; (*Milliseconds ground 0-999*)
		ShiftSec : UINT; (*Seconds ground 0-59*)
		ShiftMin : UINT; (*Minutes ground 0-59*)
		ShiftHr : UINT; (*Hours ground 0-23*)
		ShiftDay : UINT; (*Days ground*)
		ShiftFtLow : UDINT; (*Length ground feet lower 9 digits*)
		ShiftFtUpp : UDINT; (*Length ground feet upper 9 digits*)
		ShiftMLow : UDINT; (*Length ground metres lower 9 digits*)
		ShiftMUpp : UDINT; (*Length ground metres upper 9 digits*)
		TotalMs : UINT; (*Milliseconds ground 0-999*)
		TotalSec : UINT; (*Seconds ground 0-59*)
		TotalMin : UINT; (*Minutes ground 0-59*)
		TotalHr : UINT; (*Hours ground 0-23*)
		TotalDay : UINT; (*Days ground*)
		TotalFtLow : UDINT; (*Length ground feet lower 9 digits*)
		TotalFtUpp : UDINT; (*Length ground feet upper 9 digits*)
		TotalMLow : UDINT; (*Length ground metres lower 9 digits*)
		TotalMUpp : UDINT; (*Length ground metres upper 9 digits*)
	END_STRUCT;
	Input_typ : 	STRUCT 
		In : BOOL; (*Input bit*)
		Int : BOOL; (*Internal bit*)
		Latch : BOOL; (*Latch for start of track steps where sensor not present*)
		BlockDisp : Status_enum; (*Display warning when blocking following glass*)
	END_STRUCT;
	InvPerms_typ : 	STRUCT 
		CL1 : InvPerm_typ; (*Inverter saved parameters*)
		CS1 : InvPerm_typ; (*Inverter saved parameters*)
		CV1 : InvPerm_typ; (*Inverter saved parameters*)
		CC1 : InvPerm_typ; (*Inverter saved parameters*)
		CC2 : InvPerm_typ; (*Inverter saved parameters*)
		CS2 : InvPerm_typ; (*Inverter saved parameters*)
		CV2 : InvPerm_typ; (*Inverter saved parameters*)
		CC3 : InvPerm_typ; (*Inverter saved parameters*)
		CC4 : InvPerm_typ; (*Inverter saved parameters*)
		CB1 : InvPerm_typ; (*Inverter saved parameters*)
		CB2 : InvPerm_typ; (*Inverter saved parameters*)
		CRB : InvPerm_typ; (*Inverter saved parameters*)
		CRE : InvPerm_typ; (*Inverter saved parameters*)
		CLB : InvPerm_typ; (*Inverter saved parameters*)
		SetValues : BOOL;
	END_STRUCT;
	InvPerm_typ : 	STRUCT 
		Accel : UINT; (*Value for ACC, Acceleration*)
		Decel : UINT; (*Value for DEC, Deceleration*)
		Analog : FB_ANALOG_enum; (*Analog type selection*)
	END_STRUCT;
	LegTest_enum : 
		(
		TEST_OFF := 0,
		TEST_ON_STOP := 1,
		TEST_LEG1 := 2,
		TEST_LEG2 := 3,
		TEST_LEG3 := 4,
		TEST_LEG4 := 5
		);
	LegTest_typ : 	STRUCT 
		Disp : Status_enum := HIDE; (*Runtime control*)
		Index : LegTest_enum := TEST_OFF; (*Case Index*)
	END_STRUCT;
	Limit_typ : 	STRUCT 
		UppO : REAL; (*Upper limit for visu input*)
		UppF : REAL; (*Upper limit for visu input*)
		Upp : REAL; (*Upper limit for visu input*)
		LowO : REAL; (*Lower limit for visu input*)
		LowF : REAL; (*Lower limit for visu input*)
		Low : REAL; (*Lower limit for visu input*)
	END_STRUCT;
	LoadPerm_typ : 	STRUCT 
		FurnClear : UDINT; (*Type of Furnace clear signal, Pulse or On.*)
		Max : REAL; (*Maximum batch length*)
		Gap : REAL; (*Actual gap*)
		ClearPT : UDINT; (*Preset time for manual batch clear*)
	END_STRUCT;
	Machine : 	STRUCT 
		ErrorText : ARRAY[0..3]OF STRING[79];
		ErrorID : UINT;
		ErrorAcknowledge : BOOL;
		JogNegative : BOOL;
		JogPositive : BOOL;
		Stop : BOOL;
		Start : BOOL;
		MasterStop : BOOL;
		Mode : BOOL;
		Power : BOOL;
	END_STRUCT;
	Mode_typ : 	STRUCT 
		Count : TrackCount; (*Count tracking bits*)
		Clear1 : TON; (*Delay before clear*)
		Clear2 : TON; (*Delay before clear*)
		Clear : BOOL; (*EMO Clear*)
		Input1 : BOOL; (*Mode selection*)
		Input2 : BOOL; (*Mode selection*)
		Input3 : BOOL; (*Mode selection*)
		Input4 : BOOL; (*Mode selection*)
		Active : BOOL; (*Mode active*)
		Clearing : BOOL; (*Mode clearing*)
		ESDisp : USINT; (*Visu display control*)
		Disp : Status_enum := HIDE; (*Visu display control*)
		Selected : BOOL; (*Mode selected but not active.*)
		Blocked : BOOL; (*Block preceding systems*)
	END_STRUCT;
	Output_typ : 	STRUCT 
		Auto : BOOL; (*Output during auto operation*)
		Test : BOOL; (*Output during test operation*)
		Trip : BOOL; (*Linked trip input*)
		PalUp : BOOL; (*Pallet Up at EStop*)
		PalDown : BOOL; (*Pallet Down at EStop*)
	END_STRUCT;
	PATTERN_enum : 
		(
		READY := 0, (*Ready to start Search Pattern*)
		FAST_REV := 1, (*Fast Reverse Search Pattern*)
		SLOW_REV := 2, (*Slow Reverse Search Pattern*)
		CHECK := 3, (*Verify Stop Position Search Pattern*)
		SLOW_FWD := 4, (*Slow Forward Search Pattern*)
		FAST_FWD := 5 (*Fast Forward Search Pattern*)
		);
	PermSys_typ : 	STRUCT 
		PasswordDefault : BOOL; (*Reset passwords to default*)
		Password : ARRAY[0..3]OF STRING[4]; (*Password storage*)
	END_STRUCT;
	Perms_typ : 	STRUCT 
		FurnReady : USINT;
		HiVolume : STATE_enum;
		VersionText : STRING[30]; (*Version Text*)
		FLIPARMS1 : SINT; (*Seamer 1 No of Flip Up arms*)
		FLIPARMS2 : SINT; (*Seamer 2 No of Flip Up arms*)
	END_STRUCT;
	PLInvOut_typ : 	STRUCT 
		Fast : ARRAY[0..5]OF BOOL := [6(FALSE)]; (*Multiple start conditions ??Is this needed. Just change speed reference*)
		Run : ARRAY[0..5]OF BOOL := [6(FALSE)]; (*Multiple start conditions*)
		Rev : ARRAY[0..5]OF BOOL := [6(FALSE)]; (*Multiple start conditions*)
		Slow : ARRAY[0..5]OF BOOL := [6(FALSE)]; (*Multiple start conditions ??Is this needed. Just change speed reference*)
		Blower : BOOL := FALSE; (*Overblower*)
		SpeedRef : REAL; (*Speed Reference (Hz)*)
	END_STRUCT;
	PLInvScale_typ : 	STRUCT 
		CL1Scale : REAL; (*Speed scaling CL1*)
		CS1Scale : REAL; (*Speed scaling CS1*)
		CV1Scale : REAL; (*Speed scaling CV1*)
		CC1Scale : REAL; (*Speed scaling CC1*)
		CC2Scale : REAL; (*Speed scaling CC2*)
		CS2Scale : REAL; (*Speed scaling CS2*)
		CV2Scale : REAL; (*Speed scaling CV2*)
		CC3Scale : REAL; (*Speed scaling CC3*)
		CC4Scale : REAL; (*Speed scaling CC4*)
		CB1Scale : REAL; (*Speed scaling CB1*)
		CB2Scale : REAL; (*Speed scaling CB2*)
		CRBScale : REAL; (*Speed scaling CRB*)
		CREScale : REAL; (*Speed scaling CRE*)
		CLBScale : REAL; (*Speed scaling CLB*)
	END_STRUCT;
	PLINV_In_typ : 	STRUCT 
		ETAD_00 : BOOL; (*Status parameter (1 = Ready to switch on, awaiting power section line supply)*)
		ETAD_01 : BOOL; (*Status parameter (1 = Switched on, ready)*)
		ETAD_02 : BOOL; (*Status parameter (1 = Operation enabled, running)*)
		Fault : BOOL; (*Status parameter (1 = Fault detection) ETAD_03*)
		ETAD_04 : BOOL; (*Status parameter (1= Voltage enabled, power section line supply present)*)
		ETAD_05 : BOOL; (*Status parameter (0 = Quick stop, emergency stop)*)
		ETAD_06 : BOOL; (*Status parameter (1 = Switch on disabled, power section line supply disabled)*)
		ETAD_07 : BOOL; (*Status parameter (1 = Warning, alarm)*)
		ETAD_09 : BOOL; (*Status parameter (0 = Command or reference via terminals; 1 = Command or reference via network)*)
		ETAD_10 : BOOL; (*Status parameter (1 = Target reached, reference reached)*)
		ETAD_11 : BOOL; (*Status parameter (1 = Internal limit active, reference outside limits)*)
		ETAD_14 : BOOL; (*Status parameter (1 = STOP via stop key)*)
		ETAD_15 : BOOL; (*Status parameter (Direction of rotation 0 = Forward rotation; 1 = Reverse rotation)*)
		HMIS : UINT; (*Drive state*)
		ETI_00 : BOOL; (*Extended status word (1 = Access to the EEPROM non-volatile memory in progress)*)
		ETI_01 : BOOL; (*Extended status word (0 = No parameter consistency check; 1 = Parameter consistency check)*)
		ETI_02 : BOOL; (*Extended status word (0 = The drive is not in fault state or a fault is detected; 1 = The drive is in fault state but the fault is no longer present (not reset))*)
		ETI_04 : BOOL; (*Extended status word (1 = The drive is in speed mode)*)
		ETI_05 : BOOL; (*Extended status word (1 = DC injection)*)
		ETI_06 : BOOL; (*Extended status word (0 = Drive in steady state; 1 = Drive in transient state)*)
		ETI_07 : BOOL; (*Extended status word (1 = Motor thermal state threshold reached for the active motor)*)
		ETI_08 : BOOL; (*Extended status word (1 = Overbraking)*)
		ETI_09 : BOOL; (*Extended status word (1 = Acceleration in progress)*)
		ETI_10 : BOOL; (*Extended status word (1 = Deceleration in progress)*)
		ETI_11 : BOOL; (*Extended status word (1 = Current limit in progress)*)
		ETI_12 : BOOL; (*Extended status word (1 = Fast stop in progress)*)
		ETI_13 : BOOL; (*Extended status word (bit 13 = 0 and bit 14 = 0 : Drive controled by terminal or local keypad; bit 13 = 1 and bit 14 = 0 : Drive controled by remote keypad; bit 13 = 0 and bit 14 = 1 : Drive controled by Modbus; bit 13 = 1 and bit 14 = 1 : Reserved)*)
		ETI_14 : BOOL; (*Extended status word (bit 13 = 0 and bit 14 = 0 : Drive controled by terminal or local keypad; bit 13 = 1 and bit 14 = 0 : Drive controled by remote keypad; bit 13 = 0 and bit 14 = 1 : Drive controled by Modbus; bit 13 = 1 and bit 14 = 1 : Reserved)*)
		ETI_15 : BOOL; (*Extended status word (0 = Forward operation applied before the ramp; 1 = Reverse operation applied before the ramp)*)
		RFR : INT; (*Output frequency [Hz] (Range depends on CMI_Output_Bool_09)*)
		OTR : INT; (*Motor torque (with filter) [0.1 %]*)
		LCR : UINT; (*Motor current (with filter) [0.1 A]*)
		THD : UINT; (*Drive thermal state [%]*)
		THR : UINT; (*Motor thermal state [%]*)
		ULN : UINT; (*Mains voltage [0.1 V]*)
		UOP : UINT; (*Motor voltage [1 V]*)
		IL1R_00 : BOOL; (*Logic input state (Value of LI1)*)
		IL1R_01 : BOOL; (*Logic input state (Value of LI2)*)
		IL1R_02 : BOOL; (*Logic input state (Value of LI3)*)
		IL1R_03 : BOOL; (*Logic input state (Value of LI4)*)
		IL1R_04 : BOOL; (*Logic input state (Value of LI5)*)
		IL1R_05 : BOOL; (*Logic input state (Value of LI6)*)
		OL1R_01 : BOOL; (*Relay 01 state*)
		OL1R_02 : BOOL; (*Relay 02 state*)
		OL1R_09 : BOOL; (*Logic output state*)
		AI1R : INT; (*Analog input 1 standardized value (+/- 8192)*)
		AI2R : INT; (*Analog input 2 standardized value (0 to 8192)*)
		AI3R : INT; (*Analog input 3 standardized value (0 to 8192)*)
		ERRD : UINT; (*CiA402 fault code*)
		LFT : INT; (*Last detected fault*)
		FNB : UINT; (*Fault counter*)
		STOS : UINT; (*STO status*)
		SLSS : UINT; (*SLS status*)
		SS1S : UINT; (*SS1 status*)
	END_STRUCT;
	PLINV_Out_typ : 	STRUCT 
		CMDD_00 : BOOL; (*Control word (1 = Switch on)*)
		CMDD_01 : BOOL; (*Control word (0 = Disable voltage)*)
		CMDD_02 : BOOL; (*Control word (0 = Quick stop/Emergency stop)*)
		CMDD_03 : BOOL; (*Control word (1 = Enable operation/Run command)*)
		CMDD_07 : BOOL; (*Control word (Fault reset/Fault acknowledgment active on 0 -> 1 rising edge)*)
		CMDD_08 : BOOL; (*Control word (0 = RUN asked; 1 = STOP asked)*)
		CMDD_11 : BOOL; (*Control word (Direction of rotation 0 = Forward rotation; 1 = Reverse rotation)*)
		CMDD_12 : BOOL; (*Can be assigned to a command*)
		CMDD_13 : BOOL; (*Can be assigned to a command*)
		CMDD_14 : BOOL; (*Can be assigned to a command*)
		CMDD_15 : BOOL; (*Can be assigned to a command*)
		CMI_00 : BOOL; (*Extended control word (Factory setting command active at 1)*)
		CMI_01 : BOOL; (*Extended control word (Save configuration to EEPROM non-volatile memory command active at 1)*)
		CMI_02 : BOOL; (*Extended control word (Restore configuration to EEPROM non-volatile memory command active on 0 -> 1 rising edge)*)
		CMI_09 : BOOL; (*Extended control word Definition of the frequency reference (LFr) and output frequency (rFr) unit (0 = 0.1 Hz;  1 = Standardized value 16 signed bits based on the maximum frequency)*)
		CMI_15 : BOOL; (*Extended control word (Parameter consistency check 0 = check is activated; 1 = check is deactivated)*)
		LFR : INT; (*Frequency setpoint [Hz] (Range depends on CMI_Output_Bool_09)*)
		OL1R_01 : BOOL; (*Relay 01*)
		OL1R_02 : BOOL; (*Relay 02*)
		OL1R_09 : BOOL; (*Logic output 01*)
		AO1R : INT; (*Analog output 1 standardized value (0 to 8192)*)
	END_STRUCT;
	PLINV_typ : 	STRUCT 
		Input : PLINV_In_typ; (*Input from Inverter*)
		Output : PLINV_Out_typ; (*Output to Inverter*)
		Inv : PLInv_typ; (*Control*)
		Brake : BOOL; (*Brake Output*)
		Reset : BOOL; (*Confirm reset from HMI*)
		o : PLInvOut_typ; (*Output Values*)
		Module : PLModule_typ; (*Module Information*)
		LastSpeed : REAL := 10.0; (*Last used speed*)
		SpeedAnalog : REAL; (*Speed value generated by analog value*)
	END_STRUCT;
	PLInv_typ : 	STRUCT 
		Reference1 : ARRAY[0..1]OF lcrCurveByPoints_TabEntry_type; (*Frequency conversion reference points*)
		Scale1 : LCRCurveByPoints; (*M/Min to Frequency conversion table.*)
		SpeedTest : REAL := 15.0; (*Test Speed (m/min)*)
		Test : USINT; (*Visu Test Control*)
	END_STRUCT;
	Loads_typ : 	STRUCT 
		Empty : RecordRows_typ;
		AshtonExit : RecordRows_typ;
		Furnace1 : RecordRows_typ;
		Furnace2 : RecordRows_typ;
		Furnace3 : RecordRows_typ;
		Furnace4 : RecordRows_typ;
		Furnace5 : RecordRows_typ;
		Furnace6 : RecordRows_typ;
		Furnace7 : RecordRows_typ;
		Furnace8 : RecordRows_typ;
		Furnace9 : RecordRows_typ;
		FurnaceExit : RecordRows_typ;
	END_STRUCT;
	PLModule_typ : 	STRUCT 
		OK : BOOL; (*Module status (1 = module present)*)
		SerialNumber : UDINT; (*Serial Number*)
		ID : UDINT; (*Module ID*)
		HardwareVariant : UDINT; (*Hardware variant*)
		FirmwareVersion : UDINT; (*Firmware version*)
		ID_ACPi : UDINT; (*PL Module ID*)
		SerialNumber_ACPi : UDINT; (*PL Serial Number*)
	END_STRUCT;
	Preset_typ : 	STRUCT 
		Buzzer : UDINT; (*Buzzer duration*)
		ESRestart : ARRAY[0..4]OF UDINT; (*Seamer conveyor delay during EMO recovery*)
		Filstar : ARRAY[0..2]OF UDINT; (*Filstar delays*)
		Belt : UDINT; (*During Belt auto start*)
		Extraction : UDINT; (*During Extraction auto start*)
		ED : UDINT; (*During ED auto start*)
		Vac : UDINT; (*During Vacuum auto start*)
		Water : ARRAY[0..4]OF UDINT; (*Water Pump delays*)
		Standby : UDINT; (*Before system standby*)
		VacsStop : UDINT; (*Vacuum run on after control stop*)
	END_STRUCT;
	Process_typ : 	STRUCT 
		ShiftPiece : LREAL; (*Piece count*)
		ShiftMins : UINT; (*Runtime minutes*)
		ShiftHrs : UINT; (*Runtime hours*)
		ShiftDays : UINT; (*Runtime days*)
		ShiftYrs : UINT; (*Runtime years*)
		TotalPiece : LREAL; (*Piece count*)
		TotalMins : UINT; (*Runtime minutes*)
		TotalHrs : UINT; (*Runtime hours*)
		TotalDays : UINT; (*Runtime days*)
		TotalYrs : UINT; (*Runtime years*)
	END_STRUCT;
	Imperialification_typ : 	STRUCT 
		WholeInchREAL : REAL;
		WholeInch : INT;
		Remainder : REAL;
		SixteenthStr : STRING[6];
		Sixteenth : REAL;
		float_len : UINT;
	END_STRUCT;
	PTCon_typ : 	STRUCT 
		Slow : UDINT; (*Slow before stop or reverse*)
		Start : UDINT; (*Before start*)
		Clear : UDINT; (*Before clear*)
		Rev : UDINT; (*Reverse before stop*)
	END_STRUCT;
	PTSeam_typ : 	STRUCT 
		BeltOn : ARRAY[0..12]OF UDINT; (*Delay before belt solenoid on*)
		BeltOff : ARRAY[0..12]OF UDINT; (*Delay before belt solenoid off*)
	END_STRUCT;
	RecordRows_typ : 	STRUCT 
		Rows : ARRAY[0..15]OF RecordRow_typ;
		NotEmpty : BOOL;
	END_STRUCT;
	RecordRow_typ : 	STRUCT 
		Row : ARRAY[0..12]OF Record_typ;
		NotEmpty : BOOL;
	END_STRUCT;
	Record_typ : 	STRUCT 
		Width : REAL;
		Length : REAL;
	END_STRUCT;
	Reset_typ : 	STRUCT 
		Grind : BOOL; (*Shift grind reset*)
		Time : BOOL; (*Shift time reset*)
		Count : BOOL; (*Shift count reset*)
		Total : BOOL; (*Total reset*)
	END_STRUCT;
	RowPerm_typ : 	STRUCT 
		CenterDist : REAL; (*Centering distance*)
		CenterSpeed : REAL; (*Centering speed*)
		Max : REAL; (*Maximum row size*)
		Gap : REAL; (*Actual gap*)
	END_STRUCT;
	Rows_typ : 	STRUCT 
		Empty : RecordRow_typ;
		Tracking30 : RecordRow_typ;
		Tracking40 : RecordRow_typ;
		Tracking41 : RecordRow_typ;
		Tracking50 : RecordRow_typ;
	END_STRUCT;
	Seamer_typ : 	STRUCT 
		Stop1 : BOOL; (*Initiate Belt Off Delays Seamer 1*)
		Stop2 : BOOL; (*Initiate Belt Off Delays Seamer 2*)
		Start1 : BOOL; (*Initiate Belt On Delays Seamer 1*)
		Start2 : BOOL; (*Initiate Belt On Delays Seamer 2*)
	END_STRUCT;
	Simulation_typ : 	STRUCT 
		On : BOOL; (*Simulation ON*)
		Disp : Status_enum := HIDE; (*Display for visu*)
	END_STRUCT;
	Warnings_typ : 	STRUCT 
		AckDisp : Status_enum := HIDE; (*Display acknowledge warning*)
		Ack : BOOL; (*Acknowledge warning from visu*)
		Block : BOOL; (*Disable warnings*)
		Button : Status_enum := HIDE; (*Display warning button*)
		Delay : ARRAY[0..50]OF TON; (*Delays for timeouts*)
		Timeout : ARRAY[0..50]OF BOOL; (*Timeout active*)
		Acks : ARRAY[0..50]OF BOOL; (*Timeout not acknowledged*)
		Warningi : USINT; (*Array index*)
		i : USINT; (*Array index*)
		BlockTemp : BOOL; (*On at EMO.Latch**)
		iMax : USINT := 50; (*Array Index Max value*)
	END_STRUCT;
	STATE_enum : 
		(
		OFF := 0,
		ON := 1,
		NO := 2,
		YES := 3
		);
	Status_enum : 
		(
		SHOW := 0, (*Control visible with input enabled*)
		HIDE := 1, (*Control hidden*)
		LOCK := 2 (*Control visible with input disabled*)
		);
	TempSys_typ : 	STRUCT 
		Alarm : BOOL; (*Configured alarm on*)
		Alarms : ARRAY[0..80]OF BOOL; (*Active alarms*)
		Alarmi : USINT; (*Array index*)
		Events : ARRAY[0..99]OF BOOL; (*Events*)
		Warning : BOOL; (*Configured warning on*)
		Warningi : USINT; (*Array index*)
	END_STRUCT;
	TrackDelayPT_typ : 	STRUCT 
		PTTrack001 : UDINT; (*Track Delay preset*)
		PTTrack002 : UDINT; (*Track Delay preset*)
		PTTrack003 : UDINT; (*Track Delay preset*)
		PTTrack004 : UDINT; (*Track Delay preset*)
		PTTrack005 : UDINT; (*Track Delay preset*)
		PTTrack901 : UDINT; (*Track Delay preset*)
		PTTrack011 : UDINT; (*Track Delay preset*)
		PTTrack012 : UDINT; (*Track Delay preset*)
		PTTrack013 : UDINT; (*Track Delay preset*)
		PTTrack101 : UDINT; (*Track Delay preset*)
		PTTrack102 : UDINT; (*Track Delay preset*)
		PTTrack103 : UDINT; (*Track Delay preset*)
		PTTrack104 : UDINT; (*Track Delay preset*)
		PTTrack105 : UDINT; (*Track Delay preset*)
		PTTrack106 : UDINT; (*Track Delay preset*)
		PTTrack107 : UDINT; (*Track Delay preset*)
		PTTrack108 : UDINT; (*Track Delay preset*)
		PTTrack911 : UDINT; (*Track Delay preset*)
		PTTrack912 : UDINT; (*Track Delay preset*)
		PTTrack913 : UDINT; (*Track Delay preset*)
		PTTrack111 : UDINT; (*Track Delay preset*)
		PTTrack112 : UDINT; (*Track Delay preset*)
		PTTrack113 : UDINT; (*Track Delay preset*)
		PTTrack114 : UDINT; (*Track Delay preset*)
		PTTrack115 : UDINT; (*Track Delay preset*)
		PTTrack201 : UDINT; (*Track Delay preset*)
		PTTrack202 : UDINT; (*Track Delay preset*)
		PTTrack203 : UDINT; (*Track Delay preset*)
		PTTrack204 : UDINT; (*Track Delay preset*)
		PTTrack205 : UDINT; (*Track Delay preset*)
		PTTrack206 : UDINT; (*Track Delay preset*)
		PTTrack207 : UDINT; (*Track Delay preset*)
		PTTrack208 : UDINT; (*Track Delay preset*)
		PTTrack921 : UDINT; (*Track Delay preset*)
		PTTrack922 : UDINT; (*Track Delay preset*)
		PTTrack301 : UDINT; (*Track Delay preset*)
		PTTrack302 : UDINT; (*Track Delay preset*)
		PTTrack931 : UDINT; (*Track Delay preset*)
		PTTrack932 : UDINT; (*Track Delay preset*)
		PTTrack401 : UDINT; (*Track Delay preset*)
		PTTrack402 : UDINT; (*Track Delay preset*)
		PTTrack411 : UDINT; (*Track Delay preset*)
		PTTrack412 : UDINT; (*Track Delay preset*)
		PTTrack413 : UDINT; (*Track Delay preset*)
		PTTrack414 : UDINT; (*Track Delay preset*)
		PTTrack501 : UDINT; (*Track Delay preset*)
		PTTrack502 : UDINT; (*Track Delay preset*)
		PTTrack503 : UDINT; (*Track Delay preset*)
		PTTrack504 : UDINT; (*Track Delay preset*)
		PTTrack505 : UDINT; (*Track Delay preset*)
		PTTrack506 : UDINT; (*Track Delay preset*)
		PTTrack507 : UDINT; (*Track Delay preset*)
		PTTrack601 : UDINT; (*Track Delay preset*)
		PTTrack602 : UDINT; (*Track Delay preset*)
		PTTrack603 : UDINT; (*Track Delay preset*)
		PTTrack701 : UDINT; (*Track Delay preset*)
		PTTrack801 : UDINT; (*Track Delay preset*)
		PTTrack802 : UDINT; (*Track Delay preset*)
		PTTrack803 : UDINT; (*Track Delay preset*)
		PTTrack804 : UDINT; (*Track Delay preset*)
		PTTrack805 : UDINT; (*Track Delay preset*)
		PTTrack811 : UDINT; (*Track Delay preset*)
		PTTrack812 : UDINT; (*Track Delay preset*)
		PTTrack821 : UDINT; (*Track Delay preset*)
		PTTrack822 : UDINT; (*Track Delay preset*)
	END_STRUCT;
	VisFlip_typ : 	STRUCT 
		Runtime2 : Status_enum := HIDE; (*Runtime display*)
		Runtime4 : Status_enum := HIDE; (*Runtime display*)
		Runtime5 : Status_enum := HIDE; (*Runtime display*)
		Runtime7 : Status_enum := HIDE; (*Runtime display*)
		Runtime9 : Status_enum := HIDE; (*Runtime display*)
		Runtime10 : Status_enum := HIDE; (*Runtime display*)
		Runtime8 : Status_enum := HIDE; (*Runtime display*)
		Runtime6 : Status_enum := HIDE; (*Runtime display*)
		Runtime3 : Status_enum := HIDE; (*Runtime display*)
		Runtime1 : Status_enum := HIDE; (*Runtime display*)
		TextIndex2 : USINT; (*Text Index*)
		TextIndex3 : USINT; (*Text Index*)
		TextIndex4 : USINT; (*Text Index*)
		TextIndex5 : USINT; (*Text Index*)
		TextIndex6 : USINT; (*Text Index*)
		TextIndex7 : USINT; (*Text Index*)
		TextIndex9 : USINT; (*Text Index*)
		TextIndex10 : USINT; (*Text Index*)
		TextIndex11 : USINT; (*Text Index*)
		TextIndex12 : USINT; (*Text Index*)
		TextIndex13 : USINT; (*Text Index*)
		TextIndex14 : USINT; (*Text Index*)
		TextIndex15 : USINT; (*Text Index*)
		TextIndex17 : USINT; (*Text Index*)
		TextIndex18 : USINT; (*Text Index*)
		TextIndex19 : USINT; (*Text Index*)
		TextIndex20 : USINT; (*Text Index*)
		TextIndex16 : USINT; (*Text Index*)
		TextIndex8 : USINT; (*Text Index*)
		TextIndex1 : USINT; (*Text Index*)
		WarnTON1 : TON; (*Warning Delays*)
		WarnTON0 : TON; (*Warning Delays*)
	END_STRUCT;
	VisuControl_enum : 
		(
		UNSELECTED := 0,
		SELECTED := 1,
		FOCUS := 4
		);
	X2XModule_typ : 	STRUCT 
		OK : BOOL; (*Module status (1 = module present)*)
		SerialNumber : UDINT; (*Serial Number*)
		ID : UINT; (*Module ID*)
		HardwareVariant : UINT; (*Hardware variant*)
		FirmwareVersion : UINT; (*Firmware version*)
		Fuse : BOOL; (*Fuse Status (0 = OK)*)
	END_STRUCT;
	X2X_typ : 	STRUCT 
		P1 : BOOL;
		P2 : BOOL;
		P3 : BOOL;
		P4 : BOOL;
		P5 : BOOL;
		P6 : BOOL;
		P7 : BOOL;
		P8 : BOOL;
		P9 : BOOL;
		P10 : BOOL;
		P11 : BOOL;
		P12 : BOOL;
		P13 : BOOL;
		P14 : BOOL;
		P15 : BOOL;
		P16 : BOOL;
	END_STRUCT;
END_TYPE

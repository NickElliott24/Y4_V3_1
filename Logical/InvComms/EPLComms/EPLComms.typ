(********************************************************************
 * COPYRIGHT --
 ********************************************************************
 * Program: EPLComms
 * File: EPLComms.typ
 * Author: Bernecker + Rainer

 * Created: June 05, 2015
 ********************************************************************
 * Local data types of program epl
 ********************************************************************)

TYPE
	EPL_typ : 	STRUCT  (*Datatype for AsEPL Library*)
		Param : EPLParam_typ; (*Variable with Parameters*)
		FUB : EPLFUB_typ; (*Variable with Function Blocks*)
		State : EPLState_enum; (*State machine control variable*)
		INV : INVName_typ; (*Inverter Names*)
		ErrorCode : UDINT;
		Status : UDINT;
		Errorcount : USINT;
	END_STRUCT;
	EPLParam_typ : 	STRUCT  (*Datatype with parameters*)
		WriteData : UINT; (*Data to be written*)
	END_STRUCT;
	EPLFUB_typ : 	STRUCT  (*datatype with Function Blocks*)
		EPLWrite_0 : EplSDOWrite; (*FUB to write a node's object entries*)
	END_STRUCT;
	INVName_typ : 	STRUCT 
		ACC : ARRAY[0..24]OF BOOL;
		ACCIndex : USINT;
		DEC : ARRAY[0..24]OF BOOL;
		DECIndex : USINT;
	END_STRUCT;
	EPLState_enum : 
		(
		EPL_START := 0, (*State after system reboot*)
		EPL_INV1_ACCCHECK := 10, (*State to check if Acceleration ramp is changed*)
		EPL_INV1_ACCWRITE := 11, (*State to write Acceleration ramp*)
		EPL_INV1_DECCHECK := 12, (*State to check if Deceleration ramp is changed*)
		EPL_INV1_DECWRITE := 13, (*State to write Deceleration ramp*)
		EPL_INV2_ACCCHECK := 20, (*State to check if Acceleration ramp is changed*)
		EPL_INV2_ACCWRITE := 21, (*State to write Acceleration ramp*)
		EPL_INV2_DECCHECK := 22, (*State to check if Deceleration ramp is changed*)
		EPL_INV2_DECWRITE := 23, (*State to write Deceleration ramp*)
		EPL_INV3_ACCCHECK := 30, (*State to check if Acceleration ramp is changed*)
		EPL_INV3_ACCWRITE := 31, (*State to write Acceleration ramp*)
		EPL_INV3_DECCHECK := 32, (*State to check if Deceleration ramp is changed*)
		EPL_INV3_DECWRITE := 33, (*State to write Deceleration ramp*)
		EPL_INV4_ACCCHECK := 40, (*State to check if Acceleration ramp is changed*)
		EPL_INV4_ACCWRITE := 41, (*State to write Acceleration ramp*)
		EPL_INV4_DECCHECK := 42, (*State to check if Deceleration ramp is changed*)
		EPL_INV4_DECWRITE := 43, (*State to write Deceleration ramp*)
		EPL_INV5_ACCCHECK := 50, (*State to check if Acceleration ramp is changed*)
		EPL_INV5_ACCWRITE := 51, (*State to write Acceleration ramp*)
		EPL_INV5_DECCHECK := 52, (*State to check if Deceleration ramp is changed*)
		EPL_INV5_DECWRITE := 53, (*State to write Deceleration ramp*)
		EPL_INV6_ACCCHECK := 60, (*State to check if Acceleration ramp is changed*)
		EPL_INV6_ACCWRITE := 61, (*State to write Acceleration ramp*)
		EPL_INV6_DECCHECK := 62, (*State to check if Deceleration ramp is changed*)
		EPL_INV6_DECWRITE := 63, (*State to write Deceleration ramp*)
		EPL_INV7_ACCCHECK := 70, (*State to check if Acceleration ramp is changed*)
		EPL_INV7_ACCWRITE := 71, (*State to write Acceleration ramp*)
		EPL_INV7_DECCHECK := 72, (*State to check if Deceleration ramp is changed*)
		EPL_INV7_DECWRITE := 73, (*State to write Deceleration ramp*)
		EPL_INV8_ACCCHECK := 80, (*State to check if Acceleration ramp is changed*)
		EPL_INV8_ACCWRITE := 81, (*State to write Acceleration ramp*)
		EPL_INV8_DECCHECK := 82, (*State to check if Deceleration ramp is changed*)
		EPL_INV8_DECWRITE := 83, (*State to write Deceleration ramp*)
		EPL_INV9_ACCCHECK := 90, (*State to check if Acceleration ramp is changed*)
		EPL_INV9_ACCWRITE := 91, (*State to write Acceleration ramp*)
		EPL_INV9_DECCHECK := 92, (*State to check if Deceleration ramp is changed*)
		EPL_INV9_DECWRITE := 93, (*State to write Deceleration ramp*)
		EPL_INV10_ACCCHECK := 100, (*State to check if Acceleration ramp is changed*)
		EPL_INV10_ACCWRITE := 101, (*State to write Acceleration ramp*)
		EPL_INV10_DECCHECK := 102, (*State to check if Deceleration ramp is changed*)
		EPL_INV10_DECWRITE := 103, (*State to write Deceleration ramp*)
		EPL_INV11_ACCCHECK := 110, (*State to check if Acceleration ramp is changed*)
		EPL_INV11_ACCWRITE := 111, (*State to write Acceleration ramp*)
		EPL_INV11_DECCHECK := 112, (*State to check if Deceleration ramp is changed*)
		EPL_INV11_DECWRITE := 113, (*State to write Deceleration ramp*)
		EPL_INV12_ACCCHECK := 120, (*State to check if Acceleration ramp is changed*)
		EPL_INV12_ACCWRITE := 121, (*State to write Acceleration ramp*)
		EPL_INV12_DECCHECK := 122, (*State to check if Deceleration ramp is changed*)
		EPL_INV12_DECWRITE := 123, (*State to write Deceleration ramp*)
		EPL_INV13_ACCCHECK := 130, (*State to check if Acceleration ramp is changed*)
		EPL_INV13_ACCWRITE := 131, (*State to write Acceleration ramp*)
		EPL_INV13_DECCHECK := 132, (*State to check if Deceleration ramp is changed*)
		EPL_INV13_DECWRITE := 133, (*State to write Deceleration ramp*)
		EPL_INV14_ACCCHECK := 140, (*State to check if Acceleration ramp is changed*)
		EPL_INV14_ACCWRITE := 141, (*State to write Acceleration ramp*)
		EPL_INV14_DECCHECK := 142, (*State to check if Deceleration ramp is changed*)
		EPL_INV14_DECWRITE := 143, (*State to write Deceleration ramp*)
		EPL_INV15_ACCCHECK := 150, (*State to check if Acceleration ramp is changed*)
		EPL_INV15_ACCWRITE := 151, (*State to write Acceleration ramp*)
		EPL_INV15_DECCHECK := 152, (*State to check if Deceleration ramp is changed*)
		EPL_INV15_DECWRITE := 153, (*State to write Deceleration ramp*)
		EPL_INV16_ACCCHECK := 160, (*State to check if Acceleration ramp is changed*)
		EPL_INV16_ACCWRITE := 161, (*State to write Acceleration ramp*)
		EPL_INV16_DECCHECK := 162, (*State to check if Deceleration ramp is changed*)
		EPL_INV16_DECWRITE := 163, (*State to write Deceleration ramp*)
		EPL_INV17_ACCCHECK := 170, (*State to check if Acceleration ramp is changed*)
		EPL_INV17_ACCWRITE := 171, (*State to write Acceleration ramp*)
		EPL_INV17_DECCHECK := 172, (*State to check if Deceleration ramp is changed*)
		EPL_INV17_DECWRITE := 173, (*State to write Deceleration ramp*)
		EPL_INV18_ACCCHECK := 180, (*State to check if Acceleration ramp is changed*)
		EPL_INV18_ACCWRITE := 181, (*State to write Acceleration ramp*)
		EPL_INV18_DECCHECK := 182, (*State to check if Deceleration ramp is changed*)
		EPL_INV18_DECWRITE := 183, (*State to write Deceleration ramp*)
		EPL_INV19_ACCCHECK := 190, (*State to check if Acceleration ramp is changed*)
		EPL_INV19_ACCWRITE := 191, (*State to write Acceleration ramp*)
		EPL_INV19_DECCHECK := 192, (*State to check if Deceleration ramp is changed*)
		EPL_INV19_DECWRITE := 193, (*State to write Deceleration ramp*)
		EPL_INV20_ACCCHECK := 200, (*State to check if Acceleration ramp is changed*)
		EPL_INV20_ACCWRITE := 201, (*State to write Acceleration ramp*)
		EPL_INV20_DECCHECK := 202, (*State to check if Deceleration ramp is changed*)
		EPL_INV20_DECWRITE := 203, (*State to write Deceleration ramp*)
		EPL_INV21_ACCCHECK := 210, (*State to check if Acceleration ramp is changed*)
		EPL_INV21_ACCWRITE := 211, (*State to write Acceleration ramp*)
		EPL_INV21_DECCHECK := 212, (*State to check if Deceleration ramp is changed*)
		EPL_INV21_DECWRITE := 213, (*State to write Deceleration ramp*)
		EPL_INV22_ACCCHECK := 220, (*State to check if Acceleration ramp is changed*)
		EPL_WAIT := 240,
		EPL_ERROR := 250
		);
END_TYPE

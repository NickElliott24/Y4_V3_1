FUNCTION_BLOCK AxisAbsMoveConv
	VAR_INPUT
		Axis	:REFERENCE TO ACP10AXIS_typ;
		Enable	:BOOL;
		AxisMoveAbs	:AxisMoveAbs_typ;
	END_VAR
	VAR_OUTPUT
		Velocity	:REAL;
		Acceleration	:REAL;
		Deceleration	:REAL;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AxisHomeStatus
	VAR_INPUT
		Enable	:BOOL;
		Clock	:BOOL;
		AxisCtrl	:REFERENCE TO AxisControlAndStatus_typ;
	END_VAR
	VAR_OUTPUT
		HomeStatus	:UINT;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AxisDriveStatus
	VAR_INPUT
		Axis	:REFERENCE TO ACP10AXIS_typ;
		Enable	:BOOL;
	END_VAR
	VAR_OUTPUT
		RefSw	:BOOL;
		PosSw	:BOOL;
		NegSw	:BOOL;
		Trigger1	:BOOL;
		Trigger2	:BOOL;
		EnableSw	:BOOL;
		HomedOK	:BOOL;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AxisBrakeStatus
	VAR_INPUT
		Enable	:BOOL;
		StatusPV	:UDINT;
	END_VAR
	VAR_OUTPUT
		RelayOn	:BOOL;
		ElectricalOn	:BOOL;
		MechanicalOpen	:BOOL;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AxisClearErrorTxt
	VAR_INPUT
		Enable	:BOOL;
		DataAddress	:UDINT;
	END_VAR
	VAR_OUTPUT
		Done	:BOOL;
		Busy	:BOOL;
		Error	:BOOL;
		ErrorID	:UINT;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AxisFaultStatus
	VAR_INPUT
		Enable	:BOOL;
		Clock	:BOOL;
		AxisCtrl	:REFERENCE TO AxisControlAndStatus_typ;
	END_VAR
	VAR_OUTPUT
		FaultStatus	:UINT;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AxisCfgToAxisObj
	VAR_INPUT
		Axis	:REFERENCE TO ACP10AXIS_typ;
		Execute	:BOOL;
		AxisConfig	:AxisConfig_typ;
	END_VAR
	VAR_OUTPUT
		Done	:BOOL;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AxisObjToAxisCfg
	VAR_INPUT
		Axis	:REFERENCE TO ACP10AXIS_typ;
		Execute	:BOOL;
	END_VAR
	VAR_OUTPUT
		Done	:BOOL;
		AxisConfig	:AxisConfig_typ;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AxisSwitchCfg
	VAR_INPUT
		Axis	:UDINT;
		Execute	:BOOL;
		DeviceName	:STRING[49];
		ChannelName	:STRING[49];
	END_VAR
	VAR_OUTPUT
		Done	:BOOL;
		Busy	:BOOL;
		Error	:BOOL;
		ErrorID	:UINT;
	END_VAR
	VAR
		TempUSINT	:ARRAY[0..19] OF USINT;
		TempUINT	:ARRAY[0..19] OF UINT;
		TempUDINT	:ARRAY[0..19] OF UDINT;
		DataType	:ARRAY[0..19] OF UINT;
		DataAddress	:ARRAY[0..19] OF UDINT;
		ParID	:ARRAY[0..19] OF UINT;
		OffsetCalculated	:BOOL;
		plActionStatus	:UINT;
		BitOffset	:BITOFFSET_typ;
		GetPLOffset_0	:PLACTION_GET_CROSSLINK_INFO_typ;
		ConfigMA3Pos	:CONFIG_MA_CYCLIC_POS_typ;
		MC_BR_WriteParID_0	:MC_BR_WriteParID;
		i	:UINT;
	END_VAR
END_FUNCTION_BLOCK
FUNCTION_BLOCK AxisVelMoveConv
	VAR_INPUT
		Axis	:REFERENCE TO ACP10AXIS_typ;
		Enable	:BOOL;
		AxisMoveVel	:AxisMoveVel_typ;
	END_VAR
	VAR_OUTPUT
		Velocity	:REAL;
		Acceleration	:REAL;
		Deceleration	:REAL;
	END_VAR
END_FUNCTION_BLOCK

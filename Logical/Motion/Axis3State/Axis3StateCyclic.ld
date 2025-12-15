PROGRAM _CYCLIC


































































































































<?xml version="1.0"?>
<?ladder Version = 1.0?>
<!-- Automation Studio Generated XML Section -->
<networks xmlns:dt="urn:schemas-microsoft-com:datatypes" maxcolumn="0">
	<network label="" comment="" row="7" column="0">
		<row><empty/><empty/><empty/><functionblock position="header" name="Axis3StatusBitsCyclicRead" type="MC_BR_InitCyclicRead"/><empty/><empty/></row>
		<row><empty/><empty/><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_BR_InitCyclicRead"><input name="Axis"/><output name="Done"/></functionblock><line/><coil type="reset" name="axis3basic.CyclicReadExecute"/></row>
		<row><contact type="open" name="axis3basic.CyclicReadExecute"/><line/><line/><functionblock position="middle" type="MC_BR_InitCyclicRead"><input name="Execute"/><output name="Busy"/></functionblock><empty or="true"/><coil type="set" name="axis3basic.DigiSetup"/></row>
		<row><empty/><empty/><analog type="input" name="179"/><functionblock position="middle" type="MC_BR_InitCyclicRead"><input name="ParID"/><output name="Error"/></functionblock><empty/><empty/></row>
		<row><analog type="input" name="axis3basic.CyclicBits"/><function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function><functionblock position="middle" type="MC_BR_InitCyclicRead"><input name="DataAddress"/><output name="ErrorID"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><analog type="input" name="ncPAR_TYP_UDINT"/><functionblock position="middle" type="MC_BR_InitCyclicRead"><input name="DataType"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><functionblock position="bottom" type="MC_BR_InitCyclicRead"><input name="Mode"/></functionblock><empty/><empty/></row>
	</network>
	<network label="" comment="" row="5" column="0">
		<row><empty/><functionblock position="header" name="Axis3DigiIPsFromX67" type="AxisSwitchCfg"/><empty/><empty/></row>
		<row><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="AxisSwitchCfg"><input name="Axis"/><output name="Done"/></functionblock><line/><coil type="reset" name="axis3basic.DigiSetup"/></row>
		<row><contact type="open" name="axis3basic.DigiSetup"/><functionblock position="middle" type="AxisSwitchCfg"><input name="Execute"/><output name="Busy"/></functionblock><empty or="true"/><coil type="set" name="axis3basic.OKtoRun"/></row>
		<row><analog type="input" name="Ax3.Node"/><functionblock position="middle" type="AxisSwitchCfg"><input name="DeviceName"/><output name="Error"/></functionblock><empty/><empty/></row>
		<row><analog type="input" name="'DigitalInput01'"/><functionblock position="bottom" type="AxisSwitchCfg"><input name="ChannelName"/><output name="ErrorID"/></functionblock><empty/><empty/></row>
	</network>
	<network label="" comment="Automatic reset of error 6023 'Voltage sag at enable input'" row="3" column="0">
		<row><contact type="closed" name="Control.Achieved"/><function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="axis3basic.ErrorID"/><function position="middle" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function><analog type="output" name="ErrorACKs3[0]"/></row>
		<row><analog type="input" name="6023"/><function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function><empty/></row>
	</network>
	<network label="" comment="" row="3" column="0">
		<row><contact type="open" name="Control.Achieved"/><function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="axis3basic.ErrorID"/><function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function><analog type="output" name="ErrorACKs3[1]"/></row>
		<row><analog type="input" name="29207"/><function position="bottom" type="EQ"><input name="" extensible="true"/></function><empty/></row>
	</network>
	<network label="" comment="" row="3" column="0">
		<row><contact type="open" name="Control.Achieved"/><function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function><empty/></row>
		<row><analog type="input" name="axis3basic.ErrorID"/><function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function><analog type="output" name="ErrorACKs3[2]"/></row>
		<row><analog type="input" name="29209"/><function position="bottom" type="EQ"><input name="" extensible="true"/></function><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="Control.Achieved"/><contact type="open" name="axis3basic.StatusErrorstop"/><coil type="open" name="ErrorACKs3[3]"/></row>
	</network>
	<network label="" comment="" row="5" column="0">
		<row><contact type="open" name="ErrorACKs3[0]"/><coil type="open" name="axis3basic.ErrorAcknowledge"/></row>
		<row><contact type="open" name="ErrorACKs3[1]" or="true"/><empty/></row>
		<row><contact type="open" name="ErrorACKs3[2]" or="true"/><empty/></row>
		<row><contact type="open" name="ErrorACKs3[3]" or="true"/><empty/></row>
		<row><contact type="open" name="ScreenACK3" or="true"/><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="ErrorACKs3[3]"/><coil type="reset" name="axis3basic.StatusErrorstop"/></row>
	</network>
	<network label="" comment="[************************ MC_READAXISERROR **********************]" row="7" column="0">
		<row><empty/><empty/><empty/><empty/><empty/><functionblock position="header" name="MC_ReadAxisError_3" type="MC_ReadAxisError"/><empty/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_ReadAxisError"><input name="Axis"/><output name="Valid"/></functionblock><empty/></row>
		<row><line/><line/><line/><line/><line/><functionblock position="middle" type="MC_ReadAxisError"><input name="Enable"/><output name="Busy"/></functionblock><empty/></row>
		<row><contact type="open" name="axis3basic.ErrorAcknowledge"/><line/><line/><line/><line/><functionblock position="middle" type="MC_ReadAxisError"><input name="Acknowledge"/><output name="Error"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ErrorText"/><function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function><line/><line/><functionblock position="middle" type="MC_ReadAxisError"><input name="DataAddress"/><output name="ErrorID"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ErrorText"/><function position="topbottom" type="SIZEOF"><input name="in"/><output name="7"/></function><function position="topbottom" type="UDINT_TO_UINT"><input name="IN"/><output name="6"/></function><functionblock position="middle" type="MC_ReadAxisError"><input name="DataLength"/><output name="AxisErrorID"/></functionblock><analog type="output" name="axis3basic.ErrorID"/></row>
		<row><empty/><empty/><empty/><empty/><analog type="input" name="'english'"/><functionblock position="bottom" type="MC_ReadAxisError"><input name="DataObjectName"/><output name="AxisErrorCount"/></functionblock><empty/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><analog type="input" name="axis3basic.ErrorID"/><function position="top" type="GT"><input name="IN1" extensible="true"/><output name="1"/></function><coil type="open" name="Ax3.Error"/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="GT"><input name="IN2" extensible="true"/></function><empty/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><contact type="open" name="axis3basic.ErrorAcknowledge"/><coil type="reset" name="axis3basic.ErrorAcknowledge"/></row>
		<row><empty or="true"/><coil type="set" name="Ax3.Reset"/></row>
	</network>
	<network label="" comment="" row="5" column="0">
		<row><empty/><functionblock position="header" name="MC_Reset_3" type="MC_Reset"/><empty/><empty/></row>
		<row><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_Reset"><input name="Axis"/><output name="Done"/></functionblock><line/><coil type="reset" name="Ax3.Reset"/></row>
		<row><contact type="open" name="Ax3.Reset"/><functionblock position="middle" type="MC_Reset"><input name="Execute"/><output name="Busy"/></functionblock><empty or="true"/><coil type="jump" name="AxisError"/></row>
		<row><empty/><functionblock position="middle" type="MC_Reset"><output name="Error"/></functionblock><line or="true"/><empty/></row>
		<row><empty/><functionblock position="bottom" type="MC_Reset"><output name="ErrorID"/></functionblock><empty/><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="axis3basic.ErrorAcknowledge"/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><analog type="input" name="axis3basic.ErrorID"/><function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function><contact type="open" name="axis3basic.Power"/><coil type="open" name="MC_Power_3.Enable"/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function><empty/><empty/></row>
	</network>
	<network label="" comment="[******************** POWER ON **********************]" row="5" column="0">
		<row><empty/><empty/><empty/><functionblock position="header" name="MC_Power_3" type="MC_Power"/><empty/></row>
		<row><empty/><empty/><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_Power"><input name="Axis"/><output name="Status"/></functionblock><empty/></row>
		<row><contact type="open" name="axis3basic.OKtoRun"/><contact type="open" name="axis3basic.Power"/><contact type="closed" name="ErrorACKs3[3]"/><functionblock position="middle" type="MC_Power"><input name="Enable"/><output name="Busy"/></functionblock><empty/></row>
		<row><empty/><empty/><empty/><functionblock position="middle" type="MC_Power"><output name="Error"/></functionblock><coil type="reset" name="axis3basic.Power"/></row>
		<row><empty/><empty/><empty/><functionblock position="bottom" type="MC_Power"><output name="ErrorID"/></functionblock><empty/></row>
	</network>
	<network label="" comment="[******************** HOME **********************]" row="6" column="0">
		<row><empty/><empty/><empty/><functionblock position="header" name="MC_Home_3" type="MC_Home"/><empty/><empty/></row>
		<row><empty/><empty/><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_Home"><input name="Axis"/><output name="Done"/></functionblock><line/><coil type="reset" name="axis3basic.Home"/></row>
		<row><contact type="open" name="MC_Power_3.Status"/><contact type="closed" name="axis3basic.Homed"/><line/><functionblock position="middle" type="MC_Home"><input name="Execute"/><output name="Busy"/></functionblock><empty or="true"/><coil type="set" name="axis3basic.Homed"/></row>
		<row><contact type="open" name="axis3basic.Home"/><line or="true"/><analog type="input" name="axis3basic.ParaHomePosition"/><functionblock position="middle" type="MC_Home"><input name="Position"/><output name="CommandAborted"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><functionblock position="middle" type="MC_Home"><input name="HomingMode"/><output name="Error"/></functionblock><empty/><empty/></row>
		<row><empty/><empty/><empty/><functionblock position="bottom" type="MC_Home"><output name="ErrorID"/></functionblock><empty/><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="axis3basic.Homed"/><contact type="open" name="Control.Achieved"/><coil type="open" name="Ax3.OriginSet"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="Ax3P.Origin"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis3basic.ParaHomePosition"/></row>
	</network>
	<network label="" comment="" row="5" column="0">
		<row><contact type="positive transition" name="Control.EStop"/><contact type="closed" name="axis3basic.StatusStandstill"/><line/><line/><coil type="open" name="axis3basic.Stop"/></row>
		<row><empty or="true"/><contact type="open" name="axis3basic.StatusMotionDiscrete"/><line/><line or="true"/><empty/></row>
		<row><empty or="true"/><function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function><empty or="true"/><empty/></row>
		<row><analog type="input" name="axis3basic.ActVelocity"/><function position="middle" type="NE"><input name="IN1"/><output name="1"/></function><line or="true"/><empty/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="NE"><input name="IN2"/></function><empty/><empty/></row>
	</network>
	<network label="" comment="[*********************** STOP MOVEMENT *************************]" row="6" column="0">
		<row><empty/><empty/><empty/><functionblock position="header" name="MC_Stop_3" type="MC_Stop"/><empty/></row>
		<row><empty/><empty/><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_Stop"><input name="Axis"/><output name="Done"/></functionblock><coil type="reset" name="axis3basic.Stop"/></row>
		<row><contact type="open" name="axis3basic.Stop"/><contact type="open" name="AlwaysON"/><line/><functionblock position="middle" type="MC_Stop"><input name="Execute"/><output name="Busy"/></functionblock><empty/></row>
		<row><contact type="negative transition" name="axis3basic.MoveJogPos"/><line or="true"/><analog type="input" name="15000.0"/><functionblock position="middle" type="MC_Stop"><input name="Deceleration"/><output name="CommandAborted"/></functionblock><empty/></row>
		<row><contact type="negative transition" name="axis3basic.MoveJogNeg"/><line or="true"/><empty/><functionblock position="middle" type="MC_Stop"><output name="Error"/></functionblock><empty/></row>
		<row><empty/><empty/><empty/><functionblock position="bottom" type="MC_Stop"><output name="ErrorID"/></functionblock><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="axis3basic.Stop"/><coil type="reset" name="axis3basic.MoveAbsolute"/></row>
	</network>
	<network label="" comment="[******************** START JOG MOVEMENT POSITIVE **********************]" row="7" column="0">
		<row><empty/><functionblock position="header" name="MC_MoveVelocity_4" type="MC_MoveVelocity"/><empty/></row>
		<row><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_MoveVelocity"><input name="Axis"/><output name="InVelocity"/></functionblock><empty/></row>
		<row><contact type="open" name="axis3basic.MoveJogPos"/><functionblock position="middle" type="MC_MoveVelocity"><input name="Execute"/><output name="Busy"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaJogVelocity"/><functionblock position="middle" type="MC_MoveVelocity"><input name="Velocity"/><output name="CommandAborted"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaAcceleration"/><functionblock position="middle" type="MC_MoveVelocity"><input name="Acceleration"/><output name="Error"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaDeceleration"/><functionblock position="middle" type="MC_MoveVelocity"><input name="Deceleration"/><output name="ErrorID"/></functionblock><empty/></row>
		<row><analog type="input" name="mcPOSITIVE_DIR"/><functionblock position="bottom" type="MC_MoveVelocity"><input name="Direction"/></functionblock><empty/></row>
	</network>
	<network label="" comment="[******************** START JOG MOVEMENT NEGATIVE **********************]" row="7" column="0">
		<row><empty/><functionblock position="header" name="MC_MoveVelocity_5" type="MC_MoveVelocity"/><empty/></row>
		<row><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_MoveVelocity"><input name="Axis"/><output name="InVelocity"/></functionblock><empty/></row>
		<row><contact type="open" name="axis3basic.MoveJogNeg"/><functionblock position="middle" type="MC_MoveVelocity"><input name="Execute"/><output name="Busy"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaJogVelocity"/><functionblock position="middle" type="MC_MoveVelocity"><input name="Velocity"/><output name="CommandAborted"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaAcceleration"/><functionblock position="middle" type="MC_MoveVelocity"><input name="Acceleration"/><output name="Error"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaDeceleration"/><functionblock position="middle" type="MC_MoveVelocity"><input name="Deceleration"/><output name="ErrorID"/></functionblock><empty/></row>
		<row><analog type="input" name="mcNEGATIVE_DIR"/><functionblock position="bottom" type="MC_MoveVelocity"><input name="Direction"/></functionblock><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="axis3basic.MoveAbsolute"/><contact type="positive transition" name="MC_MoveAbsolute_3.Busy"/><coil type="reset" name="axis3basic.MoveAbsolute"/></row>
	</network>
	<network label="" comment="[******************** START ABSOLUTE MOVEMENT **********************]" row="8" column="0">
		<row><empty/><functionblock position="header" name="MC_MoveAbsolute_3" type="MC_MoveAbsolute"/><empty/></row>
		<row><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_MoveAbsolute"><input name="Axis"/><output name="Done"/></functionblock><coil type="reset" name="axis3basic.MoveAbsolute"/></row>
		<row><contact type="open" name="axis3basic.MoveAbsolute"/><functionblock position="middle" type="MC_MoveAbsolute"><input name="Execute"/><output name="Busy"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaPosition"/><functionblock position="middle" type="MC_MoveAbsolute"><input name="Position"/><output name="CommandAborted"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaVelocity"/><functionblock position="middle" type="MC_MoveAbsolute"><input name="Velocity"/><output name="Error"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaAcceleration"/><functionblock position="middle" type="MC_MoveAbsolute"><input name="Acceleration"/><output name="ErrorID"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaDeceleration"/><functionblock position="middle" type="MC_MoveAbsolute"><input name="Deceleration"/></functionblock><empty/></row>
		<row><analog type="input" name="axis3basic.ParaDirection"/><functionblock position="bottom" type="MC_MoveAbsolute"><input name="Direction"/></functionblock><empty/></row>
	</network>
	<network label="" comment="[******************** MC_READSTATUS *************************]" row="13" column="0">
		<row><empty/><functionblock position="header" name="MC_ReadStatus_3" type="MC_ReadStatus"/><empty/></row>
		<row><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_ReadStatus"><input name="Axis"/><output name="Valid"/></functionblock><empty/></row>
		<row><line/><functionblock position="middle" type="MC_ReadStatus"><input name="Enable"/><output name="Busy"/></functionblock><empty/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadStatus"><output name="Error"/></functionblock><empty/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadStatus"><output name="ErrorID"/></functionblock><empty/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadStatus"><output name="Errorstop"/></functionblock><coil type="open" name="axis3basic.StatusErrorstop"/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadStatus"><output name="Disabled"/></functionblock><coil type="open" name="axis3basic.StatusDisabled"/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadStatus"><output name="Stopping"/></functionblock><coil type="open" name="axis3basic.StatusStopping"/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadStatus"><output name="StandStill"/></functionblock><coil type="open" name="axis3basic.StatusStandstill"/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadStatus"><output name="DiscreteMotion"/></functionblock><coil type="open" name="axis3basic.StatusMotionDiscrete"/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadStatus"><output name="ContinuousMotion"/></functionblock><coil type="open" name="axis3basic.StatusMotionContinous"/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadStatus"><output name="SynchronizedMotion"/></functionblock><coil type="open" name="axis3basic.StatusMotionSynchronized"/></row>
		<row><empty/><functionblock position="bottom" type="MC_ReadStatus"><output name="Homing"/></functionblock><coil type="open" name="axis3basic.StatusHoming"/></row>
	</network>
	<network label="" comment="[******************** MC_READACTUALPOSITION *********************]" row="6" column="0">
		<row><empty/><functionblock position="header" name="MC_ReadActualPosition_3" type="MC_ReadActualPosition"/><empty/></row>
		<row><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_ReadActualPosition"><input name="Axis"/><output name="Valid"/></functionblock><empty/></row>
		<row><line/><functionblock position="middle" type="MC_ReadActualPosition"><input name="Enable"/><output name="Busy"/></functionblock><empty/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadActualPosition"><output name="Error"/></functionblock><empty/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadActualPosition"><output name="ErrorID"/></functionblock><empty/></row>
		<row><empty/><functionblock position="bottom" type="MC_ReadActualPosition"><output name="Position"/></functionblock><analog type="output" name="axis3basic.ActPosition"/></row>
	</network>
	<network label="" comment="[******************** MC_READACTUALVELOCITY *********************]" row="6" column="0">
		<row><empty/><functionblock position="header" name="MC_ReadActualVelocity_3" type="MC_ReadActualVelocity"/><empty/></row>
		<row><analog type="input" name="axis3basic.Obj"/><functionblock position="top" type="MC_ReadActualVelocity"><input name="Axis"/><output name="Valid"/></functionblock><empty/></row>
		<row><line/><functionblock position="middle" type="MC_ReadActualVelocity"><input name="Enable"/><output name="Busy"/></functionblock><empty/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadActualVelocity"><output name="Error"/></functionblock><empty/></row>
		<row><empty/><functionblock position="middle" type="MC_ReadActualVelocity"><output name="ErrorID"/></functionblock><empty/></row>
		<row><empty/><functionblock position="bottom" type="MC_ReadActualVelocity"><output name="Velocity"/></functionblock><analog type="output" name="axis3basic.ActVelocity"/></row>
	</network>
	<network label="" comment="[***************** CHECK IF AXIS ERROR ID SHOULD BE UPDATED *******************]" row="2" column="0">
		<row><analog type="input" name="MC_ReadAxisError_3.AxisErrorID"/><function position="top" type="GT"><input name="IN1" extensible="true"/><output name="1"/></function><coil type="jump" name="AxisErrorIDUpdate"/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="GT"><input name="IN2" extensible="true"/></function><empty/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><contact type="open" name="Control.Achieved"/><coil type="set" name="machine3.Power"/></row>
		<row><contact type="open" name="TestServos" or="true"/><empty/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><analog type="input" name="axis3basic.ErrorID"/><function position="top" type="NE"><input name="IN1"/><output name="1"/></function><coil type="reset" name="machine3.Power"/></row>
		<row><analog type="input" name="0"/><function position="bottom" type="NE"><input name="IN2"/></function><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="closed" name="Control.Achieved"/><contact type="closed" name="TestServos"/><contact type="open" name="axis3basic.StatusStandstill"/><contact type="closed" name="axis3basic.StatusStopping"/><coil type="reset" name="machine3.Power"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="machine3.Power"/><coil type="set" name="axis3basic.Power"/></row>
	</network>
	<network label="" comment="" row="4" column="0">
		<row><contact type="closed" name="machine3.Power"/><coil type="reset" name="axis3basic.Power"/></row>
		<row><empty or="true"/><coil type="reset" name="machine3.Start"/></row>
		<row><empty or="true"/><coil type="reset" name="machine3.Stop"/></row>
		<row><empty or="true"/><coil type="reset" name="machine3.Mode"/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><contact type="open" name="axis3basic.StatusStandstill"/><function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function><coil type="set" name="axis3basic.Home"/></row>
		<row><contact type="open" name="axis3basic.StartHome"/><function position="bottom" type="AND" or="true"><input name="" extensible="true"/></function><coil type="reset" name="axis3basic.StartHome"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="machine3.Start"/><coil type="set" name="machine3.Mode"/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><contact type="closed" name="machine3.Start"/><contact type="open" name="machine3.MasterStop"/><coil type="reset" name="machine3.MasterStop"/></row>
		<row><empty/><empty or="true"/><coil type="set" name="axis3basic.Stop"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="machine3.JogPositive"/><contact type="closed" name="machine3.Mode"/><coil type="set" name="axis3basic.MoveJogPos"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="closed" name="machine3.JogPositive"/><contact type="closed" name="machine3.Mode"/><coil type="reset" name="axis3basic.MoveJogPos"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="open" name="machine3.JogNegative"/><contact type="closed" name="machine3.Mode"/><coil type="set" name="axis3basic.MoveJogNeg"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><contact type="closed" name="machine3.JogNegative"/><contact type="closed" name="machine3.Mode"/><coil type="reset" name="axis3basic.MoveJogNeg"/></row>
	</network>
	<network label="" comment="" row="2" column="0">
		<row><contact type="open" name="machine3.ErrorAcknowledge"/><coil type="set" name="axis3basic.ErrorAcknowledge"/></row>
		<row><empty or="true"/><coil type="reset" name="machine3.ErrorAcknowledge"/></row>
	</network>
	<network label="" comment="Axis feedback to Manager" row="1" column="0">
		<row><analog type="input" name="axis3basic.ErrorID"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="machine3.ErrorID"/></row>
	</network>
	<network label="" comment="" row="3" column="0">
		<row><analog type="input" name="machine3.ErrorText"/><function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function><function position="top" type="memcpy"><input name="pDest"/><output name="7"/></function><analog type="output" name="axis3basic.Ret"/></row>
		<row><analog type="input" name="axis3basic.ErrorText"/><function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function><function position="middle" type="memcpy"><input name="pSrc"/></function><empty/></row>
		<row><analog type="input" name="axis3basic.ErrorText"/><function position="topbottom" type="SIZEOF"><input name="in"/><output name="7"/></function><function position="bottom" type="memcpy"><input name="length"/></function><empty/></row>
	</network>
	<network label="" comment="[***************** CHECK IF POWER SHOULD BE OFF *******************]" row="1" column="0">
		<row><contact type="closed" name="axis3basic.Power"/><coil type="jump" name="PowerOff"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="return"/></row>
	</network>
	<network label="AxisErrorIDUpdate" comment="" row="1" column="0">
		<row><analog type="input" name="MC_ReadAxisError_3.AxisErrorID"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis3basic.ErrorID"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="return"/></row>
	</network>
	<network label="AxisError" comment="[***************** AXIS ERROR - CLEAN TXT FIELDS *******************]" row="1" column="0">
		<row><analog type="input" name="''"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis3basic.ErrorText[0]"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="''"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis3basic.ErrorText[1]"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="''"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis3basic.ErrorText[2]"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="''"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis3basic.ErrorText[3]"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="0"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis3basic.ErrorID"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="return"/></row>
	</network>
	<network label="PowerOff" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="MC_Power_3.Enable"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="MC_Home_3.Execute"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="MC_Stop_3.Execute"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="MC_MoveAbsolute_3.Execute"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="MC_MoveVelocity_4.Execute"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="MC_MoveVelocity_5.Execute"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="MC_ReadAxisError_3.Acknowledge"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="MC_Reset_3.Execute"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="axis3basic.Stop"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="axis3basic.MoveJogPos"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="axis3basic.MoveJogNeg"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="axis3basic.MoveAbsolute"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="0"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis3basic.ErrorID"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="return"/></row>
	</network>
</networks>
END_PROGRAM




































































































































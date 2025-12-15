PROGRAM _CYCLIC
<?xml version="1.0"?>
<?ladder Version = 1.0?>
<!-- Automation Studio Generated XML Section -->
<networks xmlns:dt="urn:schemas-microsoft-com:datatypes" maxcolumn="0">
	<network label="" comment="" row="7" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="Axis1StatusBitsCyclicRead" type="MC_BR_InitCyclicRead"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_BR_InitCyclicRead"><input name="Axis"/><output name="Done"/></functionblock>
			<line/>
			<coil type="reset" name="axis1basic.CyclicReadExecute"/>
		</row>
		<row>
			<contact type="open" name="axis1basic.CyclicReadExecute"/>
			<line/>
			<line/>
			<functionblock position="middle" type="MC_BR_InitCyclicRead"><input name="Execute"/><output name="Busy"/></functionblock>
			<empty or="true"/>
			<coil type="set" name="axis1basic.DigiSetup"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="179"/>
			<functionblock position="middle" type="MC_BR_InitCyclicRead"><input name="ParID"/><output name="Error"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.CyclicBits"/>
			<function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function>
			<functionblock position="middle" type="MC_BR_InitCyclicRead"><input name="DataAddress"/><output name="ErrorID"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ncPAR_TYP_UDINT"/>
			<functionblock position="middle" type="MC_BR_InitCyclicRead"><input name="DataType"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MC_BR_InitCyclicRead"><input name="Mode"/></functionblock>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="Axis1DigiIPsFromX67" type="AxisSwitchCfg"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="AxisSwitchCfg"><input name="Axis"/><output name="Done"/></functionblock>
			<line/>
			<coil type="reset" name="axis1basic.DigiSetup"/>
		</row>
		<row>
			<contact type="open" name="axis1basic.DigiSetup"/>
			<functionblock position="middle" type="AxisSwitchCfg"><input name="Execute"/><output name="Busy"/></functionblock>
			<empty or="true"/>
			<coil type="set" name="axis1basic.OKtoRun"/>
		</row>
		<row>
			<analog type="input" name="Ax1.Node"/>
			<functionblock position="middle" type="AxisSwitchCfg"><input name="DeviceName"/><output name="Error"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="'DigitalInput01'"/>
			<functionblock position="bottom" type="AxisSwitchCfg"><input name="ChannelName"/><output name="ErrorID"/></functionblock>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Automatic reset of error 6023 'Voltage sag at enable input'" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ErrorID"/>
			<function position="middle" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<analog type="output" name="ErrorACKs1[0]"/>
		</row>
		<row>
			<analog type="input" name="6023"/>
			<function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Control.Achieved1"/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ErrorID"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="ErrorACKs1[1]"/>
		</row>
		<row>
			<analog type="input" name="29207"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Control.Achieved1"/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ErrorID"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="ErrorACKs1[2]"/>
		</row>
		<row>
			<analog type="input" name="29209"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Control.Achieved1"/>
			<contact type="open" name="axis1basic.StatusErrorstop"/>
			<coil type="open" name="ErrorACKs1[3]"/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="ErrorACKs1[0]"/>
			<line/>
			<coil type="open" name="axis1basic.ErrorAcknowledge"/>
		</row>
		<row>
			<contact type="open" name="ErrorACKs1[1]" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ErrorACKs1[2]" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ErrorACKs1[3]" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ScreenACK1" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ErrorACKs1[3]"/>
			<line/>
			<coil type="reset" name="axis1basic.StatusErrorstop"/>
		</row>
	</network>
	<network label="" comment="[************************ MC_READAXISERROR **********************]" row="7" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="MC_ReadAxisError_0" type="MC_ReadAxisError"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_ReadAxisError"><input name="Axis"/><output name="Valid"/></functionblock>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<functionblock position="middle" type="MC_ReadAxisError"><input name="Enable"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="axis1basic.ErrorAcknowledge"/>
			<line/>
			<line/>
			<line/>
			<line/>
			<functionblock position="middle" type="MC_ReadAxisError"><input name="Acknowledge"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ErrorText"/>
			<function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function>
			<line/>
			<line/>
			<functionblock position="middle" type="MC_ReadAxisError"><input name="DataAddress"/><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ErrorText"/>
			<function position="topbottom" type="SIZEOF"><input name="in"/><output name="7"/></function>
			<function position="topbottom" type="UDINT_TO_UINT"><input name="IN"/><output name="6"/></function>
			<functionblock position="middle" type="MC_ReadAxisError"><input name="DataLength"/><output name="AxisErrorID"/></functionblock>
			<analog type="output" name="axis1basic.ErrorID"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="'english'"/>
			<functionblock position="bottom" type="MC_ReadAxisError"><input name="DataObjectName"/><output name="AxisErrorCount"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="axis1basic.ErrorID"/>
			<function position="top" type="GT"><input name="IN1" extensible="true"/><output name="1"/></function>
			<coil type="open" name="Ax1.Error"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="GT"><input name="IN2" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="axis1basic.ErrorAcknowledge"/>
			<line/>
			<coil type="reset" name="axis1basic.ErrorAcknowledge"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<coil type="set" name="Ax1.Reset"/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="MC_Reset_0" type="MC_Reset"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_Reset"><input name="Axis"/><output name="Done"/></functionblock>
			<line/>
			<coil type="reset" name="Ax1.Reset"/>
		</row>
		<row>
			<contact type="open" name="Ax1.Reset"/>
			<functionblock position="middle" type="MC_Reset"><input name="Execute"/><output name="Busy"/></functionblock>
			<empty or="true"/>
			<coil type="jump" name="AxisError"/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_Reset"><output name="Error"/></functionblock>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="bottom" type="MC_Reset"><output name="ErrorID"/></functionblock>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="axis1basic.ErrorAcknowledge"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="axis1basic.ErrorID"/>
			<function position="top" type="EQ"><input name="IN1" extensible="true"/><output name="1"/></function>
			<contact type="open" name="axis1basic.Power"/>
			<coil type="open" name="MC_Power_0.Enable"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="EQ"><input name="IN2" extensible="true"/></function>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="[******************** POWER ON **********************]" row="5" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="MC_Power_0" type="MC_Power"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_Power"><input name="Axis"/><output name="Status"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="axis1basic.OKtoRun"/>
			<contact type="open" name="axis1basic.Power"/>
			<contact type="closed" name="ErrorACKs1[3]"/>
			<functionblock position="middle" type="MC_Power"><input name="Enable"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MC_Power"><output name="Error"/></functionblock>
			<coil type="reset" name="axis1basic.Power"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MC_Power"><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="[******************** HOME **********************]" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="MC_Home_0" type="MC_Home"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_Home"><input name="Axis"/><output name="Done"/></functionblock>
			<line/>
			<coil type="reset" name="axis1basic.Home"/>
		</row>
		<row>
			<contact type="open" name="MC_Power_0.Status"/>
			<contact type="closed" name="axis1basic.Homed"/>
			<contact type="open" name="ArmsTemp1.DownDone"/>
			<functionblock position="middle" type="MC_Home"><input name="Execute"/><output name="Busy"/></functionblock>
			<empty or="true"/>
			<coil type="set" name="axis1basic.Homed"/>
		</row>
		<row>
			<contact type="open" name="axis1basic.Home"/>
			<line or="true"/>
			<analog type="input" name="axis1basic.ParaHomePosition"/>
			<functionblock position="middle" type="MC_Home"><input name="Position"/><output name="CommandAborted"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="middle" type="MC_Home"><input name="HomingMode"/><output name="Error"/></functionblock>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MC_Home"><output name="ErrorID"/></functionblock>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="axis1basic.Homed"/>
			<contact type="open" name="Control.Achieved1"/>
			<coil type="open" name="Ax1.OriginSet"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="Ax1P.Origin"/>
			<function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function>
			<analog type="output" name="axis1basic.ParaHomePosition"/>
		</row>
	</network>
	<network label="" comment="[*********************** STOP MOVEMENT *************************]" row="6" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="MC_Stop_0" type="MC_Stop"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_Stop"><input name="Axis"/><output name="Done"/></functionblock>
			<coil type="reset" name="axis1basic.Stop"/>
		</row>
		<row>
			<contact type="open" name="axis1basic.Stop"/>
			<contact type="open" name="AlwaysON"/>
			<line/>
			<functionblock position="middle" type="MC_Stop"><input name="Execute"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="axis1basic.MoveJogPos"/>
			<line or="true"/>
			<analog type="input" name="axis1basic.ParaDeceleration"/>
			<functionblock position="middle" type="MC_Stop"><input name="Deceleration"/><output name="CommandAborted"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="axis1basic.MoveJogNeg"/>
			<line or="true"/>
			<empty/>
			<functionblock position="middle" type="MC_Stop"><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="bottom" type="MC_Stop"><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="axis1basic.Stop"/>
			<line/>
			<coil type="reset" name="axis1basic.MoveAbsolute"/>
		</row>
	</network>
	<network label="" comment="[******************** START JOG MOVEMENT POSITIVE **********************]" row="7" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="MC_MoveVelocity_0" type="MC_MoveVelocity"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_MoveVelocity"><input name="Axis"/><output name="InVelocity"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="axis1basic.MoveJogPos"/>
			<functionblock position="middle" type="MC_MoveVelocity"><input name="Execute"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaJogVelocity"/>
			<functionblock position="middle" type="MC_MoveVelocity"><input name="Velocity"/><output name="CommandAborted"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaAcceleration"/>
			<functionblock position="middle" type="MC_MoveVelocity"><input name="Acceleration"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaDeceleration"/>
			<functionblock position="middle" type="MC_MoveVelocity"><input name="Deceleration"/><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mcPOSITIVE_DIR"/>
			<functionblock position="bottom" type="MC_MoveVelocity"><input name="Direction"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="[******************** START JOG MOVEMENT NEGATIVE **********************]" row="7" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="MC_MoveVelocity_1" type="MC_MoveVelocity"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_MoveVelocity"><input name="Axis"/><output name="InVelocity"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="axis1basic.MoveJogNeg"/>
			<functionblock position="middle" type="MC_MoveVelocity"><input name="Execute"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaJogVelocity"/>
			<functionblock position="middle" type="MC_MoveVelocity"><input name="Velocity"/><output name="CommandAborted"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaAcceleration"/>
			<functionblock position="middle" type="MC_MoveVelocity"><input name="Acceleration"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaDeceleration"/>
			<functionblock position="middle" type="MC_MoveVelocity"><input name="Deceleration"/><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="mcNEGATIVE_DIR"/>
			<functionblock position="bottom" type="MC_MoveVelocity"><input name="Direction"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="axis1basic.MoveAbsolute"/>
			<contact type="positive transition" name="MC_MoveAbsolute_0.Busy"/>
			<coil type="reset" name="axis1basic.MoveAbsolute"/>
		</row>
	</network>
	<network label="" comment="[******************** START ABSOLUTE MOVEMENT **********************]" row="8" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="MC_MoveAbsolute_0" type="MC_MoveAbsolute"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_MoveAbsolute"><input name="Axis"/><output name="Done"/></functionblock>
			<coil type="reset" name="axis1basic.MoveAbsolute"/>
		</row>
		<row>
			<contact type="open" name="axis1basic.MoveAbsolute"/>
			<functionblock position="middle" type="MC_MoveAbsolute"><input name="Execute"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaPosition"/>
			<functionblock position="middle" type="MC_MoveAbsolute"><input name="Position"/><output name="CommandAborted"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaVelocity"/>
			<functionblock position="middle" type="MC_MoveAbsolute"><input name="Velocity"/><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaAcceleration"/>
			<functionblock position="middle" type="MC_MoveAbsolute"><input name="Acceleration"/><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaDeceleration"/>
			<functionblock position="middle" type="MC_MoveAbsolute"><input name="Deceleration"/></functionblock>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ParaDirection"/>
			<functionblock position="bottom" type="MC_MoveAbsolute"><input name="Direction"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="[******************** MC_READSTATUS *************************]" row="13" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="MC_ReadStatus_0" type="MC_ReadStatus"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_ReadStatus"><input name="Axis"/><output name="Valid"/></functionblock>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="middle" type="MC_ReadStatus"><input name="Enable"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadStatus"><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadStatus"><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadStatus"><output name="Errorstop"/></functionblock>
			<coil type="open" name="axis1basic.StatusErrorstop"/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadStatus"><output name="Disabled"/></functionblock>
			<coil type="open" name="axis1basic.StatusDisabled"/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadStatus"><output name="Stopping"/></functionblock>
			<coil type="open" name="axis1basic.StatusStopping"/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadStatus"><output name="StandStill"/></functionblock>
			<coil type="open" name="axis1basic.StatusStandstill"/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadStatus"><output name="DiscreteMotion"/></functionblock>
			<coil type="open" name="axis1basic.StatusMotionDiscrete"/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadStatus"><output name="ContinuousMotion"/></functionblock>
			<coil type="open" name="axis1basic.StatusMotionContinous"/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadStatus"><output name="SynchronizedMotion"/></functionblock>
			<coil type="open" name="axis1basic.StatusMotionSynchronized"/>
		</row>
		<row>
			<empty/>
			<functionblock position="bottom" type="MC_ReadStatus"><output name="Homing"/></functionblock>
			<coil type="open" name="axis1basic.StatusHoming"/>
		</row>
	</network>
	<network label="" comment="[******************** MC_READACTUALPOSITION *********************]" row="6" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="MC_ReadActualPosition_0" type="MC_ReadActualPosition"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_ReadActualPosition"><input name="Axis"/><output name="Valid"/></functionblock>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="middle" type="MC_ReadActualPosition"><input name="Enable"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadActualPosition"><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadActualPosition"><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="bottom" type="MC_ReadActualPosition"><output name="Position"/></functionblock>
			<analog type="output" name="axis1basic.ActPosition"/>
		</row>
	</network>
	<network label="" comment="[******************** MC_READACTUALVELOCITY *********************]" row="6" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="MC_ReadActualVelocity_0" type="MC_ReadActualVelocity"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.Obj"/>
			<functionblock position="top" type="MC_ReadActualVelocity"><input name="Axis"/><output name="Valid"/></functionblock>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="middle" type="MC_ReadActualVelocity"><input name="Enable"/><output name="Busy"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadActualVelocity"><output name="Error"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="middle" type="MC_ReadActualVelocity"><output name="ErrorID"/></functionblock>
			<empty/>
		</row>
		<row>
			<empty/>
			<functionblock position="bottom" type="MC_ReadActualVelocity"><output name="Velocity"/></functionblock>
			<analog type="output" name="axis1basic.ActVelocity"/>
		</row>
	</network>
	<network label="" comment="[***************** CHECK IF AXIS ERROR ID SHOULD BE UPDATED *******************]" row="2" column="0" commented="0">
		<row>
			<analog type="input" name="MC_ReadAxisError_0.AxisErrorID"/>
			<function position="top" type="GT"><input name="IN1" extensible="true"/><output name="1"/></function>
			<coil type="jump" name="AxisErrorIDUpdate"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="GT"><input name="IN2" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Control.Achieved1"/>
			<line/>
			<coil type="set" name="machine.Power"/>
		</row>
		<row>
			<contact type="open" name="TestServos" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="Control.Achieved1"/>
			<contact type="closed" name="TestServos"/>
			<coil type="reset" name="machine.Power"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="axis1basic.ErrorID"/>
			<function position="top" type="NE"><input name="IN1"/><output name="1"/></function>
			<coil type="reset" name="machine.Power"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="NE" or="true"><input name="IN2"/></function>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="Control.Achieved1"/>
			<contact type="closed" name="TestServos"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="machine.Power"/>
			<line/>
			<coil type="set" name="axis1basic.Power"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="closed" name="machine.Power"/>
			<line/>
			<coil type="reset" name="axis1basic.Power"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="machine.Start"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="machine.Stop"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="machine.Mode"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="axis1basic.StatusStandstill"/>
			<function position="top" type="AND"><input name="" extensible="true"/><output name="40"/></function>
			<coil type="set" name="axis1basic.Home"/>
		</row>
		<row>
			<contact type="open" name="axis1basic.StartHome"/>
			<function position="bottom" type="AND" or="true"><input name="" extensible="true"/></function>
			<coil type="reset" name="axis1basic.StartHome"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="machine.Start"/>
			<line/>
			<coil type="set" name="machine.Mode"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="machine.Start"/>
			<contact type="open" name="machine.MasterStop"/>
			<coil type="reset" name="machine.MasterStop"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<coil type="set" name="axis1basic.Stop"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="machine.JogPositive"/>
			<contact type="closed" name="machine.Mode"/>
			<coil type="set" name="axis1basic.MoveJogPos"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="machine.JogPositive"/>
			<contact type="closed" name="machine.Mode"/>
			<coil type="reset" name="axis1basic.MoveJogPos"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="machine.JogNegative"/>
			<contact type="closed" name="machine.Mode"/>
			<coil type="set" name="axis1basic.MoveJogNeg"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="machine.JogNegative"/>
			<contact type="closed" name="machine.Mode"/>
			<coil type="reset" name="axis1basic.MoveJogNeg"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="machine.ErrorAcknowledge"/>
			<line/>
			<coil type="set" name="axis1basic.ErrorAcknowledge"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="machine.ErrorAcknowledge"/>
		</row>
	</network>
	<network label="" comment="Axis feedback to Manager" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="axis1basic.ErrorID"/>
			<function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function>
			<analog type="output" name="machine.ErrorID"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<analog type="input" name="machine.ErrorText"/>
			<function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function>
			<function position="top" type="memcpy"><input name="pDest"/><output name="7"/></function>
			<analog type="output" name="axis1basic.Ret"/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ErrorText"/>
			<function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function>
			<function position="middle" type="memcpy"><input name="pSrc"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="axis1basic.ErrorText"/>
			<function position="topbottom" type="SIZEOF"><input name="in"/><output name="7"/></function>
			<function position="bottom" type="memcpy"><input name="length"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="[***************** CHECK IF POWER SHOULD BE OFF *******************]" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="axis1basic.Power"/>
			<line/>
			<coil type="jump" name="PowerOff"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="return"/>
		</row>
	</network>
	<network label="AxisErrorIDUpdate" comment="" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="MC_ReadAxisError_0.AxisErrorID"/>
			<function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function>
			<analog type="output" name="axis1basic.ErrorID"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="return"/>
		</row>
	</network>
	<network label="AxisError" comment="[***************** AXIS ERROR - CLEAN TXT FIELDS *******************]" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="''"/>
			<function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function>
			<analog type="output" name="axis1basic.ErrorText[0]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="''"/>
			<function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function>
			<analog type="output" name="axis1basic.ErrorText[1]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="''"/>
			<function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function>
			<analog type="output" name="axis1basic.ErrorText[2]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="''"/>
			<function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function>
			<analog type="output" name="axis1basic.ErrorText[3]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="0"/>
			<function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function>
			<analog type="output" name="axis1basic.ErrorID"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="return"/>
		</row>
	</network>
	<network label="PowerOff" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="MC_Power_0.Enable"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="MC_Home_0.Execute"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="MC_Stop_0.Execute"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="MC_MoveAbsolute_0.Execute"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="MC_MoveVelocity_1.Execute"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="MC_MoveVelocity_0.Execute"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="MC_ReadAxisError_0.Acknowledge"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="MC_Reset_0.Execute"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="axis1basic.Stop"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="axis1basic.MoveJogPos"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="axis1basic.MoveJogNeg"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="reset" name="axis1basic.MoveAbsolute"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<analog type="input" name="0"/>
			<function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function>
			<analog type="output" name="axis1basic.ErrorID"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<line/>
			<line/>
			<coil type="return"/>
		</row>
	</network>
</networks>
END_PROGRAM









































































































































PROGRAM _INIT














<?xml version="1.0"?>
<?ladder Version = 1.0?>
<!-- Automation Studio Generated XML Section -->
<networks xmlns:dt="urn:schemas-microsoft-com:datatypes" maxcolumn="0">
	<network label="" comment="" row="3" column="0">
		<row><empty/><empty/><analog type="input" name="ncACP10MAN"/><function position="top" type="ncaccess"><input name="nc_sw_id"/><output name="6"/></function><analog type="output" name="axis1basic.ErrorNcAccess"/></row>
		<row><analog type="input" name="'Axis1'"/><function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function><function position="middle" type="ncaccess"><input name="nc_obj_name"/></function><empty/></row>
		<row><analog type="input" name="axis1basic.Obj"/><function position="topbottom" type="ADR"><input name="in"/><output name="7"/></function><function position="bottom" type="ncaccess"><input name="p_nc_object"/></function><empty/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="1.0"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis1basic.ParaOverrideVelocity"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="1.0"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis1basic.ParaOverrideAcceleration"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="1000"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis1basic.ParaVelocity"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="25000"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis1basic.ParaAcceleration"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="40000"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis1basic.ParaDeceleration"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><analog type="input" name="400"/><function position="topbottom" type="MOVE"><input name="IN" extensible="true"/><output name="40"/></function><analog type="output" name="axis1basic.ParaJogVelocity"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="set" name="axis1basic.CyclicReadExecute"/></row>
	</network>
	<network label="" comment="" row="1" column="0">
		<row><line/><coil type="reset" name="axis1basic.OKtoRun"/></row>
	</network>
</networks>
END_PROGRAM
















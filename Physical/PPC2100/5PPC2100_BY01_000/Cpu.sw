<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio Version=4.2.4.149?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="IO" Source="System.IO.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="LineConfig" Source="System.LineConfig.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="SensorInpu" Source="System.SensorInput.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Axis1State" Source="Motion.Axis1State.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Seam1Array" Source="Motion.Seam1Array.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Axis2State" Source="Motion.Axis2State.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Seam2Array" Source="Motion.Seam2Array.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="ResetInv" Source="Automatic.ResetInv.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="AxBlocks" Source="Automatic.AxBlocks.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ConLoad" Source="Automatic.ConLoad.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ConSeam1" Source="Automatic.ConSeam1.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ConCorner" Source="Automatic.ConCorner.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ConSeam2" Source="Automatic.ConSeam2.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ConBuffers" Source="Automatic.ConBuffers.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ConRow" Source="Automatic.ConRow.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ConBatch" Source="Automatic.ConBatch.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Seaming" Source="Automatic.Seaming.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Batching" Source="Automatic.Batching.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Modes" Source="Automatic.Modes.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="FlipUpArms" Source="Automatic.FlipUpArms.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Outputs" Source="Automatic.Outputs.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#3">
    <Task Name="Control" Source="System.Control.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Seamers" Source="System.Seamers.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Process" Source="System.Process.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#4">
    <Task Name="IPConfig" Source="IPConfig.IPConfig.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Filstar" Source="System.Filstar.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Level" Source="VisControl.HMIControl.Level.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Status" Source="VisControl.HMIControl.Status.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Start" Source="VisControl.HMIControl.Start.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ESRecover" Source="VisControl.HMIControl.ESRecover.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page10" Source="VisControl.HMIControl.Page10.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page11" Source="VisControl.HMIControl.Page11.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page12" Source="VisControl.HMIControl.Page12.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page13" Source="VisControl.HMIControl.Page13.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page14" Source="VisControl.HMIControl.Page14.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page15" Source="VisControl.HMIControl.Page15.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page16" Source="VisControl.HMIControl.Page16.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page17" Source="VisControl.HMIControl.Page17.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page18" Source="VisControl.HMIControl.Page18.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Page20" Source="VisControl.HMIControl.Page20.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Level" Source="VisControl.ServiceControl.S_Level.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Status" Source="VisControl.ServiceControl.S_Status.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Start" Source="VisControl.ServiceControl.S_Start.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Page10" Source="VisControl.ServiceControl.S_Page10.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Page11" Source="VisControl.ServiceControl.S_Page11.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Page12" Source="VisControl.ServiceControl.S_Page12.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Page13" Source="VisControl.ServiceControl.S_Page13.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Page14" Source="VisControl.ServiceControl.S_Page14.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Page15" Source="VisControl.ServiceControl.S_Page15.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Page16" Source="VisControl.ServiceControl.S_Page16.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Page18" Source="VisControl.ServiceControl.S_Page18.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_Page20" Source="VisControl.ServiceControl.S_Page20.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="S_ESRecove" Source="VisControl.ServiceControl.S_ESRecover.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="EPLComms" Source="InvComms.EPLComms.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="BatchData" Source="VisControl.BatchDisp.BatchData.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8" />
  <NcDataObjects>
    <NcDataObject Name="english" Source="Motion.english.dob" Memory="UserROM" Language="Ett" />
    <NcDataObject Name="table_par1" Source="Motion.table_par1.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="axis1" Source="Motion.axis1.dob" Memory="UserROM" Language="Ax" />
  </NcDataObjects>
  <VcDataObjects>
    <VcDataObject Name="HMIXGA" Source="HMIXGA.HMIXGA.dob" Memory="UserROM" Language="Vc" WarningLevel="2" Compress="false" />
    <VcDataObject Name="SRVXGA" Source="SRVXGA.SRVXGA.dob" Memory="UserROM" Language="Vc" WarningLevel="2" Compress="false" />
    <VcDataObject Name="BatchP" Source="BatchDisplay.BatchP.dob" Memory="UserROM" Language="Vc" WarningLevel="2" Compress="false" />
  </VcDataObjects>
  <Binaries>
    <BinaryObject Name="vccline" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcclbox" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfar00" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="SRVXGA01" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="SRVXGA02" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="SRVXGA03" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcchtml" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccurl" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcxml" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Acp10map" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="acp10cfg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="Acp10sys" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="VisuTe" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfntttf" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfapc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbmp" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcshared" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdvnc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfile" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccpwd" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arial" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcchspot" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcmgr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdi815" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdi855" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsint" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbtn" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsloc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMIXGA02" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccovl" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcctext" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcbclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbar" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfmtcx" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="visvc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcrt" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccnum" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="trebuc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccstr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMIXGA01" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialn" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialbd" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpkat" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccshape" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdsw" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcnet" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcgclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="HMIXGA03" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vctcal" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdihd" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcptelo" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="verdana" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccddbox" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccpopup" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="VisuTe01" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccdt" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="VisuTe03" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="VisuTe02" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="Acp10_MC" Source="Libraries.Acp10_MC.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="brsystem" Source="Libraries.brsystem.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10man" Source="Libraries.Acp10man.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Runtime" Source="Libraries.Runtime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="NcGlobal" Source="Libraries.NcGlobal.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10par" Source="Libraries.Acp10par.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="IecCheck" Source="Libraries.IecCheck.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="AxisCtrl" Source="Libraries.AxisCtrl.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="AsEPL" Source="Libraries.AsEPL.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Lib_Ashton" Source="Libraries.Lib_Ashton.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="astime" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="powerlnk" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="vcresman" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="fileio" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asieccon" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="standard" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asarcfg" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="visapi" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="dataobj" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="loopconr" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>
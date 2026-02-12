(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: IO
 * File: IOCyclic.st
 * Author: nicke
 ********************************************************************
 * Implementation of program IO
 ********************************************************************)
 
PROGRAM _CYCLIC

	IF NOT(Simulation.On) THEN  //DISABLE WHEN SIMULATION RUNNING
		//MAP X2X ST02 TO VARIABLES
		Control.Start := X2X02.P1 ;
		Control.Stop := X2X02.P2 ;
		Control.EStop1 := X2X02.P3 ;
		X2X02.P4 ;
		MS1Belt1.Trip := X2X02.P5 ;
		MS2Belt2.Trip := X2X02.P6 ;
		MS3Belt3.Trip := X2X02.P7 ;
		MS4Belt4.Trip := X2X02.P8 ;
		MS5Belt5.Trip := X2X02.P9 ;
		MS6Belt6.Trip := X2X02.P10 ;
		MS7Belt7.Trip := X2X02.P11 ;
		MS8Belt8.Trip := X2X02.P12 ;
		//MAP X2X ST03 TO VARIABLES
		MS9Vac1.Trip := X2X03.P1 ;
		MS10Vac2.Trip := X2X03.P2 ;
		MS11Vac3.Trip := X2X03.P3 ;
		MS12Vac4.Trip := X2X03.P4 ;
		MS13Water1.Trip := X2X03.P5 ;
		MS14Water2.Trip := X2X03.P6 ;
		X2X03.P7 ;
		X2X03.P8 ;
		X2X03.P9 ;
		X2X03.P10 ;
		X2X03.P11 ;
		ClearBatch.In := X2X03.P12 ;
		//MAP X2X ST04 TO VARIABLES
		X2X04.P1 := Control.Buzzer ;
		X2X04.P2 := Control.OnLmp1 ;
		X2X04.P3 ;
		X2X04.P4 ;
		X2X04.P5 ;
		X2X04.P6 ;
		X2X04.P7 ;
		X2X04.P8 ;
		X2X04.P9 ;
		X2X04.P10 ;
		X2X04.P11 := SEL(Control.Auto,Sol24DG1B.Test,Sol24DG1B.Auto) ;
		X2X04.P12 := Filstar.Out ;
		//MAP X2X ST08 TO VARIABLES
		X2X08.P1 := SEL(Control.Auto,MS1Belt1.Test,MS1Belt1.Auto) ;
		X2X08.P2 := SEL(Control.Auto,MS2Belt2.Test,MS2Belt2.Auto) ;
		X2X08.P3 := SEL(Control.Auto,MS3Belt3.Test,MS3Belt3.Auto) ;
		X2X08.P4 := SEL(Control.Auto,MS4Belt4.Test,MS4Belt4.Auto) ;
		X2X08.P5 := SEL(Control.Auto,MS5Belt5.Test,MS5Belt5.Auto) ;
		X2X08.P6 := SEL(Control.Auto,MS6Belt6.Test,MS6Belt6.Auto) ;
		X2X08.P7 := SEL(Control.Auto,MS7Belt7.Test,MS7Belt7.Auto) ;
		X2X08.P8 := SEL(Control.Auto,MS8Belt8.Test,MS8Belt8.Auto) ;
		X2X08.P9 := SEL(Control.Auto,MS9Vac1.Test,MS9Vac1.Auto) ;
		X2X08.P10 := SEL(Control.Auto,MS10Vac2.Test,MS10Vac2.Auto) ;
		X2X08.P11 := SEL(Control.Auto,MS11Vac3.Test,MS11Vac3.Auto) ;
		X2X08.P12 := SEL(Control.Auto,MS12Vac4.Test,MS12Vac4.Auto) ;
		X2X08.P13 := SEL(Control.Auto,MS13Water1.Test,MS13Water1.Auto) ;
		X2X08.P14 := SEL(Control.Auto,MS14Water2.Test,MS14Water2.Auto) ;
		X2X08.P15 ;
		X2X08.P16 ;
		//MAP X2X ST10 TO VARIABLES
		S45Foot.In := X2X10.P1 ;
		S1Photo.In := X2X10.P2 ;
		S2Photo.In := X2X10.P3 ;
		S56Lever.In := X2X10.P4 ;
		S30Reed.In := X2X10.P5 ;
		S31Reed.In := X2X10.P6 ;
		LaserBusy.In := X2X10.P7 ;
		X2X10.P8 := LaserFire.Auto ;
		S100Reed.In := X2X10.P9 ;
		X2X10.P10 := SEL(Control.Auto,Sol37Spray.Test,Sol37Spray.Auto) ;
		X2X10.P11 := SEL(Control.Auto,Sol2Blt2.Test,Sol2Blt2.Auto) ;
		X2X10.P12 := SEL(Control.Auto,Sol5Arm1.Test,Sol5Arm1.Auto) ;
		X2X10.P13 := SEL(Control.Auto,Sol6Arm2.Test,Sol6Arm2.Auto) ;
		X2X10.P14 := SEL(Control.Auto,Sol7Arm3.Test,Sol7Arm3.Auto) ;
		X2X10.P15 := SEL(Control.Auto,Sol8Arm4.Test,Sol8Arm4.Auto) ;
		X2X10.P16 := SEL(Control.Auto,Sol20DT1.Test,Sol20DT1.Auto) ;
		//MAP X2X ST11 TO VARIABLES
		S81Photo.In := X2X11.P1 ;
		S82Photo.In := X2X11.P2 ;
		S83Photo.In := X2X11.P3 ;
		S84Photo.In := X2X11.P4 ;
		X2X11.P5 := SEL(Control.Auto,Sol3Blt3.Test,Sol3Blt3.Auto) ;
		X2X11.P6 := SEL(Control.Auto,Sol4Blt4.Test,Sol4Blt4.Auto) ;
		X2X11.P7 := SEL(Control.Auto,Sol21DT2.Test,Sol21DT2.Auto) ;
		S3Photo.In := X2X11.P8 ;
		//MAP X2X ST12 TO VARIABLES
		Servo1POT.In := X2X12.P1 ;
		Servo1NOT.In := X2X12.P2 ;
		S80Origin.In := X2X12.P3 ;
		S101Reed.In := X2X12.P4 ;
		S104Reed.In := X2X12.P5 ;
		S105Reed.In := X2X12.P6 ;
		S106Reed.In := X2X12.P7 ;
		S107Reed.In := X2X12.P8 ;
		S108Reed.In := X2X12.P9 ;
		S109Reed.In := X2X12.P10 ;
		S110Reed.In := X2X12.P11 ;
		S111Reed.In := X2X12.P12 ;
		S112Reed.In := X2X12.P13 ;
		S113Reed.In := X2X12.P14 ;
		S114Reed.In := X2X12.P15 ;
		S115Reed.In := X2X12.P16 ;
		//MAP X2X ST13 TO VARIABLES
		S4Photo.In := X2X13.P1 ;
		S5Photo.In := X2X13.P2 ;
		S6Photo.In := X2X13.P3 ;
		S9Photo.In := X2X13.P4 ;
		S32Reed.In := X2X13.P5 ;
		S33Reed.In := X2X13.P6 ;
		S50Reed.In := X2X13.P7 ;
		S102Reed.In := X2X13.P8 ;
		S103Reed.In := X2X13.P9 ;
		X2X13.P10 := SEL(Control.Auto,Sol30Pal1.Test,Sol30Pal1.Auto) ;
		X2X13.P11 := SEL(Control.Auto,Sol31Pal2.Test,Sol31Pal2.Auto) ;
		X2X13.P12 := SEL(Control.Auto,Sol32Pal3.Test,Sol32Pal3.Auto) ;
		X2X13.P13 := SEL(Control.Auto,Sol33Pal4.Test,Sol33Pal4.Auto) ;
		X2X13.P14 := SEL(Control.Auto,Sol24DG1.Test,Sol24DG1.Auto) ;
		X2X13.P15 := Sol35Laser.Auto ;
		X2X13.P16 := SEL(Control.Auto,Sol19Pump.Test,Sol19Pump.Auto) ;
		//MAP X2X ST14 TO VARIABLES
		X2X14.P1 := SEL(Control.Auto,Sol47Spray.Test,Sol47Spray.Auto) ;
		X2X14.P2 := SEL(Control.Auto,Sol53Recirc.Test,Sol53Recirc.Auto) ;
		X2X14.P3 := SEL(Control.Auto,Sol14Arm6.Test,Sol14Arm6.Auto) ;
		X2X14.P4 := SEL(Control.Auto,Sol15Arm7.Test,Sol15Arm7.Auto) ;
		X2X14.P5 := SEL(Control.Auto,Sol22DT3.Test,Sol22DT3.Auto) ;
		S7Photo.In := X2X14.P6 ;
		S64Float.In := X2X14.P7 ;
		S65Float.In := X2X14.P8 ;
		//MAP X2X ST15 TO VARIABLES
		Servo2POT.In := X2X15.P1 ;
		Servo2NOT.In := X2X15.P2 ;
		S90Origin.In := X2X15.P3 ;
		S12Photo.In := X2X15.P4 ;
		S13Photo.In := X2X15.P5 ;
		S34Reed.In := X2X15.P6 ;
		S35Reed.In := X2X15.P7 ;
		X2X15.P8 ;
		S120Reed.In := X2X15.P9 ;
		S121Reed.In := X2X15.P10 ;
		S122Reed.In := X2X15.P11 ;
		S123Reed.In := X2X15.P12 ;
		S124Reed.In := X2X15.P13 ;
		S125Reed.In := X2X15.P14 ;
		S126Reed.In := X2X15.P15 ;
		S127Reed.In := X2X15.P16 ;
		//MAP X2X ST16 TO VARIABLES
		S91Photo.In := X2X16.P1 ;
		S92Photo.In := X2X16.P2 ;
		S93Photo.In := X2X16.P3 ;
		S94Photo.In := X2X16.P4 ;
		X2X16.P5 := SEL(Control.Auto,Sol12Blt7.Test,Sol12Blt7.Auto) ;
		X2X16.P6 := SEL(Control.Auto,Sol13Blt8.Test,Sol13Blt8.Auto) ;
		X2X16.P7 := SEL(Control.Auto,Sol23DT4.Test,Sol23DT4.Auto) ;
		S8Photo.In := X2X16.P8 ;
		X2X16.P9 := SEL(Control.Auto,Sol40Datum.Test,Sol40Datum.Auto) ;
		X2X16.P10 ;
		X2X16.P11 ;
		X2X16.P12 ;
		S52Reed.In := X2X16.P13 ;
		S53Reed.In := X2X16.P14 ;
		X2X16.P15 ;
		X2X16.P16 ;
		//MAP X2X ST17 TO VARIABLES
		S14Photo.In := X2X17.P1 ;
		S15Photo.In := X2X17.P2 ;
		S16Photo.In := X2X17.P3 ;
		S17Photo.In := X2X17.P4 ;
		S18Photo.In := X2X17.P5 ;
		S36Reed.In := X2X17.P6 ;
		S37Reed.In := X2X17.P7 ;
		S57Lever.In := X2X17.P8 ;
		//MAP X2X ST18 TO VARIABLES
		S19Photo.In := X2X18.P1 ;
		X2X18.P2 ;
		X2X18.P3 ;
		X2X18.P4 ;
		S21Photo.In := X2X18.P5 ;
		X2X18.P6 ;
		S55Lever.In := X2X18.P7 ;
		WashRun.In := X2X18.P8 ;
		FurnReady.In := X2X18.P9 ;
		X2X18.P10 := WashStop.Auto ;
		X2X18.P11 := BatchAtExit.Auto ;
		S48Foot.In := X2X18.P12 ;
		S66PB.In := X2X18.P13 ;
		S58Lever.In := X2X18.P14 ;
		S20Photo.In := X2X18.P15 ;
		X2X18.P16 ; //INPUT CAN BE USED FOR BUTTON OR FOOTPEDAL TO BRING UP NEXT SCREEN ON BATCHING DISPLAY.
		//MAP X2X ST20 TO VARIABLES
		AGVInPosition.In := X2X20.P1;
		AGVReady.In := X2X20.P2;
		AGVReceiving.In := X2X20.P3;
		X2X20.P4;
		X2X20.P5;
		X2X20.P6;
		X2X20.P7;
		X2X20.P8;
		X2X20.P9;
		X2X20.P10;
		X2X20.P11;
		X2X20.P12;
		//MAP X2X ST21 TO VARIABLES
		X2X21.P1;
		X2X21.P2;
		X2X21.P3;
		X2X21.P4;
		X2X21.P5 := AGVReadyToSend.Auto;
		X2X21.P6 := Length_Bit13;
		X2X21.P7 := Length_Bit14;
		X2X21.P8 := Length_Bit15;
		X2X21.P9 := Length_Bit16;
		X2X21.P10;
		X2X21.P11;
		X2X21.P12;
		//MAP X2X ST22 TO VARIABLES
		X2X22.P1 := Length_Bit1;
		X2X22.P2 := Length_Bit2;
		X2X22.P3 := Length_Bit3;
		X2X22.P4 := Length_Bit4;
		X2X22.P5 := Length_Bit5;
		X2X22.P6 := Length_Bit6;
		X2X22.P7 := Length_Bit7;
		X2X22.P8 := Length_Bit8;
		X2X22.P9 := Length_Bit9;
		X2X22.P10 := Length_Bit10;
		X2X22.P11 := Length_Bit11;
		X2X22.P12 := Length_Bit12;
	END_IF

	//RESET TEST BITS WHEN EXITING TEST SCREENS
	IF NOT(Control.Test) THEN
		Sol24DG1B.Test := FALSE ;
		MS1Belt1.Test := FALSE ;
		MS2Belt2.Test := FALSE ;
		MS3Belt3.Test := FALSE ;
		MS4Belt4.Test := FALSE ;
		MS5Belt5.Test := FALSE ;
		MS6Belt6.Test := FALSE ;
		MS7Belt7.Test := FALSE ;
		MS8Belt8.Test := FALSE ;
		MS9Vac1.Test := FALSE ;
		MS10Vac2.Test := FALSE ;
		MS11Vac3.Test := FALSE ;
		MS12Vac4.Test := FALSE ;
		MS13Water1.Test := FALSE ;
		MS14Water2.Test := FALSE ;
		Sol1Blt1.Test := FALSE ;
		Sol2Blt2.Test := FALSE ;
		Sol5Arm1.Test := FALSE ;
		Sol6Arm2.Test := FALSE ;
		Sol7Arm3.Test := FALSE ;
		Sol8Arm4.Test := FALSE ;
		Sol3Blt3.Test := FALSE ;
		Sol4Blt4.Test := FALSE ;
		Sol19Pump.Test := FALSE ;
		Sol21DT2.Test := FALSE ;
		Sol30Pal1.Test := FALSE ;
		Sol31Pal2.Test := FALSE ;
		Sol32Pal3.Test := FALSE ;
		Sol33Pal4.Test := FALSE ;
		Sol24DG1.Test := FALSE ;
		Sol10Blt5.Test := FALSE ;
		Sol11Blt6.Test := FALSE ;
		Sol14Arm6.Test := FALSE ;
		Sol15Arm7.Test := FALSE ;
		Sol12Blt7.Test := FALSE ;
		Sol13Blt8.Test := FALSE ;
		Sol23DT4.Test := FALSE ;
		Sol37Spray.Test := FALSE;
		Sol40Datum.Test := FALSE ;
		Sol47Spray.Test := FALSE;
		Sol53Recirc.Test := FALSE;
		CL1.Inv.Test := 0 ;
		CS1.Inv.Test := 0 ;
		CV1.Inv.Test := 0 ;
		CC1.Inv.Test := 0 ;
		CC2.Inv.Test := 0 ;
		CS2.Inv.Test := 0 ;
		CV2.Inv.Test := 0 ;
		CC3.Inv.Test := 0 ;
		CC4.Inv.Test := 0 ;
		CB1.Inv.Test := 0 ;
		CB2.Inv.Test := 0 ;
		CRB.Inv.Test := 0 ;
		CRE.Inv.Test := 0 ;
		CLB.Inv.Test := 0 ;
	END_IF

END_PROGRAM



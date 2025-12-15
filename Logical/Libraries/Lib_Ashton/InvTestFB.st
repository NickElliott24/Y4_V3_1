(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: Lib_Ashton
 * File: InvTestFB.st
 * Author: nicke
 ********************************************************************
 * Implementation of library Lib_Ashton
 ********************************************************************) 

//InvTest
FUNCTION_BLOCK InvTestFB
	
	CASE Index OF
		0:	//STOPPED
			Run := FALSE ;
			Rev := FALSE ;
			Speed := AutoSpeedIN ;
		1:	//FORWARD SEAMING SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed := SpeedIN.SpeedSeam ;
		2:	//FORWARD TRANSFER SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed := SpeedIN.SpeedTrans ;
		3:	//FORWARD MAX SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed := SpeedIN.SpeedMax ;
		4:	//FORWARD SLOW SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed := SpeedIN.SpeedSlow ;
		5:	//FORWARD LASER SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed := SpeedIN.SpeedLaser ;
		6:	//FORWARD WASHER SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed := SpeedIN.SpeedWash ;
		7:	//REVERSE SLOW SPEED
			Run := TRUE ;
			Rev := TRUE ;
			Speed := SpeedIN.SpeedSlow ;
		8:	//CENTERING SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed :=	SpeedIN.SpeedCntr ;
		9:	//BATCH SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed :=	SpeedIN.SpeedBatch ;
		10:	//ENTRY SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed :=	SpeedIN.SpeedEntry ;
		11:	//EXIT SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed :=	SpeedIN.SpeedExit;
		12: //TEST SPEED FORWARD
			Run := TRUE ;
			Rev := FALSE ;
			Speed := TestSpeedIN ;
		13: //TEST SPEED REVERSE
			Run := TRUE ;
			Rev := TRUE ;
			Speed := TestSpeedIN ;
		14: //TEST ANALOG SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed := AnalogSpeedIN ;
		15: //TEST REDUCED SEAMING SPEED
			Run := TRUE ;
			Rev := FALSE ;
			Speed := SpeedIN.SpeedSeamSlow ;
	END_CASE

END_FUNCTION_BLOCK

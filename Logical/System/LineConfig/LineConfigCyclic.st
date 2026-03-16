(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: LineConfig
 * File: LineConfigCyclic.st
 * Author: nicke
 ********************************************************************)
PROGRAM _CYCLIC

	Perms.FLIPARMS1 := 4 ;
	Perms.FLIPARMS2 := 2 ;

	Perms.VersionText	:=	'S/W Version 3.1 02/26'	;
	
	// DeviceName used for mapping IO to ACOPOS 
	Ax1.Node	:=	'SL1.IF1.ST1.IF1.ST12'	;	// Alter to suit each job 
	Ax2.Node	:=	'SL1.IF1.ST1.IF1.ST15'	;	// Alter to suit each job 
	
// Servo settings 
	Ax1P.AbsMax	:=	40000				;	// Max Size of Axis 1 
	Ax1P.AbsMin	:=	3000				;	// Min Size of Axis 1 
	Ax2P.AbsMax	:=	25000				;	// Max Size of Axis 2 
	Ax2P.AbsMin	:=	2000				;	// Min Size of Axis 2 
	
	// Calculated limits for visu input 
	Ax1.Max.Upp		:=	(Ax1P.AbsMax + 50)		;	// Maximum upper limit input 
	Ax1.Max.Low		:=	(Ax1P.AbsMax/2)			;	// Maximum lower limit input 
	Ax1.Max.UppF	:=	(Ax1P.AbsMax - 2000)	;	// Maximum feed upper limit input 
	Ax1.Max.LowF	:=	(Ax1P.AbsMax - 2800)	;	// Maximum feed lower limit input 
	Ax1.Max.UppO	:=	(Ax1P.AbsMax + 50)		;	// Maximum origin upper limit input 
	Ax1.Max.LowO	:=	(Ax1P.AbsMax - 50)		;	// Maximum origin lower limit input 
	Ax1.Min.Upp		:=	(Ax1P.AbsMax/2)			;	// Minimum upper limit input 
	Ax1.Min.Low		:=	(Ax1P.AbsMin - 50)		;	// Minimum lower limit input 
	Ax1.Min.UppF	:=	(Ax1P.AbsMin + 2000)	;	// Minimum feed upper limit input 
	Ax1.Min.LowF	:=	(Ax1P.AbsMin + 3500)	;	// Minimum feed lower limit input 
	Ax2.Max.Upp		:=	(Ax2P.AbsMax + 50)		;	// Maximum upper limit input 
	Ax2.Max.Low		:=	(Ax2P.AbsMax/2)			;	// Maximum lower limit input 
	Ax2.Max.UppF	:=	(Ax2P.AbsMax - 2000)	;	// Maximum feed upper limit input 
	Ax2.Max.LowF	:=	(Ax2P.AbsMax - 2800)	;	// Maximum feed lower limit input 
	Ax2.Max.UppO	:=	(Ax2P.AbsMax + 50)		;	// Maximum origin upper limit input 
	Ax2.Max.LowO	:=	(Ax2P.AbsMax - 50)		;	// Maximum origin lower limit input 
	Ax2.Min.Upp		:=	(Ax2P.AbsMax/2)			;	// Minimum upper limit input 
	Ax2.Min.Low		:=	(Ax2P.AbsMin - 50)		;	// Minimum lower limit input 
	Ax2.Min.UppF	:=	(Ax2P.AbsMin + 2000)	;	// Minimum feed upper limit input 
	Ax2.Min.LowF	:=	(Ax2P.AbsMin + 3500)	;	// Minimum feed lower limit input 
	
	//LIMIT INPUT VALUES FOR HMI
	RowPerm.Max		:=	LIMIT(150,RowPerm.Max,2489)	;//98"
	LoadPerm.Max	:=	LIMIT(300,LoadPerm.Max,5004);//197"

END_PROGRAM



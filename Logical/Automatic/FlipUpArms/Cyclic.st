
PROGRAM _CYCLIC

	//------------------------------------------------------
	//FLIP UP ARMS FASTMAXX 1 
	//FB INPUTS
	ArmsTemp1.Down[1] := S100Reed.In ;
	ArmsTemp1.Down[2] := S102Reed.In ;
	ArmsTemp1.Down[3] := S104Reed.In ;
	ArmsTemp1.Down[4] := S106Reed.In ;
	ArmsTemp1.Down[5] := S108Reed.In ;
	ArmsTemp1.Down[6] := S110Reed.In ;
	ArmsTemp1.Down[7] := S112Reed.In ;
	ArmsTemp1.Down[8] := S114Reed.In ;
	ArmsTemp1.Up[1] := S101Reed.In ;
	ArmsTemp1.Up[2] := S103Reed.In ;
	ArmsTemp1.Up[3] := S105Reed.In ;
	ArmsTemp1.Up[4] := S107Reed.In ;
	ArmsTemp1.Up[5] := S109Reed.In ;
	ArmsTemp1.Up[6] := S111Reed.In ;
	ArmsTemp1.Up[7] := S113Reed.In ;
	ArmsTemp1.Up[8] := S115Reed.In ;
	ArmsTemp1.Arms := 4 ;
	ArmsTemp1.Raise := Ax1.RaiseArms ;
	ArmsTemp1.HiVol := Ax1.HiVol ;
	ArmsTemp1.ArmPos := ArmsPerm1.Position ;
	//CALL FB
	ArmsTemp1 ();
	//FB OUTPUTS
	Sol5Arm1.Auto := ArmsTemp1.OUT[1] ;
	Sol6Arm2.Auto := ArmsTemp1.OUT[2] ;
	Sol7Arm3.Auto := ArmsTemp1.OUT[3] ;
	Sol8Arm4.Auto := ArmsTemp1.OUT[4] ;

	//FLIP UP ARMS FASTMAXX 2
	//FB INPUTS
	ArmsTemp2.Down[1] := S120Reed.In ;
	ArmsTemp2.Down[2] := S122Reed.In ;
	ArmsTemp2.Down[3] := S124Reed.In ;
	ArmsTemp2.Down[4] := S126Reed.In ;
	ArmsTemp2.Up[1] := S121Reed.In ;
	ArmsTemp2.Up[2] := S123Reed.In ;
	ArmsTemp2.Up[3] := S125Reed.In ;
	ArmsTemp2.Up[4] := S127Reed.In ;
	ArmsTemp2.Arms := 2 ;
	ArmsTemp2.Raise := Ax2.RaiseArms ;
	ArmsTemp2.HiVol := Ax2.HiVol ;
	ArmsTemp2.ArmPos := ArmsPerm2.Position ;
	//CALL FB
	ArmsTemp2 ();
	//FB OUTPUTS
	Sol14Arm6.Auto := ArmsTemp2.OUT[1] ;
	Sol15Arm7.Auto := ArmsTemp2.OUT[2] ;
	 
END_PROGRAM

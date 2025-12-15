//*******************************************************************
// * COPYRIGHT --  
// ********************************************************************
// * Program: SensorInput
// * File: SensorInputCyclic.st
// * Author: nicke
// ********************************************************************
// * Implementation of program SensorInput
// *******************************************************************//

PROGRAM _CYCLIC

	Speeds.SpeedBatch:= LIMIT(1, Speeds.SpeedBatch, 60);
	Speeds.SpeedCntr:= LIMIT(1, Speeds.SpeedCntr, 60);
	Speeds.SpeedEntry:= LIMIT(1, Speeds.SpeedEntry, 60);
	Speeds.SpeedExit:= LIMIT(1, Speeds.SpeedExit, 60);
	Speeds.SpeedLaser:= LIMIT(1, Speeds.SpeedLaser, 60);
	Speeds.SpeedMax:= LIMIT(1, Speeds.SpeedMax, 60);
	Speeds.SpeedSeam:= LIMIT(1, Speeds.SpeedSeam, 60);
	Speeds.SpeedSlow:= LIMIT(1, Speeds.SpeedSlow, 60);
	Speeds.SpeedTrans:= LIMIT(1, Speeds.SpeedTrans, 60);
	Speeds.SpeedWash:= LIMIT(1, Speeds.SpeedWash, 60);
	Speeds.SpeedSeamSlow:= LIMIT(1, Speeds.SpeedSeamSlow, 60);

	//FILTER SENSOR 1 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor1.SensorIN := S1Photo.In ;
	Sensor1.SpeedON := Speeds.SpeedTrans ;
	Sensor1.SpeedOFF := Speeds.SpeedSeam ;
	//CALL FB
	Sensor1 ();
	//FB OUTPUT
	S1Photo.Int := Sensor1.SensorOUT ;

	//FILTER SENSOR 2 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor2.SensorIN := S2Photo.In ;
	Sensor2.SpeedON := Speeds.SpeedSlow ;
	Sensor2.SpeedOFF := Speeds.SpeedSeam ;
	//CALL FB
	Sensor2 ();
	//FB OUTPUT
	S2Photo.Int := Sensor2.SensorOUT ;

	//FILTER SENSOR 3 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor3.SensorIN := S3Photo.In ;
	Sensor3.SpeedON := Speeds.SpeedSeam ;
	Sensor3.SpeedOFF := Speeds.SpeedSeam ;
	//CALL FB
	Sensor3 ();
	//FB OUTPUT
	S3Photo.Int := Sensor3.SensorOUT ;

	//FILTER SENSOR 4 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor4.SensorIN := S4Photo.In ;
	Sensor4.SpeedON := Speeds.SpeedSeam ;
	Sensor4.SpeedOFF := Speeds.SpeedSeam ;
	//CALL FB
	Sensor4 ();
	//FB OUTPUT
	S4Photo.Int := Sensor4.SensorOUT ;

	//FILTER SENSOR 5 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor5.SensorIN := S5Photo.In ;
	Sensor5.SpeedON := Speeds.SpeedTrans ;
	Sensor5.SpeedOFF := Speeds.SpeedSeam ;
	//CALL FB
	Sensor5 ();
	//FB OUTPUT
	S5Photo.Int := Sensor5.SensorOUT ;

	//FILTER SENSOR 6 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor6.SensorIN := S6Photo.In ;
	Sensor6.SpeedON := Speeds.SpeedSlow ;
	Sensor6.SpeedOFF := Speeds.SpeedSeam ;
	//CALL FB
	Sensor6 ();
	//FB OUTPUT
	S6Photo.Int := Sensor6.SensorOUT ;

	//FILTER SENSOR 7 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor7.SensorIN := S7Photo.In ;
	Sensor7.SpeedON := Speeds.SpeedSeam ;
	Sensor7.SpeedOFF := Speeds.SpeedSeam ;
	//CALL FB
	Sensor7 ();
	//FB OUTPUT
	S7Photo.Int := Sensor7.SensorOUT ;

	//FILTER SENSOR 8 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor8.SensorIN := S8Photo.In ;
	Sensor8.SpeedON := Speeds.SpeedSeam ;
	Sensor8.SpeedOFF := Speeds.SpeedSeam ;
	//CALL FB
	Sensor8 ();
	//FB OUTPUT
	S8Photo.Int := Sensor8.SensorOUT ;

	//FILTER SENSOR 9 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor9.SensorIN := S9Photo.In ;
	Sensor9.SpeedON := Speeds.SpeedSeam ;
	Sensor9.SpeedOFF := Speeds.SpeedSeam ;
	//CALL FB
	Sensor9 ();
	//FB OUTPUT
	S9Photo.Int := Sensor9.SensorOUT ;

	//FILTER SENSOR 12 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor12.SensorIN := S12Photo.In ;
	Sensor12.SpeedON := Speeds.SpeedSeam ;
	Sensor12.SpeedOFF := Speeds.SpeedTrans ;
	//CALL FB
	Sensor12 ();
	//FB OUTPUT
	S12Photo.Int := Sensor12.SensorOUT ;

	//FILTER SENSOR 13 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor13.SensorIN := S13Photo.In ;
	Sensor13.SpeedON := Speeds.SpeedExit ;
	Sensor13.SpeedOFF := Speeds.SpeedExit ;
	//CALL FB
	Sensor13 ();
	//FB OUTPUT
	S13Photo.Int := Sensor13.SensorOUT ;

	//FILTER SENSOR 14 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor14.SensorIN := S14Photo.In ;
	Sensor14.SpeedON := Speeds.SpeedExit ;
	Sensor14.SpeedOFF := Speeds.SpeedExit ;
	//CALL FB
	Sensor14 ();
	//FB OUTPUT
	S14Photo.Int := Sensor14.SensorOUT ;

	//FILTER SENSOR 15 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor15.SensorIN := S15Photo.In ;
	Sensor15.SpeedON := Speeds.SpeedExit ;
	Sensor15.SpeedOFF := Speeds.SpeedExit ;
	//CALL FB
	Sensor15 ();
	//FB OUTPUT
	S15Photo.Int := Sensor15.SensorOUT ;

	//FILTER SENSOR 16 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor16.SensorIN := S16Photo.In ;
	Sensor16.SpeedON := Speeds.SpeedExit ;
	Sensor16.SpeedOFF := Speeds.SpeedExit ;
	//CALL FB
	Sensor16 ();
	//FB OUTPUT
	S16Photo.Int := Sensor16.SensorOUT ;

	//FILTER SENSOR 17 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor17.SensorIN := S17Photo.In ;
	Sensor17.SpeedON := Speeds.SpeedExit ;
	Sensor17.SpeedOFF := Speeds.SpeedExit ;
	//CALL FB
	Sensor17 ();
	//FB OUTPUT
	S17Photo.Int := Sensor17.SensorOUT ;

	//FILTER SENSOR 18 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor18.SensorIN := S18Photo.In ;
	Sensor18.SpeedON := Speeds.SpeedCntr ;
	Sensor18.SpeedOFF := Speeds.SpeedCntr ;
	//CALL FB
	Sensor18 ();
	//FB OUTPUT
	S18Photo.Int := Sensor18.SensorOUT ;

	//FILTER SENSOR 19 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor19.SensorIN := S19Photo.In ;
	Sensor19.SpeedON := Speeds.SpeedBatch ;
	Sensor19.SpeedOFF := Speeds.SpeedBatch ;
	//CALL FB
	Sensor19 ();
	//FB OUTPUT
	S19Photo.Int := Sensor19.SensorOUT ;

	//FILTER SENSOR 20 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor20.SensorIN := S20Photo.In ;
	Sensor20.SpeedON := Speeds.SpeedBatch ;
	Sensor20.SpeedOFF := Speeds.SpeedBatch ;
	//CALL FB
	Sensor20 ();
	//FB OUTPUT
	S20Photo.Int := Sensor20.SensorOUT ;

	//FILTER SENSOR 21 INPUT TO ELIMINATE FALSE READINGS
	//FB INPUTS
	Sensor21.SensorIN := S21Photo.In ;
	Sensor21.SpeedON := Speeds.SpeedBatch ;
	Sensor21.SpeedOFF := Speeds.SpeedWash ;
	//CALL FB
	Sensor21 ();
	//FB OUTPUT
	S21Photo.Int := Sensor21.SensorOUT ;

END_PROGRAM




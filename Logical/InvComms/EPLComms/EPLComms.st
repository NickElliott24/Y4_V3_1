(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: EPLComms
 * File: EPLComms.st
 ********************************************************************
 * Implementation of program EPLComms
 ********************************************************************)

PROGRAM _INIT

	IF NOT(InvPerms.SetValues) THEN
		InvPerms.CL1.Accel  :=  5   ;
		InvPerms.CL1.Decel  :=  5   ;
		InvPerms.CS1.Accel  :=  5   ;
		InvPerms.CS1.Decel  :=  5   ;
		InvPerms.CV1.Accel  :=  5   ;
		InvPerms.CV1.Decel  :=  5   ;
		InvPerms.CC1.Accel  :=  5   ;
		InvPerms.CC1.Decel  :=  5   ;
		InvPerms.CC2.Accel  :=  5   ;
		InvPerms.CC2.Decel  :=  5   ;
		InvPerms.CS2.Accel  :=  5   ;
		InvPerms.CS2.Decel  :=  5   ;
		InvPerms.CV2.Accel  :=  5   ;
		InvPerms.CV2.Decel  :=  5   ;
		InvPerms.CC3.Accel  :=  5   ;
		InvPerms.CC3.Decel  :=  5   ;
		InvPerms.CC4.Accel  :=  5   ;
		InvPerms.CC4.Decel  :=  5   ;
		InvPerms.CB1.Accel  :=  5   ;
		InvPerms.CB1.Decel  :=  5   ;
		InvPerms.CB2.Accel  :=  5   ;
		InvPerms.CB2.Decel  :=  5   ;
		InvPerms.CRB.Accel  :=  5   ;
		InvPerms.CRB.Decel  :=  5   ;
		InvPerms.CRE.Accel  :=  5   ;
		InvPerms.CRE.Decel  :=  5   ;
		InvPerms.CLB.Accel  :=  5   ;
		InvPerms.CLB.Decel  :=  5   ;
		InvPerms.SetValues  :=  TRUE    ;
	END_IF

	EPL.State   :=  EPL_START   ;
	InvTemps    :=  InvPerms    ;

END_PROGRAM


PROGRAM _CYCLIC

    //SET LIMITS FOR ACCEL, 0.1 - 3 SECONDS
	InvTemps.CL1.Accel := LIMIT(1,InvTemps.CL1.Accel,30);
	InvTemps.CS1.Accel := LIMIT(1,InvTemps.CS1.Accel,30);
	InvTemps.CV1.Accel := LIMIT(1,InvTemps.CV1.Accel,30);
	InvTemps.CC1.Accel := LIMIT(1,InvTemps.CC1.Accel,30);
	InvTemps.CC2.Accel := LIMIT(1,InvTemps.CC2.Accel,30);
	InvTemps.CS2.Accel := LIMIT(1,InvTemps.CS2.Accel,30);
	InvTemps.CV2.Accel := LIMIT(1,InvTemps.CV2.Accel,30);
	InvTemps.CC3.Accel := LIMIT(1,InvTemps.CC3.Accel,30);
	InvTemps.CC4.Accel := LIMIT(1,InvTemps.CC4.Accel,30);
	InvTemps.CB1.Accel := LIMIT(1,InvTemps.CB1.Accel,30);
	InvTemps.CB2.Accel := LIMIT(1,InvTemps.CB2.Accel,30);
	InvTemps.CRB.Accel := LIMIT(1,InvTemps.CRB.Accel,30);
	InvTemps.CRE.Accel := LIMIT(1,InvTemps.CRE.Accel,30);
	InvTemps.CLB.Accel := LIMIT(1,InvTemps.CLB.Accel,30);
	//SET LIMITS FOR DECEL, 0.1 - 3 SECONDS
	InvTemps.CL1.Decel := LIMIT(1,InvTemps.CL1.Decel,30);
	InvTemps.CS1.Decel := LIMIT(1,InvTemps.CS1.Decel,30);
	InvTemps.CV1.Decel := LIMIT(1,InvTemps.CV1.Decel,30);
	InvTemps.CC1.Decel := LIMIT(1,InvTemps.CC1.Decel,30);
	InvTemps.CC2.Decel := LIMIT(1,InvTemps.CC2.Decel,30);
	InvTemps.CS2.Decel := LIMIT(1,InvTemps.CS2.Decel,30);
	InvTemps.CV2.Decel := LIMIT(1,InvTemps.CV2.Decel,30);
	InvTemps.CC3.Decel := LIMIT(1,InvTemps.CC3.Decel,30);
	InvTemps.CC4.Decel := LIMIT(1,InvTemps.CC4.Decel,30);
	InvTemps.CB1.Decel := LIMIT(1,InvTemps.CB1.Decel,30);
	InvTemps.CB2.Decel := LIMIT(1,InvTemps.CB2.Decel,30);
	InvTemps.CRB.Decel := LIMIT(1,InvTemps.CRB.Decel,30);
	InvTemps.CRE.Decel := LIMIT(1,InvTemps.CRE.Decel,30);
	InvTemps.CLB.Decel := LIMIT(1,InvTemps.CLB.Decel,30);

	CASE EPL.State OF
		EPL_START:
			IF(EPLState.LinkOK) THEN
				IF(EPLState.CycleOK) THEN
					IF(EPLState.SyncOK) THEN
						EPL.State   :=  EPL_INV1_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV1_ACCCHECK:
			IF(CL1.Module.OK) THEN
				IF(EPL.INV.ACC[1]) THEN
					IF(InvTemps.CL1.Accel <> InvPerms.CL1.Accel) THEN
						EPL.Param.WriteData := InvTemps.CL1.Accel;
						EPL.State := EPL_INV1_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CL1.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CL1.Accel;
						EPL.State := EPL_INV1_ACCWRITE;
					ELSE
						EPL.State := EPL_INV1_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV1_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST4');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 4;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[1] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CL1.Accel := InvTemps.CL1.Accel;
				ELSE
					EPL.State := EPL_INV1_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV1_DECCHECK:
			IF(CL1.Module.OK) THEN
				IF(EPL.INV.DEC[1]) THEN
					IF(InvTemps.CL1.Decel <> InvPerms.CL1.Decel) THEN
						EPL.Param.WriteData := InvTemps.CL1.Decel;
						EPL.State := EPL_INV1_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CL1.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CL1.Decel;
						EPL.State := EPL_INV1_DECWRITE;
					ELSE
						EPL.State := EPL_INV2_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV1_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST4');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 4;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[1] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CL1.Decel := InvTemps.CL1.Decel;
				ELSE
					EPL.State := EPL_INV2_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV2_ACCCHECK:
			IF(CS1.Module.OK) THEN
				IF(EPL.INV.ACC[2]) THEN
					IF(InvTemps.CS1.Accel <> InvPerms.CS1.Accel) THEN
						EPL.Param.WriteData := InvTemps.CS1.Accel;
						EPL.State := EPL_INV2_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CS1.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CS1.Accel;
						EPL.State := EPL_INV2_ACCWRITE;
					ELSE
						EPL.State := EPL_INV2_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV2_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST5');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 5;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[2] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CS1.Accel := InvTemps.CS1.Accel;
				ELSE
					EPL.State := EPL_INV2_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV2_DECCHECK:
			IF(CS1.Module.OK) THEN
				IF(EPL.INV.DEC[2]) THEN
					IF(InvTemps.CS1.Decel <> InvPerms.CS1.Decel) THEN
						EPL.Param.WriteData := InvTemps.CS1.Decel;
						EPL.State := EPL_INV2_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CS1.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CS1.Decel;
						EPL.State := EPL_INV2_DECWRITE;
					ELSE
						EPL.State := EPL_INV3_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV2_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST5');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 5;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[2] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CS1.Decel := InvTemps.CS1.Decel;
				ELSE
					EPL.State := EPL_INV3_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV3_ACCCHECK:
			IF(CV1.Module.OK) THEN
				IF(EPL.INV.ACC[3]) THEN
					IF(InvTemps.CV1.Accel <> InvPerms.CV1.Accel) THEN
						EPL.Param.WriteData := InvTemps.CV1.Accel;
						EPL.State := EPL_INV3_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CV1.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CV1.Accel;
						EPL.State := EPL_INV3_ACCWRITE;
					ELSE
						EPL.State := EPL_INV3_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV3_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST6');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 6;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[3] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CV1.Accel := InvTemps.CV1.Accel;
				ELSE
					EPL.State := EPL_INV3_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV3_DECCHECK:
			IF(CV1.Module.OK) THEN
				IF(EPL.INV.DEC[3]) THEN
					IF(InvTemps.CV1.Decel <> InvPerms.CV1.Decel) THEN
						EPL.Param.WriteData := InvTemps.CV1.Decel;
						EPL.State := EPL_INV3_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CV1.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CV1.Decel;
						EPL.State := EPL_INV3_DECWRITE;
					ELSE
						EPL.State := EPL_INV4_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV3_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST6');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 6;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[3] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CV1.Decel := InvTemps.CV1.Decel;
				ELSE
					EPL.State := EPL_INV4_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV4_ACCCHECK:
			IF(CC1.Module.OK) THEN
				IF(EPL.INV.ACC[4]) THEN
					IF(InvTemps.CC1.Accel <> InvPerms.CC1.Accel) THEN
						EPL.Param.WriteData := InvTemps.CC1.Accel;
						EPL.State := EPL_INV4_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CC1.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CC1.Accel;
						EPL.State := EPL_INV4_ACCWRITE;
					ELSE
						EPL.State := EPL_INV4_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV4_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST7');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 7;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[4] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CC1.Accel := InvTemps.CC1.Accel;
				ELSE
					EPL.State := EPL_INV4_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV4_DECCHECK:
			IF(CC1.Module.OK) THEN
				IF(EPL.INV.DEC[4]) THEN
					IF(InvTemps.CC1.Decel <> InvPerms.CC1.Decel) THEN
						EPL.Param.WriteData := InvTemps.CC1.Decel;
						EPL.State := EPL_INV4_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CC1.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CC1.Decel;
						EPL.State := EPL_INV4_DECWRITE;
					ELSE
						EPL.State := EPL_INV5_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV4_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST7');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 7;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[4] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CC1.Decel := InvTemps.CC1.Decel;
				ELSE
					EPL.State := EPL_INV5_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV5_ACCCHECK:
			IF(CC2.Module.OK) THEN
				IF(EPL.INV.ACC[5]) THEN
					IF(InvTemps.CC2.Accel <> InvPerms.CC2.Accel) THEN
						EPL.Param.WriteData := InvTemps.CC2.Accel;
						EPL.State := EPL_INV5_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CC2.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CC2.Accel;
						EPL.State := EPL_INV5_ACCWRITE;
					ELSE
						EPL.State := EPL_INV5_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV5_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST8');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 8;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[5] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CC2.Accel := InvTemps.CC2.Accel;
				ELSE
					EPL.State := EPL_INV5_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV5_DECCHECK:
			IF(CC2.Module.OK) THEN
				IF(EPL.INV.DEC[5]) THEN
					IF(InvTemps.CC2.Decel <> InvPerms.CC2.Decel) THEN
						EPL.Param.WriteData := InvTemps.CC2.Decel;
						EPL.State := EPL_INV5_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CC2.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CC2.Decel;
						EPL.State := EPL_INV5_DECWRITE;
					ELSE
						EPL.State := EPL_INV6_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV5_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST8');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 8;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[5] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CC2.Decel := InvTemps.CC2.Decel;
				ELSE
					EPL.State := EPL_INV6_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV6_ACCCHECK:
			IF(CS2.Module.OK) THEN
				IF(EPL.INV.ACC[6]) THEN
					IF(InvTemps.CS2.Accel <> InvPerms.CS2.Accel) THEN
						EPL.Param.WriteData := InvTemps.CS2.Accel;
						EPL.State := EPL_INV6_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CS2.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CS2.Accel;
						EPL.State := EPL_INV6_ACCWRITE;
					ELSE
						EPL.State := EPL_INV6_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV6_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST9');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 9;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[6] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CS2.Accel := InvTemps.CS2.Accel;
				ELSE
					EPL.State := EPL_INV6_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV6_DECCHECK:
			IF(CS2.Module.OK) THEN
				IF(EPL.INV.DEC[6]) THEN
					IF(InvTemps.CS2.Decel <> InvPerms.CS2.Decel) THEN
						EPL.Param.WriteData := InvTemps.CS2.Decel;
						EPL.State := EPL_INV6_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CS2.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CS2.Decel;
						EPL.State := EPL_INV6_DECWRITE;
					ELSE
						EPL.State := EPL_INV7_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV6_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST9');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 9;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[6] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CS2.Decel := InvTemps.CS2.Decel;
				ELSE
					EPL.State := EPL_INV7_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV7_ACCCHECK:
			IF(CV2.Module.OK) THEN
				IF(EPL.INV.ACC[7]) THEN
					IF(InvTemps.CV2.Accel <> InvPerms.CV2.Accel) THEN
						EPL.Param.WriteData := InvTemps.CV2.Accel;
						EPL.State := EPL_INV7_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CV2.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CV2.Accel;
						EPL.State := EPL_INV7_ACCWRITE;
					ELSE
						EPL.State := EPL_INV7_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV7_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST10');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 10;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[7] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CV2.Accel := InvTemps.CV2.Accel;
				ELSE
					EPL.State := EPL_INV7_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV7_DECCHECK:
			IF(CV2.Module.OK) THEN
				IF(EPL.INV.DEC[7]) THEN
					IF(InvTemps.CV2.Decel <> InvPerms.CV2.Decel) THEN
						EPL.Param.WriteData := InvTemps.CV2.Decel;
						EPL.State := EPL_INV7_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CV2.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CV2.Decel;
						EPL.State := EPL_INV7_DECWRITE;
					ELSE
						EPL.State := EPL_INV8_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV7_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST10');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 10;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[7] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CV2.Decel := InvTemps.CV2.Decel;
				ELSE
					EPL.State := EPL_INV8_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV8_ACCCHECK:
			IF(CC3.Module.OK) THEN
				IF(EPL.INV.ACC[8]) THEN
					IF(InvTemps.CC3.Accel <> InvPerms.CC3.Accel) THEN
						EPL.Param.WriteData := InvTemps.CC3.Accel;
						EPL.State := EPL_INV8_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CC3.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CC3.Accel;
						EPL.State := EPL_INV8_ACCWRITE;
					ELSE
						EPL.State := EPL_INV8_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV8_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST11');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 11;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[8] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CC3.Accel := InvTemps.CC3.Accel;
				ELSE
					EPL.State := EPL_INV8_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV8_DECCHECK:
			IF(CC3.Module.OK) THEN
				IF(EPL.INV.DEC[8]) THEN
					IF(InvTemps.CC3.Decel <> InvPerms.CC3.Decel) THEN
						EPL.Param.WriteData := InvTemps.CC3.Decel;
						EPL.State := EPL_INV8_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CC3.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CC3.Decel;
						EPL.State := EPL_INV8_DECWRITE;
					ELSE
						EPL.State := EPL_INV9_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV8_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST11');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 11;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[8] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CC3.Decel := InvTemps.CC3.Decel;
				ELSE
					EPL.State := EPL_INV9_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV9_ACCCHECK:
			IF(CC4.Module.OK) THEN
				IF(EPL.INV.ACC[9]) THEN
					IF(InvTemps.CC4.Accel <> InvPerms.CC4.Accel) THEN
						EPL.Param.WriteData := InvTemps.CC4.Accel;
						EPL.State := EPL_INV9_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CC4.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CC4.Accel;
						EPL.State := EPL_INV9_ACCWRITE;
					ELSE
						EPL.State := EPL_INV9_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV9_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST12');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 12;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[9] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CC4.Accel := InvTemps.CC4.Accel;
				ELSE
					EPL.State := EPL_INV9_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV9_DECCHECK:
			IF(CC4.Module.OK) THEN
				IF(EPL.INV.DEC[9]) THEN
					IF(InvTemps.CC4.Decel <> InvPerms.CC4.Decel) THEN
						EPL.Param.WriteData := InvTemps.CC4.Decel;
						EPL.State := EPL_INV9_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CC4.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CC4.Decel;
						EPL.State := EPL_INV9_DECWRITE;
					ELSE
						EPL.State := EPL_INV10_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV9_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST12');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 12;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[9] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CC4.Decel := InvTemps.CC4.Decel;
				ELSE
					EPL.State := EPL_INV10_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV10_ACCCHECK:
			IF(CB1.Module.OK) THEN
				IF(EPL.INV.ACC[10]) THEN
					IF(InvTemps.CB1.Accel <> InvPerms.CB1.Accel) THEN
						EPL.Param.WriteData := InvTemps.CB1.Accel;
						EPL.State := EPL_INV10_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CB1.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CB1.Accel;
						EPL.State := EPL_INV10_ACCWRITE;
					ELSE
						EPL.State := EPL_INV10_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV10_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST13');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 13;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[10] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CB1.Accel := InvTemps.CB1.Accel;
				ELSE
					EPL.State := EPL_INV10_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV10_DECCHECK:
			IF(CB1.Module.OK) THEN
				IF(EPL.INV.DEC[10]) THEN
					IF(InvTemps.CB1.Decel <> InvPerms.CB1.Decel) THEN
						EPL.Param.WriteData := InvTemps.CB1.Decel;
						EPL.State := EPL_INV10_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CB1.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CB1.Decel;
						EPL.State := EPL_INV10_DECWRITE;
					ELSE
						EPL.State := EPL_INV11_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV10_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST13');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 13;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[10] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CB1.Decel := InvTemps.CB1.Decel;
				ELSE
					EPL.State := EPL_INV11_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV11_ACCCHECK:
			IF(CB2.Module.OK) THEN
				IF(EPL.INV.ACC[11]) THEN
					IF(InvTemps.CB2.Accel <> InvPerms.CB2.Accel) THEN
						EPL.Param.WriteData := InvTemps.CB2.Accel;
						EPL.State := EPL_INV11_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CB2.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CB2.Accel;
						EPL.State := EPL_INV11_ACCWRITE;
					ELSE
						EPL.State := EPL_INV11_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV11_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST14');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 14;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[11] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CB2.Accel := InvTemps.CB2.Accel;
				ELSE
					EPL.State := EPL_INV11_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV11_DECCHECK:
			IF(CB2.Module.OK) THEN
				IF(EPL.INV.DEC[11]) THEN
					IF(InvTemps.CB2.Decel <> InvPerms.CB2.Decel) THEN
						EPL.Param.WriteData := InvTemps.CB2.Decel;
						EPL.State := EPL_INV11_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CB2.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CB2.Decel;
						EPL.State := EPL_INV11_DECWRITE;
					ELSE
						EPL.State := EPL_INV12_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV11_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST14');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 14;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[11] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CB2.Decel := InvTemps.CB2.Decel;
				ELSE
					EPL.State := EPL_INV12_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV12_ACCCHECK:
			IF(CRB.Module.OK) THEN
				IF(EPL.INV.ACC[12]) THEN
					IF(InvTemps.CRB.Accel <> InvPerms.CRB.Accel) THEN
						EPL.Param.WriteData := InvTemps.CRB.Accel;
						EPL.State := EPL_INV12_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CRB.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CRB.Accel;
						EPL.State := EPL_INV12_ACCWRITE;
					ELSE
						EPL.State := EPL_INV12_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV12_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST15');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 15;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[12] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CRB.Accel := InvTemps.CRB.Accel;
				ELSE
					EPL.State := EPL_INV12_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV12_DECCHECK:
			IF(CRB.Module.OK) THEN
				IF(EPL.INV.DEC[12]) THEN
					IF(InvTemps.CRB.Decel <> InvPerms.CRB.Decel) THEN
						EPL.Param.WriteData := InvTemps.CRB.Decel;
						EPL.State := EPL_INV12_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CRB.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CRB.Decel;
						EPL.State := EPL_INV12_DECWRITE;
					ELSE
						EPL.State := EPL_INV13_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV12_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST15');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 15;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[12] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CRB.Decel := InvTemps.CRB.Decel;
				ELSE
					EPL.State := EPL_INV13_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV13_ACCCHECK:
			IF(CRE.Module.OK) THEN
				IF(EPL.INV.ACC[13]) THEN
					IF(InvTemps.CRE.Accel <> InvPerms.CRE.Accel) THEN
						EPL.Param.WriteData := InvTemps.CRE.Accel;
						EPL.State := EPL_INV13_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CRE.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CRE.Accel;
						EPL.State := EPL_INV13_ACCWRITE;
					ELSE
						EPL.State := EPL_INV13_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV13_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST16');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 16;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[13] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CRE.Accel := InvTemps.CRE.Accel;
				ELSE
					EPL.State := EPL_INV13_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV13_DECCHECK:
			IF(CRE.Module.OK) THEN
				IF(EPL.INV.DEC[13]) THEN
					IF(InvTemps.CRE.Decel <> InvPerms.CRE.Decel) THEN
						EPL.Param.WriteData := InvTemps.CRE.Decel;
						EPL.State := EPL_INV13_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CRE.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CRE.Decel;
						EPL.State := EPL_INV13_DECWRITE;
					ELSE
						EPL.State := EPL_INV14_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV13_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST16');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 16;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[13] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CRE.Decel := InvTemps.CRE.Decel;
				ELSE
					EPL.State := EPL_INV14_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV14_ACCCHECK:
			IF(CLB.Module.OK) THEN
				IF(EPL.INV.ACC[14]) THEN
					IF(InvTemps.CLB.Accel <> InvPerms.CLB.Accel) THEN
						EPL.Param.WriteData := InvTemps.CLB.Accel;
						EPL.State := EPL_INV14_ACCWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.ACCIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CLB.Accel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CLB.Accel;
						EPL.State := EPL_INV14_ACCWRITE;
					ELSE
						EPL.State := EPL_INV14_DECCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV14_ACCWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST17');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 17;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 2;  //SUBINDEX #2 (DEC 2) : ACCELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.ACC[14] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.ACCIndex := 0;
					InvPerms.CLB.Accel := InvTemps.CLB.Accel;
				ELSE
					EPL.State := EPL_INV14_DECCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.ACCIndex := 0;
			END_IF

		EPL_INV14_DECCHECK:
			IF(CLB.Module.OK) THEN
				IF(EPL.INV.DEC[14]) THEN
					IF(InvTemps.CLB.Decel <> InvPerms.CLB.Decel) THEN
						EPL.Param.WriteData := InvTemps.CLB.Decel;
						EPL.State := EPL_INV14_DECWRITE;
					ELSE
						EPL.State := EPL_WAIT;
						EPL.INV.DECIndex := 0;
					END_IF
				ELSE
					IF(InvPerms.CLB.Decel <> 5) THEN
						EPL.Param.WriteData := InvPerms.CLB.Decel;
						EPL.State := EPL_INV14_DECWRITE;
					ELSE
						EPL.State := EPL_INV15_ACCCHECK;
					END_IF
				END_IF
			END_IF

		EPL_INV14_DECWRITE:

			EPL.FUB.EPLWrite_0.enable := 1;  //ENABLE FUB
			EPL.FUB.EPLWrite_0.pDevice := ADR('SL1.IF1.ST17');  //DEVICE NAME OF INVERTER
			EPL.FUB.EPLWrite_0.node := 17;  //NODE NUMBER OF THE STATION
			EPL.FUB.EPLWrite_0.index := 8252;  //WRITE INDEX 16#203C (DEC 8252)
			EPL.FUB.EPLWrite_0.subindex := 3;  //SUBINDEX #2 (DEC 2) : DECELERATION RAMP
			EPL.FUB.EPLWrite_0.pData := ADR(EPL.Param.WriteData);  //POINTER TO THE DATA BEING WRITTEN
			EPL.FUB.EPLWrite_0.datalen := SIZEOF(EPL.Param.WriteData);  //SIZE OF THE DATA TO BE WRITTEN
			EPL.FUB.EPLWrite_0();

			IF EPL.FUB.EPLWrite_0.status = 0 THEN  //WRITE SUCCESSFUL
				EPL.FUB.EPLWrite_0.enable := 0;  //DISABLE THE FUB
				IF EPL.INV.DEC[14] THEN
					EPL.State := EPL_WAIT;
					EPL.INV.DECIndex := 0;
					InvPerms.CLB.Decel := InvTemps.CLB.Decel;
				ELSE
					EPL.State := EPL_INV15_ACCCHECK;
				END_IF
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_BUSY THEN
				//BUSY
			ELSIF EPL.FUB.EPLWrite_0.status = ERR_FUB_ENABLE_FALSE THEN
				//DISABLED
			ELSE
				EPL.State := EPL_ERROR;
				EPL.INV.DECIndex := 0;
			END_IF

		EPL_INV15_ACCCHECK:
			EPL.State := EPL_WAIT;

		EPL_WAIT:

			FOR i := 0 TO 26 DO
				EPL.INV.ACC[i]  :=  0   ;
				EPL.INV.DEC[i]  :=  0   ;
			END_FOR

			CASE EPL.INV.ACCIndex OF
				0:
				1..26:
					EPL.INV.ACC[EPL.INV.ACCIndex] :=    TRUE    ;
					EPL.State   :=  (EPL.INV.ACCIndex * 10) ;//EPL_INV*_ACCCHECK
			END_CASE

			CASE EPL.INV.DECIndex OF
				0:
				1..26:
					EPL.INV.DEC[EPL.INV.DECIndex] :=    TRUE    ;
					EPL.State   :=  (EPL.INV.DECIndex * 10) + 2 ;//EPL_INV*_DECCHECK
			END_CASE

		EPL_ERROR:

			EPL.ErrorCode := EPL.FUB.EPLWrite_0.errorinfo;
			EPL.Status := EPL.FUB.EPLWrite_0.status;
			EPL.Errorcount := EPL.Errorcount + 1;
			EPL.State := EPL_WAIT;
			EPL.FUB.EPLWrite_0.enable := 0; 

	END_CASE

END_PROGRAM

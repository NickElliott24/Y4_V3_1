(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Program: IPConfig
 * File: IPConfigCyclic.st
 * Author: wallisj
 * Created: July 17, 2008
 ********************************************************************
 * Implementation of program IPConfig
 ********************************************************************)

PROGRAM _CYCLIC

(*----------------------------------------------------------------------------------*)
(* Flag control for reading the Ethernet settings									*)
(*----------------------------------------------------------------------------------*)
	IF (ReadEthernetSettings = TRUE) THEN
 		ReadInaNode 			:= TRUE;
		ReadIPAddr				:= TRUE;
		ReadSubnetMask			:= TRUE;
		ReadDefaultGateway		:= TRUE;
		ReadBroadcastAddr		:= TRUE;	
		ReadEthernetSettings	:= FALSE;
	END_IF

(*----------------------------------------------------------------------------------*)
(* Flag control for writing the Ethernet settings									*)
(*----------------------------------------------------------------------------------*)
	IF (WriteEthernetSettings = TRUE) THEN
 		WriteIPAddr				:= TRUE;
		WriteSubnetMask			:= TRUE;
		WriteDefaultGateway		:= TRUE;
		WriteBroadcastAddr		:= TRUE;	
		WriteEthernetSettings	:= FALSE;
	END_IF
	
(*----------------------------------------------------------------------------------*)
(* Read in the INA node number														*)
(*----------------------------------------------------------------------------------*)
	CfgGetInaNode_0.enable 		:= ReadInaNode;
	CfgGetInaNode_0.pDevice 	:= ADR('IF3');
 	CfgGetInaNode_0();
	
	IF(CfgGetInaNode_0.status = 0) THEN
		InaNodeNumber			:= CfgGetInaNode_0.InaNode;
		ReadInaNode				:= FALSE;
	ELSIF(CfgGetInaNode_0.status = 65534) THEN
		(* function block call disabled *)
	ELSIF(CfgGetInaNode_0.status = 65535) THEN
		(* function block busy *)
	ELSE
		(* error recording *)
		ReadInaNodeError 		:= CfgGetInaNode_0.status;
	END_IF
	
(*----------------------------------------------------------------------------------*)
(* Read in the IP address 															*)
(*----------------------------------------------------------------------------------*)
	CfgGetIPAddr_0.enable 		:= ReadIPAddr;
	CfgGetIPAddr_0.pDevice 		:= ADR('IF3');
	CfgGetIPAddr_0.pIPAddr		:= ADR(ActIPAddr);
 	CfgGetIPAddr_0.Len			:= 16;
 	CfgGetIPAddr_0();
	
	IF(CfgGetIPAddr_0.status = 0) THEN
		ReadIPAddr				:= FALSE;		
	ELSIF(CfgGetIPAddr_0.status = 65534) THEN		
		(* function block call disabled *)	
	ELSIF(CfgGetIPAddr_0.status = 65535) THEN	
		(* function block busy *)
	ELSE
		(* error recording *)
		ReadIPAddrError 		:= CfgGetIPAddr_0.status;
	END_IF
	
(*----------------------------------------------------------------------------------*)
(* Read in the subnet mask															*)
(*----------------------------------------------------------------------------------*)
	CfgGetSubnetMask_0.enable 		:= ReadSubnetMask;
	CfgGetSubnetMask_0.pDevice 		:= ADR('IF3');
	CfgGetSubnetMask_0.pSubnetMask	:= ADR(ActSubnetMask);
 	CfgGetSubnetMask_0.Len			:= 16;
 	CfgGetSubnetMask_0();
	
	IF(CfgGetSubnetMask_0.status = 0) THEN
		ReadSubnetMask				:= FALSE;
	ELSIF(CfgGetSubnetMask_0.status = 65534) THEN
		(* function block call disabled *)
	ELSIF(CfgGetSubnetMask_0.status = 65535) THEN
		(* function block busy *)
	ELSE
		(* error recording *)
		ReadSubnetMaskError 		:= CfgGetSubnetMask_0.status;
	END_IF

(*----------------------------------------------------------------------------------*)
(* Read in the gateway address														*)
(*----------------------------------------------------------------------------------*)
	CfgGetDefaultGateway_0.enable			:= ReadDefaultGateway;
	CfgGetDefaultGateway_0.pDevice 			:= ADR('IF3');
	CfgGetDefaultGateway_0.pGateway			:= ADR(ActDefaultGateway);
 	CfgGetDefaultGateway_0.Len				:= 16;
 	CfgGetDefaultGateway_0();
	
	IF(CfgGetDefaultGateway_0.status = 0) THEN
		ReadDefaultGateway					:= FALSE;
	ELSIF(CfgGetDefaultGateway_0.status = 65534) THEN
		(* function block call disabled *)
	ELSIF(CfgGetDefaultGateway_0.status = 65535) THEN
		(* function block busy *)
	ELSE
		(* error recording *)
		ReadDefaultGatewayError 			:= CfgGetDefaultGateway_0.status;
	END_IF
	
(*----------------------------------------------------------------------------------*)
(* Read in the broadcast address													*)
(*----------------------------------------------------------------------------------*)
	CfgGetBroadcastAddr_0.enable			:= ReadBroadcastAddr;
	CfgGetBroadcastAddr_0.pDevice 			:= ADR('IF3');
	CfgGetBroadcastAddr_0.pBroadcastAddr	:= ADR(ActBroadcastAddr);
 	CfgGetBroadcastAddr_0.Len				:= 16;
 	CfgGetBroadcastAddr_0();
	
	IF(CfgGetBroadcastAddr_0.status = 0) THEN
		ReadBroadcastAddr					:= FALSE;
	ELSIF(CfgGetBroadcastAddr_0.status = 65534) THEN
		(* function block call disabled *)
	ELSIF(CfgGetBroadcastAddr_0.status = 65535) THEN
		(* function block busy *)
	ELSE
		(* error recording *)
		ReadBroadcastAddrError 				:= CfgGetBroadcastAddr_0.status;
	END_IF

(*----------------------------------------------------------------------------------*)
(* Write the IP address 															*)
(*----------------------------------------------------------------------------------*)
	CfgSetIPAddr_0.enable 		:= WriteIPAddr;
	CfgSetIPAddr_0.pDevice 		:= ADR('IF3');
	CfgSetIPAddr_0.pIPAddr		:= ADR(SetIPAddr);
 	CfgSetIPAddr_0.Option		:= 1;
	(* Note set Option to 0 to make the value volatile and 1 to make it non volatile *)
 	CfgSetIPAddr_0();
	
	IF(CfgSetIPAddr_0.status = 0) THEN
		WriteIPAddr				:= FALSE;
	ELSIF(CfgSetIPAddr_0.status = 65534) THEN
		(* function block call disabled *)
	ELSIF(CfgSetIPAddr_0.status = 65535) THEN
		(* function block busy *)
	ELSE
		(* error recording *)
		WriteIPAddrError 		:= CfgSetIPAddr_0.status;
	END_IF

(*----------------------------------------------------------------------------------*)
(* Write the subnet mask															*)
(*----------------------------------------------------------------------------------*)
	CfgSetSubnetMask_0.enable 		:= WriteSubnetMask;
	CfgSetSubnetMask_0.pDevice 		:= ADR('IF3');
	CfgSetSubnetMask_0.pSubnetMask	:= ADR(SetSubnetMask);
 	CfgSetSubnetMask_0.Option		:= 1;
	(* Note set Option to 0 to make the value volatile and 1 to make it non volatile *)
 	CfgSetSubnetMask_0();
	
	IF(CfgSetSubnetMask_0.status = 0) THEN
		WriteSubnetMask				:= FALSE;
	ELSIF(CfgSetSubnetMask_0.status = 65534) THEN
		(* function block call disabled *)
	ELSIF(CfgSetSubnetMask_0.status = 65535) THEN
		(* function block busy *)
	ELSE
		(* error recording *)
		WriteSubnetMaskError 		:= CfgSetSubnetMask_0.status;
	END_IF

(*----------------------------------------------------------------------------------*)
(* Write the gateway address														*)
(*----------------------------------------------------------------------------------*)
	CfgSetDefaultGateway_0.enable			:= WriteDefaultGateway;
	CfgSetDefaultGateway_0.pDevice 			:= ADR('IF3');
	CfgSetDefaultGateway_0.pGateway			:= ADR(SetDefaultGateway);
 	CfgSetDefaultGateway_0.Option			:= 1;
 	(* Note set Option to 0 to make the value volatile and 1 to make it non volatile *)
	CfgSetDefaultGateway_0();
	
	IF(CfgSetDefaultGateway_0.status = 0) THEN
		WriteDefaultGateway					:= FALSE;
	ELSIF(CfgSetDefaultGateway_0.status = 65534) THEN
		(* function block call disabled *)
	ELSIF(CfgSetDefaultGateway_0.status = 65535) THEN
		(* function block busy *)
	ELSE
		(* error recording *)
		WriteDefaultGatewayError 			:= CfgSetDefaultGateway_0.status;
	END_IF

(*----------------------------------------------------------------------------------*)
(* Write the broadcast address														*)
(*----------------------------------------------------------------------------------*)
	CfgSetBroadcastAddr_0.enable			:= WriteBroadcastAddr;
	CfgSetBroadcastAddr_0.pDevice 			:= ADR('IF3');
	CfgSetBroadcastAddr_0.pBroadcastAddr	:= ADR(SetBroadcastAddr);
 	CfgSetBroadcastAddr_0.Option			:= 1;
 	(* Note set Option to 0 to make the value volatile and 1 to make it non volatile *)
	CfgSetBroadcastAddr_0();
	
	IF(CfgSetBroadcastAddr_0.status = 0) THEN
		WriteBroadcastAddr					:= FALSE;
	ELSIF(CfgSetBroadcastAddr_0.status = 65534) THEN
		(* function block call disabled *)
	ELSIF(CfgSetBroadcastAddr_0.status = 65535) THEN
		(* function block busy *)
	ELSE
		(* error recording *)
		WriteBroadcastAddrError				:= CfgSetBroadcastAddr_0.status;
	END_IF
	
(*----------------------------------------------------------------------------------*)
(* Reset the controller	- warm re-start												*)
(*----------------------------------------------------------------------------------*)
	IF (ReBoot = TRUE) THEN
 		SYSreset(1,1);
	END_IF
	
(*----------------------------------------------------------------------------------*)
(* End of task																		*)
(*----------------------------------------------------------------------------------*)
END_PROGRAM

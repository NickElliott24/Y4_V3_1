(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: IecCheck
 * File: IecCheck.fun
 * Author: NickE
 * Created: July 12, 2011
 ********************************************************************
 * Functions and function blocks of library IecCheck
 ********************************************************************)

FUNCTION CheckDivDWord : UDINT (* Check divisor for DINT and UDINT division *)
	VAR_INPUT
		divisor : UDINT;
	END_VAR
END_FUNCTION

FUNCTION CheckDivWord : UINT (* Check divisor for INT and UINT division *)
	VAR_INPUT
		divisor : UINT;
	END_VAR
END_FUNCTION

FUNCTION CheckDivByte : USINT (* Check divisor for SINT and USINT division *)
	VAR_INPUT
		divisor : USINT;
	END_VAR
END_FUNCTION

FUNCTION CheckDivReal : REAL (* Check divisor for REAL division *)
	VAR_INPUT
		divisor : REAL;
	END_VAR
END_FUNCTION

FUNCTION CheckDivLReal : LREAL (* Check divisor for LREAL division, not available for SG3 and SGC *)
	VAR_INPUT
		divisor : LREAL;
	END_VAR
END_FUNCTION

FUNCTION CheckBounds : DINT (* Check range for array access *)
	VAR_INPUT
		index : DINT;
		lower : DINT;
		upper : DINT;
	END_VAR
END_FUNCTION

FUNCTION CheckRange : DINT (* Check range for enumeration *)
	VAR_INPUT
		value : DINT;
		lower : DINT;
		upper : DINT;
	END_VAR
END_FUNCTION

FUNCTION CheckReadAccess : UDINT (* Check address when reading dynamic variables *)
	VAR_INPUT
		address : UDINT;
	END_VAR
END_FUNCTION

FUNCTION CheckWriteAccess : UDINT (* Check address when writing dynamic variables *)
	VAR_INPUT
		address : UDINT;
	END_VAR
END_FUNCTION

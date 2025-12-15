(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: IecCheck
 * Author: NickE
 * Created: July 12, 2011
 ********************************************************************
 * Implementation of library IecCheck
 ********************************************************************)

(* Check divisor for DINT and UDINT division *)
FUNCTION CheckDivDWord
	IF divisor=0 THEN
		CheckDivDWord:=1;
	ELSE
		CheckDivDWord:=divisor;
	END_IF
END_FUNCTION

(* Check divisor for INT and UINT division *)
FUNCTION CheckDivWord
	IF divisor=0 THEN
		CheckDivWord:=1;
	ELSE
		CheckDivWord:=divisor;
	END_IF
END_FUNCTION

(* Check divisor for SINT and USINT division *)
FUNCTION CheckDivByte
	IF divisor=0 THEN
		CheckDivByte:=1;
	ELSE
		CheckDivByte:=divisor;
	END_IF
END_FUNCTION

(* Check divisor for REAL division *)
FUNCTION CheckDivReal
	IF divisor=0 THEN
		CheckDivReal:=1;
	ELSE
		CheckDivReal:=divisor;
	END_IF
END_FUNCTION

(* Check divisor for LREAL division *)
FUNCTION CheckDivLReal
	IF divisor=0 THEN
		CheckDivLReal:=1;
	ELSE
		CheckDivLReal:=divisor;
	END_IF
END_FUNCTION

(* Check range for array access *)
FUNCTION CheckBounds
	IF index < lower THEN
		CheckBounds := lower;
	ELSIF index > upper THEN
		CheckBounds := upper;
	ELSE
		CheckBounds := index;
	END_IF
END_FUNCTION

(* Check range for enumeration *)
FUNCTION CheckRange
	IF value < lower THEN
		CheckRange := lower;
	ELSIF value > upper THEN
		CheckRange := upper;
	ELSE
		CheckRange := value;
	END_IF
END_FUNCTION

(* Check address when reading dynamic variables *)
FUNCTION CheckReadAccess
	IF address=0 THEN
		(* TODO: Insert an appropriate code, see AutomationStudio help for further information *)
	END_IF

	CheckReadAccess:=0;
END_FUNCTION

(* Check address when writing dynamic variables *)
FUNCTION CheckWriteAccess
	IF address=0 THEN
		(* TODO: Insert an appropriate code, see AutomationStudio help for further information *)
	END_IF

	CheckWriteAccess:=0;
END_FUNCTION

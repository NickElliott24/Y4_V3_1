(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * PROGRAM: BatchData
 * File: BatchData.st
 * Author: NickE
 ********************************************************************)

PROGRAM _INIT

	//HIDE OPTIONS SCREEN
	VisBatch.P1.Status[0]	:=	HIDE	;
	//SET DEFAULT COLOURS ON INITIAL POWER UP
	IF(CLPT2.Rev = 0) THEN
		CAPT.Clear	:=	GREY	;
		CAPT.Start	:=	RED	;
		CAPT.Slow	:=	14	;
		CLPT2.Rev	:=	1	;
	END_IF
	//SET IMPERIAL AS DEFAULT
	CAPT.Rev := 1 ;

END_PROGRAM


PROGRAM _CYCLIC

	DataFlow.IndexRow	:=	LIMIT(1,DataFlow.IndexRow,12);
	DataFlow.IndexLoad	:=	LIMIT(1,DataFlow.IndexLoad,12);

	//SCALE BATCH SIZE VALUES TO FULL HD SCREEN SIZE
	ScaleBatch.RefY1[0].x	:=	00.0	;
	ScaleBatch.RefY1[0].y	:=	00.0	;
	ScaleBatch.RefY1[1].x	:=	1000.0	;
	ScaleBatch.RefY1[1].y	:=	345.0	;	//SCALE VALUES TO PERCENTAGE OF ACTUAL SIZE
	ScaleBatch.ScaleY1.NoOfPoints	:=	2		;
	ScaleBatch.ScaleY1.ptr_table	:=	ADR(ScaleBatch.RefY1)	;

	ScaleBatch.RefWidth[0].x	:=	00.0	;
	ScaleBatch.RefWidth[0].y	:=	00.0	;
	ScaleBatch.RefWidth[1].x	:=	1000.0	;
	ScaleBatch.RefWidth[1].y	:=	345.0	;	//SCALE VALUES TO PERCENTAGE OF ACTUAL SIZE
	ScaleBatch.ScaleWidth.NoOfPoints	:=	2		;
	ScaleBatch.ScaleWidth.ptr_table	:=	ADR(ScaleBatch.RefWidth)	;

	ScaleBatch.RefLength[0].x	:=	00.0	;
	ScaleBatch.RefLength[0].y	:=	00.0	;
	ScaleBatch.RefLength[1].x	:=	1000.0	;
	ScaleBatch.RefLength[1].y	:=	345.0	;	//SCALE VALUES TO PERCENTAGE OF ACTUAL SIZE
	ScaleBatch.ScaleLength.NoOfPoints	:=	2		;
	ScaleBatch.ScaleLength.ptr_table	:=	ADR(ScaleBatch.RefLength)	;

	ScaleBatch.RefGapL[0].x	:=	00.0	;
	ScaleBatch.RefGapL[0].y	:=	00.0	;
	ScaleBatch.RefGapL[1].x	:=	1000.0	;
	ScaleBatch.RefGapL[1].y	:=	345.0	;	//SCALE VALUES TO PERCENTAGE OF ACTUAL SIZE
	ScaleBatch.ScaleGapL.NoOfPoints	:=	2		;
	ScaleBatch.ScaleGapL.ptr_table	:=	ADR(ScaleBatch.RefGapL)	;

	ScaleBatch.RefGapW[0].x	:=	00.0	;
	ScaleBatch.RefGapW[0].y	:=	00.0	;
	ScaleBatch.RefGapW[1].x	:=	1000.0	;
	ScaleBatch.RefGapW[1].y	:=	345.0	;	//SCALE VALUES TO PERCENTAGE OF ACTUAL SIZE
	ScaleBatch.ScaleGapW.NoOfPoints	:=	2		;
	ScaleBatch.ScaleGapW.ptr_table	:=	ADR(ScaleBatch.RefGapW)	;

	CASE VisBatch.State OF
		RESET_WAIT:
			//USE CONDITION TO RESET VALUES WHEN REQUIRED
			VisBatch.Param.fill		:=	15	;
			VisBatch.Param.color	:=	15	;
			VisBatch.Param.back		:=	255	;
			VisBatch.Param.font1		:=	13	;
			VisBatch.Param.fore1		:=	45	;
			VisBatch.Control.RowsIndex	:=	1	;
			VisBatch.Control.RowIndex	:=	0	;
			VisBatch.Control.LongestScaled	:=	0	;
			VisBatch.Control.LongestOld	:=	VisBatch.Control.LongestScaled	;
			VisBatch.Control.X1Old	:=	0	;
			VisBatch.Control.Y1Old	:=	0	;
			ScaleBatch.ScaleGapL.x	:=	LoadPerm.Gap	;
			ScaleBatch.ScaleGapL();
			VisBatch.Control.GapLScaled	:=	REAL_TO_UINT(ScaleBatch.ScaleGapL.y)	;
			ScaleBatch.ScaleGapW.x	:=	RowPerm.Gap	;
			ScaleBatch.ScaleGapW();
			VisBatch.Control.GapWScaled	:=	REAL_TO_UINT(ScaleBatch.ScaleGapW.y)	;
			VisBatch.P1.Index	:=	0	;
			IF EDGEPOS(X2X18.P16)THEN
				VisBatch.State := CONFIRM_LOAD;
			END_IF

		CONFIRM_LOAD:
			VisBatch.P1.Index	:=	3	;
			IF(VisBatch.API.READY <> 1) THEN
				VisBatch.API.VC_HANDLE := VA_Setup(1 , 'BatchP')	;
			  
				IF(VisBatch.API.VC_HANDLE <> 0) THEN
					VisBatch.API.READY := 1	;
				END_IF
			END_IF
			
			//CLEAR SCREEN USING REDRAW
			IF(VisBatch.API.READY = 1) THEN
				IF(VA_Saccess(1,VisBatch.API.VC_HANDLE)= 0) THEN
					VA_Redraw(1,VisBatch.API.VC_HANDLE)	;
					VA_Srelease(1,VisBatch.API.VC_HANDLE)	;
					VisBatch.P1.EnableIndex	:=	0	;
				END_IF
			END_IF

			IF(Loads.Furnace9.NotEmpty) THEN
				FOR i := 0 TO 199 DO
					VisBatch.Displayed.Data[i]	:=	VisBatch.Displayed.Data[200]	;
				END_FOR
				VisBatch.Displayed.Index	:=	0	;
				Loads.FurnaceExit	:=	Loads.Furnace9	;
				Loads.Furnace9		:=	Loads.Furnace8	;
				Loads.Furnace8		:=	Loads.Furnace7	;
				Loads.Furnace7		:=	Loads.Furnace6	;
				Loads.Furnace6		:=	Loads.Furnace5	;
				Loads.Furnace5		:=	Loads.Furnace4	;
				Loads.Furnace4		:=	Loads.Furnace3	;
				Loads.Furnace3		:=	Loads.Furnace2	;
				Loads.Furnace2		:=	Loads.Furnace1	;
				Loads.Furnace1	:=	Loads.Empty	;
				VisBatch.State	:=	EXTRACT_VALUES	;
			ELSE
				VisBatch.State	:=	RESET_WAIT	;
				VisBatch.P1.EnableIndex	:=	0	;
			END_IF
		
		CONFIRM_CLEAR:	
			VisBatch.State	:=	REDRAW	;
		
		EXTRACT_VALUES:
			
			VisBatch.P1.Index	:=	1	;
			CASE VisBatch.Control.RowIndex OF
				0:	//EXTRACT ROW WIDTH FROM .Row[0].Width AND INCREMENT .RowIndex
					VisBatch.Control.RowWidthRaw	:=	Loads.FurnaceExit.Rows[VisBatch.Control.RowsIndex].Row[0].Width	;
					VisBatch.Control.RowIndex	:=	1	;
					VisBatch.State	:=	CALCULATE_X1	;
				1..14:
					VisBatch.Control.RowIndex	:=	VisBatch.Control.RowIndex + 1	;
					VisBatch.State	:=	CALCULATE_X1	;
				15:	//MAX ROW NUMBER REACHED, INCREMENT .RowsIndex, EXTRACT NEXT ROW WIDTH, SET LONGEST FROM PREVIOUS ROW
					VisBatch.Control.RowsIndex	:=	VisBatch.Control.RowsIndex + 1	;
					VisBatch.Control.RowIndex	:=	0	;
					VisBatch.Control.LongestOld	:=	VisBatch.Control.LongestScaled	;
			END_CASE
		
//		CALCULATE_X1: //LANDSCAPE
//			CASE (REAL_TO_UINT(VisBatch.Control.RowWidthRaw)) OF
//				0:
//					VisBatch.State	:=	REFRESH	;
//				ELSE
//					CASE VisBatch.Control.RowIndex OF
//						1:
//							CASE VisBatch.Control.RowsIndex OF
//								1:
//									VisBatch.Param.x1	:=	81	;//BATCH DISPLAY AREA LEFT + 2
//									VisBatch.Control.X1Old	:=	81	;//BATCH DISPLAY AREA LEFT + 1 
//								2..15:
//									VisBatch.Param.x1	:=	VisBatch.Control.X1Old + VisBatch.Control.LongestOld + VisBatch.Control.GapLScaled	;
//									VisBatch.Control.X1Old	:=	VisBatch.Param.x1	;
//								16:
//							END_CASE
//					END_CASE
//							
//					VisBatch.State	:=	CHECK_NEXT	;
//			END_CASE
//
		CALCULATE_X1: //PORTRAIT
			CASE (REAL_TO_UINT(VisBatch.Control.RowWidthRaw)) OF
				0:
					VisBatch.State	:=	REFRESH	;
				ELSE
					ScaleBatch.ScaleY1.x	:=	VisBatch.Control.RowWidthRaw	;
					ScaleBatch.ScaleY1();
					VisBatch.Control.RowWidthScaled	:=	REAL_TO_UINT(ScaleBatch.ScaleY1.y)	;
					VisBatch.Control.WidthRaw	:=	Loads.FurnaceExit.Rows[VisBatch.Control.RowsIndex].Row[VisBatch.Control.RowIndex].Width	;
					ScaleBatch.ScaleWidth.x	:=	VisBatch.Control.WidthRaw	;
					ScaleBatch.ScaleWidth();
					VisBatch.Param.width	:=	REAL_TO_UINT(ScaleBatch.ScaleWidth.y)	;

					CASE VisBatch.Control.RowIndex OF
						1:
							VisBatch.Param.x1 := REAL_TO_UINT(540 + (VisBatch.Control.RowWidthScaled/2) - VisBatch.Param.width);
							VisBatch.Control.X1Old := VisBatch.Param.x1; 
						2..12:
							VisBatch.Param.x1 := REAL_TO_UINT(VisBatch.Control.X1Old - VisBatch.Param.width - VisBatch.Control.GapWScaled);
							VisBatch.Control.X1Old := VisBatch.Param.x1; 
					END_CASE
							
					VisBatch.State	:=	CHECK_NEXT	;
			END_CASE

		CHECK_NEXT:
			VisBatch.Control.LengthRaw	:=	Loads.FurnaceExit.Rows[VisBatch.Control.RowsIndex].Row[VisBatch.Control.RowIndex].Length	;
//			VisBatch.Control.WidthRaw	:=	Loads.FurnaceExit.Rows[VisBatch.Control.RowsIndex].Row[VisBatch.Control.RowIndex].Width	;
			CASE (REAL_TO_UINT(VisBatch.Control.LengthRaw)) OF
				0:
					VisBatch.Control.RowsIndex	:=	VisBatch.Control.RowsIndex + 1	;
					VisBatch.Control.RowIndex	:=	0	;
					VisBatch.Control.LongestOld	:=	VisBatch.Control.LongestScaled	;
					VisBatch.Control.LongestScaled	:=	0	;
					VisBatch.State	:=	EXTRACT_VALUES	;
				ELSE
					VisBatch.State	:=	CALCULATE_Y1	;
			END_CASE
		
		CALCULATE_Y1:
//			ScaleBatch.ScaleWidth.x	:=	VisBatch.Control.WidthRaw	;
//			ScaleBatch.ScaleWidth();
//			VisBatch.Param.width	:=	REAL_TO_UINT(ScaleBatch.ScaleWidth.y)	;
			
			ScaleBatch.ScaleLength.x	:=	VisBatch.Control.LengthRaw	;
			ScaleBatch.ScaleLength();
			VisBatch.Param.height	:=	REAL_TO_UINT(ScaleBatch.ScaleLength.y)	;
			
//			CASE VisBatch.Control.RowIndex OF
//				1:
//					ScaleBatch.ScaleY1.x	:=	VisBatch.Control.RowWidthRaw	;
//					ScaleBatch.ScaleY1();
//					VisBatch.Control.RowWidthScaled	:=	REAL_TO_UINT(ScaleBatch.ScaleY1.y)	;
////					VisBatch.Param.y1	:= ((884 - VisBatch.Control.RowWidthScaled)/2) + 64	;//((DisplayWindow.Height - xxx)/2) + DisplayWindow.Top + 2
//					VisBatch.Param.y1	:= 64 + (884/2) + ((VisBatch.Control.RowWidthScaled)/2) - VisBatch.Param.height	;//CALCULATION TO MIRROR DISPLAY
//					VisBatch.Control.Y1Old	:=	VisBatch.Param.y1	;
//				2..13:
//					ScaleBatch.ScaleY1.x	:=	VisBatch.Control.WidthRaw	;
//					ScaleBatch.ScaleY1();
//					VisBatch.Control.WidthScaled	:=	REAL_TO_UINT(ScaleBatch.ScaleY1.y)	;
////					VisBatch.Param.y1	:= VisBatch.Param.height + VisBatch.Control.GapWScaled + VisBatch.Control.Y1Old	;
//					VisBatch.Param.y1	:= VisBatch.Control.Y1Old - VisBatch.Param.height - VisBatch.Control.GapWScaled	;
//					VisBatch.Control.Y1Old	:=	VisBatch.Param.y1	;
//					
//			END_CASE
			CASE VisBatch.Control.RowIndex OF
				1:
					CASE VisBatch.Control.RowsIndex OF
						1:
							VisBatch.Control.LongestScaled := REAL_TO_INT((Loads.FurnaceExit.Rows[VisBatch.Control.RowsIndex].Row[0].Length) * 0.345);
							VisBatch.Param.y1 := REAL_TO_UINT(1775 - VisBatch.Control.LongestScaled);
							VisBatch.Control.Y1Old := VisBatch.Param.y1;
						2..15:
							VisBatch.Control.LongestScaled := REAL_TO_INT((Loads.FurnaceExit.Rows[VisBatch.Control.RowsIndex].Row[0].Length) * 0.345);
							VisBatch.Param.y1 := REAL_TO_UINT(VisBatch.Control.Y1Old - VisBatch.Control.LongestScaled - VisBatch.Control.GapLScaled);
							VisBatch.Control.Y1Old := VisBatch.Param.y1;
					END_CASE
			END_CASE
			
//			IF(VisBatch.Param.height > VisBatch.Control.LongestScaled) THEN
//				VisBatch.Control.LongestScaled	:=	VisBatch.Param.height	;
//			END_IF
			CASE CAPT.Rev OF //METRIC OR ENGLISH
				0:
					VisBatch.Param.str	:=	REAL_TO_STRING(VisBatch.Control.LengthRaw)	;
					VisBatch.Param.str	:=	CONCAT(VisBatch.Param.str,' X ')	;
					VisBatch.Control.StrTemp	:=	REAL_TO_STRING(VisBatch.Control.WidthRaw)	;
					VisBatch.Param.str	:=	CONCAT(VisBatch.Param.str,VisBatch.Control.StrTemp)	;
				1:

					DispStrDecode.SixteenthStr := '' ;
					DispStrDecode.WholeInch := REAL_TO_INT(floor(VisBatch.Control.LengthRaw / 25.4)) ;
					DispStrDecode.WholeInchREAL := INT_TO_REAL(DispStrDecode.WholeInch) ;
					DispStrDecode.Remainder := (VisBatch.Control.LengthRaw - (DispStrDecode.WholeInchREAL * 25.4)) ;
					DispStrDecode.Sixteenth := (DispStrDecode.Remainder/ 1.5875) ;//(25.4*(1/16))) ;
					CASE REAL_TO_INT(DispStrDecode.Sixteenth * 10) OF
						0..4: //0/16
							DispStrDecode.SixteenthStr := '' ;
						5..14: //1/16
							DispStrDecode.SixteenthStr := ' 1/16' ;
						15..24: //2/16
							DispStrDecode.SixteenthStr := ' 1/8' ;
						25..34: //3/16
							DispStrDecode.SixteenthStr := ' 3/16' ;
						35..44: //4/16
							DispStrDecode.SixteenthStr := ' 1/4' ;
						45..54: //5/16
							DispStrDecode.SixteenthStr := ' 5/16' ;
						55..64: //6/16
							DispStrDecode.SixteenthStr := ' 3/8' ;
						65..74: //7/16
							DispStrDecode.SixteenthStr := ' 7/16' ;
						75..84: //8/16
							DispStrDecode.SixteenthStr := ' 1/2' ;
						85..94: //9/16
							DispStrDecode.SixteenthStr := ' 9/16' ;
						95..104: //10/16
							DispStrDecode.SixteenthStr := ' 5/8' ;
						105..114: //11/16
							DispStrDecode.SixteenthStr := ' 11/16' ;
						115..124: //12/16
							DispStrDecode.SixteenthStr := ' 3/4' ;
						125..134: //13/16
							DispStrDecode.SixteenthStr := ' 13/16' ;
						135..144: //14/16
							DispStrDecode.SixteenthStr := ' 7/8' ;
						145..154: //15/16
							DispStrDecode.SixteenthStr := ' 15/16' ;
						155..159: //16/16
							DispStrDecode.SixteenthStr := '' ;
							DispStrDecode.WholeInchREAL := DispStrDecode.WholeInchREAL + 1 ;
					END_CASE
					DispStrDecode.float_len := ftoa(DispStrDecode.WholeInchREAL, ADR(VisBatch.Param.str)) ;
					VisBatch.Param.str := CONCAT(VisBatch.Param.str, DispStrDecode.SixteenthStr) ;
					VisBatch.Param.str := CONCAT(VisBatch.Param.str, ' X ');
					DispStrDecode.SixteenthStr := '' ;
					DispStrDecode.WholeInch := REAL_TO_INT(floor(VisBatch.Control.WidthRaw / 25.4)) ;
					DispStrDecode.WholeInchREAL := INT_TO_REAL(DispStrDecode.WholeInch) ;
					DispStrDecode.Remainder := (VisBatch.Control.WidthRaw - (DispStrDecode.WholeInchREAL * 25.4)) ;
					DispStrDecode.Sixteenth := (DispStrDecode.Remainder/ 1.5875) ;//(25.4*(1/16))) ;
					CASE REAL_TO_INT(DispStrDecode.Sixteenth * 10) OF
						0..4: //0/16
							DispStrDecode.SixteenthStr := '' ;
						5..14: //1/16
							DispStrDecode.SixteenthStr := ' 1/16' ;
						15..24: //2/16
							DispStrDecode.SixteenthStr := ' 1/8' ;
						25..34: //3/16
							DispStrDecode.SixteenthStr := ' 3/16' ;
						35..44: //4/16
							DispStrDecode.SixteenthStr := ' 1/4' ;
						45..54: //5/16
							DispStrDecode.SixteenthStr := ' 5/16' ;
						55..64: //6/16
							DispStrDecode.SixteenthStr := ' 3/8' ;
						65..74: //7/16
							DispStrDecode.SixteenthStr := ' 7/16' ;
						75..84: //8/16
							DispStrDecode.SixteenthStr := ' 1/2' ;
						85..94: //9/16
							DispStrDecode.SixteenthStr := ' 9/16' ;
						95..104: //10/16
							DispStrDecode.SixteenthStr := ' 5/8' ;
						105..114: //11/16
							DispStrDecode.SixteenthStr := ' 11/16' ;
						115..124: //12/16
							DispStrDecode.SixteenthStr := ' 3/4' ;
						125..134: //13/16
							DispStrDecode.SixteenthStr := ' 13/16' ;
						135..144: //14/16
							DispStrDecode.SixteenthStr := ' 7/8' ;
						145..154: //15/16
							DispStrDecode.SixteenthStr := ' 15/16' ;
						155..159: //16/16
							DispStrDecode.SixteenthStr := '' ;
							DispStrDecode.WholeInchREAL := DispStrDecode.WholeInchREAL + 1 ;
					END_CASE
					DispStrDecode.float_len := ftoa(DispStrDecode.WholeInchREAL, ADR(VisBatch.Control.StrTemp)) ;
					VisBatch.Param.str := CONCAT(VisBatch.Param.str, VisBatch.Control.StrTemp) ;
					VisBatch.Param.str := CONCAT(VisBatch.Param.str, DispStrDecode.SixteenthStr) ;
//					VisBatch.Control.StrReal	:=	VisBatch.Control.LengthRaw * 100	;
//					VisBatch.Control.StrReal	:=	VisBatch.Control.StrReal / 25.4 ;
//					VisBatch.Control.StrInt		:=	TRUNC(VisBatch.Control.StrReal)	;
//					VisBatch.Control.StrReal	:=	INT_TO_REAL(VisBatch.Control.StrInt)	;
//					VisBatch.Param.str	:=	REAL_TO_STRING(VisBatch.Control.StrReal/100)	;
//					VisBatch.Param.str	:=	CONCAT(VisBatch.Param.str,' X ')	;
//					VisBatch.Control.StrReal	:=	VisBatch.Control.WidthRaw * 100	;
//					VisBatch.Control.StrReal	:=	VisBatch.Control.StrReal / 25.4 ;
//					VisBatch.Control.StrInt		:=	TRUNC(VisBatch.Control.StrReal)	;
//					VisBatch.Control.StrReal	:=	INT_TO_REAL(VisBatch.Control.StrInt)	;
//					VisBatch.Control.StrTemp	:=	REAL_TO_STRING(VisBatch.Control.StrReal/100)	;
//					VisBatch.Param.str	:=	CONCAT(VisBatch.Param.str,VisBatch.Control.StrTemp)	;
			END_CASE
			
			VisBatch.Displayed.Data[VisBatch.Displayed.Index].x1	:=	VisBatch.Param.x1	;
			VisBatch.Displayed.Data[VisBatch.Displayed.Index].y1	:=	VisBatch.Param.y1	;
			VisBatch.Displayed.Data[VisBatch.Displayed.Index].width	:=	VisBatch.Param.width	;
			VisBatch.Displayed.Data[VisBatch.Displayed.Index].height	:=	VisBatch.Param.height	;
			VisBatch.Displayed.Data[VisBatch.Displayed.Index].str	:=	VisBatch.Param.str	;
			VisBatch.Displayed.Index	:=	VisBatch.Displayed.Index + 1	;
			
			VisBatch.State	:=	EXTRACT_VALUES	;

		REDRAW:
			VisBatch.P1.Index	:=	3	;
			IF(VisBatch.API.READY <> 1) THEN
				VisBatch.API.VC_HANDLE := VA_Setup(1 , 'BatchP')	;
			  
				IF(VisBatch.API.VC_HANDLE <> 0) THEN
					VisBatch.API.READY := 1	;
				END_IF
			END_IF
			
			//CLEAR SCREEN USING REDRAW
			IF(VisBatch.API.READY = 1) THEN
				IF(VA_Saccess(1,VisBatch.API.VC_HANDLE)= 0) THEN
					VA_Redraw(1,VisBatch.API.VC_HANDLE)	;
					VA_Srelease(1,VisBatch.API.VC_HANDLE)	;
					VisBatch.State	:=	RESET_WAIT	;
					VisBatch.P1.EnableIndex	:=	0	;
				END_IF
			END_IF
		
		REFRESH:
			VisBatch.P1.Index	:=	2	;
			IF(VisBatch.Displayed.RefreshIndex <= VisBatch.Displayed.Index) THEN
				VisBatch.Param.x1	:=	VisBatch.Displayed.Data[VisBatch.Displayed.RefreshIndex].x1;
				VisBatch.Param.y1	:=	VisBatch.Displayed.Data[VisBatch.Displayed.RefreshIndex].y1;
				VisBatch.Param.width	:=	VisBatch.Displayed.Data[VisBatch.Displayed.RefreshIndex].width;
				VisBatch.Param.height	:=	VisBatch.Displayed.Data[VisBatch.Displayed.RefreshIndex].height;
				//ADDED TO SWITCH DISPLAY DIRECTION 150216
				CASE CLPT2.Start OF
					1:
						VisBatch.Param.x1 := (1919 - VisBatch.Displayed.Data[VisBatch.Displayed.RefreshIndex].x1 - VisBatch.Param.width) ;//1919 = FIXED VALUE
						VisBatch.Param.y1	:=	(947 - (VisBatch.Displayed.Data[VisBatch.Displayed.RefreshIndex].y1 - 65) - VisBatch.Param.height) ;//943 = DISPLAY BOX TOP + HEIGHT - 2, 65 = TOP + 2
				END_CASE	
				VisBatch.Param.str	:=	VisBatch.Displayed.Data[VisBatch.Displayed.RefreshIndex].str;
				VisBatch.State	:=	REFRESH_RECTANGLE	;
				VisBatch.Displayed.RefreshIndex	:=	VisBatch.Displayed.RefreshIndex + 1	;
			ELSE
				VisBatch.State	:=	RESET_WAIT	;
				VisBatch.Displayed.RefreshIndex	:=	0	;
				VisBatch.P1.EnableIndex	:=	0	;
			END_IF

		REFRESH_RECTANGLE:
			IF(VisBatch.API.READY <> 1) THEN
				VisBatch.API.VC_HANDLE := VA_Setup(1 , 'BatchP')	;
			  
				IF(VisBatch.API.VC_HANDLE <> 0) THEN
					VisBatch.API.READY := 1	;
				END_IF
			END_IF
			
			//DRAW RECTANGLE BASED ON x1, y1(TOP LEFT), x2(WIDTH) AND y2(HEIGHT) VALUES. fill AND color VALUES TO BE PERMANENT VALUES (USE SPARE PERMANENT VALUES)
			IF(VisBatch.API.READY = 1) THEN
				IF(VA_Saccess(1,VisBatch.API.VC_HANDLE)= 0) THEN
					VisBatch.API.Status :=VA_Rect (1,VisBatch.API.VC_HANDLE,VisBatch.Param.x1,VisBatch.Param.y1,VisBatch.Param.width,VisBatch.Param.height,VisBatch.Param.fill,VisBatch.Param.color) ;
					VA_Srelease(1,VisBatch.API.VC_HANDLE)	;
					VisBatch.State	:=	REFRESH_TEXTOUT1	;
				END_IF
			END_IF

		REFRESH_TEXTOUT1:
			IF(VisBatch.API.READY <> 1) THEN
				VisBatch.API.VC_HANDLE := VA_Setup(1 , 'BatchP')	;
	  
				IF(VisBatch.API.VC_HANDLE <> 0) THEN
					VisBatch.API.READY := 1	;
				END_IF
			END_IF
	
			IF(VisBatch.API.READY = 1) THEN
				IF(VA_Saccess(1,VisBatch.API.VC_HANDLE)= 0) THEN
					VA_Textout (1,VisBatch.API.VC_HANDLE,VisBatch.Param.font1,VisBatch.Param.x1,VisBatch.Param.y1,VisBatch.Param.fore1,VisBatch.Param.back,VisBatch.Param.str) ;
					VA_Srelease(1,VisBatch.API.VC_HANDLE)	;
					VisBatch.State	:=	REFRESH	;
				END_IF
			END_IF
			
	END_CASE
	

	//VISUALISATION CONTROLS
	//OPTIONS TEXT DISPLAY
	VisBatch.P1.Status[1]	:=	HIDE	;
	VisBatch.P1.Status[2]	:=	HIDE	;
	VisBatch.P1.Status[3]	:=	HIDE	;
	VisBatch.P1.Status[4]	:=	HIDE	;
	VisBatch.P1.Status[5]	:=	HIDE	;
	VisBatch.P1.Status[6]	:=	HIDE	;
	VisBatch.P1.Status[7]	:=	HIDE	;
	VisBatch.P1.Status[8]	:=	HIDE	;
	VisBatch.P1.Status[9]	:=	HIDE	;
	VisBatch.P1.Status[10]	:=	HIDE	;
	VisBatch.P1.Status[11]	:=	HIDE	;
	VisBatch.P1.Status[12]	:=	HIDE	;
	VisBatch.P1.Status[14]	:=	HIDE	;
	VisBatch.P1.Status[15]	:=	HIDE	;
	VisBatch.P1.Status[16]	:=	HIDE	;
	VisBatch.P1.Status[17]	:=	HIDE	;//ADDED TO SWITCH DISPLAY DIRECTION 150216
	VisBatch.P1.Status[18]	:=	HIDE	;//ADDED TO SWITCH DISPLAY DIRECTION 150216
	CASE CAPT.Slow OF
		11:
			CASE CLPT2.Clear OF
				0:
					VisBatch.P1.Status[1]	:= SHOW	;
				1:
					VisBatch.P1.Status[7]	:= SHOW	;
			END_CASE
		12:
			CASE CLPT2.Clear OF
				0:
					VisBatch.P1.Status[2]	:= SHOW	;
				1:
					VisBatch.P1.Status[8]	:= SHOW	;
			END_CASE
		13:
			CASE CLPT2.Clear OF
				0:
					VisBatch.P1.Status[3]	:= SHOW	;
				1:
					VisBatch.P1.Status[9]	:= SHOW	;
			END_CASE
		14:
			CASE CLPT2.Clear OF
				0:
					VisBatch.P1.Status[4]	:= SHOW	;
				1:
					VisBatch.P1.Status[10]	:= SHOW	;
			END_CASE
		15:
			CASE CLPT2.Clear OF
				0:
					VisBatch.P1.Status[5]	:= SHOW	;
				1:
					VisBatch.P1.Status[11]	:= SHOW	;
			END_CASE
		16:
			CASE CLPT2.Clear OF
				0:
					VisBatch.P1.Status[6]	:= SHOW	;
				1:
					VisBatch.P1.Status[12]	:= SHOW	;
			END_CASE
	END_CASE			
	CASE CAPT.Start OF
		0:
			VisBatch.P1.Colour[0]	:=	BLACK	;
		1:
			VisBatch.P1.Colour[0]	:=	FONT_BLUE	;
		2:
			VisBatch.P1.Colour[0]	:=	FONT_GREEN	;
		4:
			VisBatch.P1.Colour[0]	:=	FONT_DARK_RED	;
		5:
			VisBatch.P1.Colour[0]	:=	FONT_MAGENTA	;
		7:
			VisBatch.P1.Colour[0]	:=	FONT_LIGHT_GREY	;
		8:
			VisBatch.P1.Colour[0]	:=	FONT_DARK_GREY	;
		11:
			VisBatch.P1.Colour[0]	:=	FONT_LIGHT_BLUE	;
		15:
			VisBatch.P1.Colour[0]	:=	FONT_WHITE	;
		42:
			VisBatch.P1.Colour[0]	:=	FONT_ORANGE	;
		45:
			VisBatch.P1.Colour[0]	:=	FONT_RED	;
		46:
			VisBatch.P1.Colour[0]	:=	FONT_YELLOW	;
	END_CASE
	CASE CLPT2.Clear OF
		0:	//GRAPHIC DISPLAY
			VisBatch.P1.Status[13]	:= SHOW	;
		1:	//LIST DISPLAY
			VisBatch.P1.Status[13]	:= HIDE	;
	END_CASE

	CASE VisBatch.P1.EnableIndex OF
		1:
			VisBatch.P1.Status[14]	:=	SHOW	;
		2:
			VisBatch.P1.Status[15]	:=	SHOW	;
	END_CASE

	CASE VisBatch.P1.Index OF
		1..5:
			VisBatch.P1.Status[16]	:=	SHOW	;
	END_CASE

	//ADDED TO SWITCH DISPLAY DIRECTION 150216
	CASE CLPT2.Start OF
		0:
			VisBatch.P1.Status[17]	:=	SHOW	;
		1:
			VisBatch.P1.Status[18]	:=	SHOW	;
	END_CASE	
	
	IF(Loads.Furnace9.NotEmpty) THEN
		VisBatch.P1.Colour[1]	:=	BLUE	;
	ELSE
		VisBatch.P1.Colour[1]	:=	GREY	;
	END_IF
	IF(Loads.Furnace8.NotEmpty) THEN
		VisBatch.P1.Colour[2]	:=	BLUE	;
	ELSE
		VisBatch.P1.Colour[2]	:=	GREY	;
	END_IF
	IF(Loads.Furnace7.NotEmpty) THEN
		VisBatch.P1.Colour[3]	:=	BLUE	;
	ELSE
		VisBatch.P1.Colour[3]	:=	GREY	;
	END_IF
	IF(Loads.Furnace6.NotEmpty) THEN
		VisBatch.P1.Colour[4]	:=	BLUE	;
	ELSE
		VisBatch.P1.Colour[4]	:=	GREY	;
	END_IF
	IF(Loads.Furnace5.NotEmpty) THEN
		VisBatch.P1.Colour[5]	:=	BLUE	;
	ELSE
		VisBatch.P1.Colour[5]	:=	GREY	;
	END_IF
	IF(Loads.Furnace4.NotEmpty) THEN
		VisBatch.P1.Colour[6]	:=	BLUE	;
	ELSE
		VisBatch.P1.Colour[6]	:=	GREY	;
	END_IF
	IF(Loads.Furnace3.NotEmpty) THEN
		VisBatch.P1.Colour[7]	:=	BLUE	;
	ELSE
		VisBatch.P1.Colour[7]	:=	GREY	;
	END_IF
	IF(Loads.Furnace2.NotEmpty) THEN
		VisBatch.P1.Colour[8]	:=	BLUE	;
	ELSE
		VisBatch.P1.Colour[8]	:=	GREY	;
	END_IF
	IF(Loads.Furnace1.NotEmpty) THEN
		VisBatch.P1.Colour[9]	:=	BLUE	;
	ELSE
		VisBatch.P1.Colour[9]	:=	GREY	;
	END_IF

END_PROGRAM


; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'smc_fee.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'smc_fee.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'smc_fee.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'smc_fee.consts.inc'

		include	'smc_fee.ro.inc'

; Code begins here:



;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		push	L825_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETB	; getb
		mov	bl, al
		pop	eax
		mov	byte ptr [L806_semester__hla_+0], bl	;/* semester */
		and	byte ptr [L806_semester__hla_+0], 48	;/* semester */
		shr	byte ptr [L806_semester__hla_+0], 4	;/* semester */
		cmp	byte ptr [L806_semester__hla_+0], 0	;/* semester */
		JE	L834_fall_semester__hla_
		cmp	byte ptr [L806_semester__hla_+0], 1	;/* semester */
		JE	L835_winter_semester__hla_
		cmp	byte ptr [L806_semester__hla_+0], 2	;/* semester */
		JE	L836_spring_semester__hla_
		cmp	byte ptr [L806_semester__hla_+0], 3	;/* semester */
		JE	L837_summer_semester__hla_

L834_fall_semester__hla_:
		push	L851_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	word ptr [L811_tuition__hla_+0], 55	;/* tuition */
		jmp	L856_semester_done__hla_

L835_winter_semester__hla_:
		push	L870_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	word ptr [L811_tuition__hla_+0], 52	;/* tuition */
		jmp	L856_semester_done__hla_

L836_spring_semester__hla_:
		push	L888_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	word ptr [L811_tuition__hla_+0], 55	;/* tuition */
		jmp	L856_semester_done__hla_

L837_summer_semester__hla_:
		push	L906_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	word ptr [L811_tuition__hla_+0], 52	;/* tuition */
		jmp	L856_semester_done__hla_

L856_semester_done__hla_:
		mov	byte ptr [L807_enrolled_units__hla_+0], bl	;/* enrolled_units */
		and	byte ptr [L807_enrolled_units__hla_+0], 15	;/* enrolled_units */
		mov	cl, byte ptr [L807_enrolled_units__hla_+0]	;/* enrolled_units */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L807_enrolled_units__hla_+0]	; (type int8 enrolled_units)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L930_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	byte ptr [L808_bool_resident__hla_+0], bl	;/* bool_resident */
		shr	byte ptr [L808_bool_resident__hla_+0], 6	;/* bool_resident */
		and	byte ptr [L808_bool_resident__hla_+0], 1	;/* bool_resident */
		cmp	byte ptr [L808_bool_resident__hla_+0], 1	;/* bool_resident */
		JE	L935_resident_printout__hla_
		JNE	L936_non_resident_printout__hla_

L935_resident_printout__hla_:
		push	L950_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L955_resident_printout_done__hla_

L936_non_resident_printout__hla_:
		push	L969_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L955_resident_printout_done__hla_

L955_resident_printout_done__hla_:
		mov	byte ptr [L809_bool_parking__hla_+0], bl	;/* bool_parking */
		shr	byte ptr [L809_bool_parking__hla_+0], 7	;/* bool_parking */
		and	byte ptr [L809_bool_parking__hla_+0], 1	;/* bool_parking */
		cmp	byte ptr [L809_bool_parking__hla_+0], 1	;/* bool_parking */
		JE	L974_parking_printout__hla_
		JNE	L975_no_parking_printout__hla_

L974_parking_printout__hla_:
		push	L989_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L994_parking_printout_done__hla_

L975_no_parking_printout__hla_:
		push	L1008_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L994_parking_printout_done__hla_

L994_parking_printout_done__hla_:
		mov	bl, 1
		cmp	byte ptr [L809_bool_parking__hla_+0], bl	;/* bool_parking */
		JE	L1013_parking_fee_calculation__hla_
		JNE	L1014_units_calculation__hla_

L1013_parking_fee_calculation__hla_:
		mov	bl, 0
		cmp	bl, byte ptr [L806_semester__hla_+0]	;/* semester */
		JE	L1015_fall_spring_parking__hla_
		mov	bl, 1
		cmp	bl, byte ptr [L806_semester__hla_+0]	;/* semester */
		JE	L1016_winter_summer_parking__hla_
		mov	bl, 2
		cmp	bl, byte ptr [L806_semester__hla_+0]	;/* semester */
		JE	L1015_fall_spring_parking__hla_
		mov	bl, 3
		cmp	bl, byte ptr [L806_semester__hla_+0]	;/* semester */
		JE	L1016_winter_summer_parking__hla_

L1015_fall_spring_parking__hla_:
		add	word ptr [L811_tuition__hla_+0], 85	;/* tuition */
		jmp	L1014_units_calculation__hla_

L1016_winter_summer_parking__hla_:
		add	word ptr [L811_tuition__hla_+0], 45	;/* tuition */
		jmp	L1014_units_calculation__hla_

L1014_units_calculation__hla_:
		cmp	byte ptr [L808_bool_resident__hla_+0], 0	;/* bool_resident */
		JE	L1017_non_resident_calculation__hla_
		JNE	L1018_resident_calculation__hla_

L1017_non_resident_calculation__hla_:

L1019_intialize_non_resident_ForLp_calculation__hla_:
		mov	byte ptr [L810_i__hla_+0], 0	;/* i */

L1020_non_resident_ForLp_termination_test__hla_:
		cmp	byte ptr [L810_i__hla_+0], cl	;/* i */
		jnl	L1021_units_calculation_done__hla_

L1022_non_resident_ForLp_body__hla_:
		add	word ptr [L811_tuition__hla_+0], 370	;/* tuition */

L1023_non_resident_ForLp_increment__hla_:
		inc	byte ptr [L810_i__hla_+0]	;/* i */
		jmp	L1020_non_resident_ForLp_termination_test__hla_

L1018_resident_calculation__hla_:

L1024_intialize_resident_ForLp_calculation__hla_:
		mov	byte ptr [L810_i__hla_+0], 0	;/* i */

L1025_resident_ForLp_termination_test__hla_:
		cmp	byte ptr [L810_i__hla_+0], cl	;/* i */
		jnl	L1021_units_calculation_done__hla_

L1026_resident_ForLp_body__hla_:
		add	word ptr [L811_tuition__hla_+0], 46	;/* tuition */

L1027_resident_ForLp_increment__hla_:
		inc	byte ptr [L810_i__hla_+0]	;/* i */
		jmp	L1025_resident_ForLp_termination_test__hla_

L1021_units_calculation_done__hla_:
		push	L1041_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [L811_tuition__hla_+0]	; (type int16 tuition)
		call	STDOUT_PUTI16	; puti16
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



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

		include	'exercise.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'exercise.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'exercise.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'exercise.consts.inc'

		include	'exercise.ro.inc'

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
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_start__hla_+0], al	;/* start */
		pop	eax
		mov	bl, byte ptr [L806_start__hla_+0]	;/* start */
		mov	byte ptr [L807_value__hla_+0], bl	;/* value */

L834_calculation__hla_:

L835_intialize_ForLp_calculation__hla_:
		mov	byte ptr [L810_i__hla_+0], 1	;/* i */
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_start__hla_+0]	; (type int8 start)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8

L851_ForLp_termination_test__hla_:
		cmp	byte ptr [L810_i__hla_+0], bl	;/* i */
		je	L852_calculation_done__hla_
		cmp	byte ptr [L809_bool_positive__hla_+0], 1	;/* bool_positive */
		JE	L853_positive_calculation__hla_
		JNE	L854_negative_calculation__hla_

L853_positive_calculation__hla_:

L855_positive_ForLp_body__hla_:
		add	bl, byte ptr [L811_j__hla_+0]	;/* j */
		push	L869_str__hla_
		call	STDOUT_PUTS	; puts
		push	ebx
		call	STDOUT_PUTI8	; puti8
		mov	bl, byte ptr [L807_value__hla_+0]	;/* value */
		sub	byte ptr [L809_bool_positive__hla_+0], 1	;/* bool_positive */

L870_positive_ForLp_increment__hla_:
		inc	byte ptr [L810_i__hla_+0]	;/* i */
		jmp	L851_ForLp_termination_test__hla_

L854_negative_calculation__hla_:

L871_negative_ForLp_body__hla_:
		inc	byte ptr [L811_j__hla_+0]	;/* j */
		push	L885_str__hla_
		call	STDOUT_PUTS	; puts
		sub	bl, byte ptr [L811_j__hla_+0]	;/* j */
		push	ebx
		call	STDOUT_PUTI8	; puti8
		mov	bl, byte ptr [L807_value__hla_+0]	;/* value */
		add	byte ptr [L809_bool_positive__hla_+0], 1	;/* bool_positive */

L886_negative_ForLp_increment__hla_:
		inc	byte ptr [L810_i__hla_+0]	;/* i */
		jmp	L851_ForLp_termination_test__hla_

L852_calculation_done__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



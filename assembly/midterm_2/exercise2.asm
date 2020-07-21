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

		include	'exercise2.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'exercise2.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'exercise2.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'exercise2.consts.inc'

		include	'exercise2.ro.inc'

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
		mov	cl, 1
		cmp	bl, 1
		JL	L834_printout_done__hla_

L835_increment_printout__hla_:

L836_intialize_increment_ForLp__hla_:
		mov	byte ptr [L810_i__hla_+0], 0	;/* i */

L837_increment_ForLp_termination_test__hla_:
		cmp	byte ptr [L810_i__hla_+0], bl	;/* i */
		JE	L838_increment_printout_done__hla_

L839_increment_printout_body__hla_:

L840_increment_printout_inner__hla_:

L841_initialize_increment_ForLp_inner__hla_:
		mov	byte ptr [L811_j__hla_+0], 0	;/* j */

L842_increment_ForLp_termination_test_inner__hla_:
		cmp	byte ptr [L811_j__hla_+0], cl	;/* j */
		JE	L843_increment_printout_done_inner__hla_

L844_increment_printout_body_inner__hla_:
		push	L858_str__hla_
		call	STDOUT_PUTS	; puts

L859_ForLp_increment_inner__hla_:
		inc	byte ptr [L811_j__hla_+0]	;/* j */
		jmp	L842_increment_ForLp_termination_test_inner__hla_

L843_increment_printout_done_inner__hla_:
		call	STDOUT_NEWLN	; newln

L873_ForLp_increment__hla_:
		inc	byte ptr [L810_i__hla_+0]	;/* i */
		inc	cl
		jmp	L837_increment_ForLp_termination_test__hla_

L838_increment_printout_done__hla_:

L874_decrement_printout__hla_:

L875_intialize_decrement_ForLp__hla_:
		dec	bl
		mov	byte ptr [L810_i__hla_+0], bl	;/* i */

L876_decrement_ForLp_termination_test__hla_:
		cmp	byte ptr [L810_i__hla_+0], 0	;/* i */
		JE	L877_decrement_printout_done__hla_

L878_decrement_printout_body__hla_:

L879_decrement_printout_inner__hla_:

L880_initialize_decrement_ForLp_inner__hla_:
		mov	byte ptr [L811_j__hla_+0], 0	;/* j */

L881_decrement_ForLp_termination_test_inner__hla_:
		cmp	byte ptr [L811_j__hla_+0], bl	;/* j */
		JE	L882_decrement_printout_done_inner__hla_

L883_decrement_printout_body_inner__hla_:
		push	L897_str__hla_
		call	STDOUT_PUTS	; puts

L898_ForLp_decrement_inner__hla_:
		inc	byte ptr [L811_j__hla_+0]	;/* j */
		jmp	L881_decrement_ForLp_termination_test_inner__hla_

L882_decrement_printout_done_inner__hla_:
		call	STDOUT_NEWLN	; newln

L912_ForLp_decrement__hla_:
		dec	byte ptr [L810_i__hla_+0]	;/* i */
		dec	bl
		jmp	L876_decrement_ForLp_termination_test__hla_

L877_decrement_printout_done__hla_:

L834_printout_done__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



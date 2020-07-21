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

		include	'big_number.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'big_number.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'big_number.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'big_number.consts.inc'

		include	'big_number.ro.inc'

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


		push	L822_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_iDataValue__hla_+0], al	;/* iDataValue */
		pop	eax
		mov	bl, byte ptr [L806_iDataValue__hla_+0]	;/* iDataValue */

L831_ForLpOdd__hla_:

L832_InitializeForLpOdd__hla_:
		mov	byte ptr [L807_i__hla_+0], 1	;/* i */

L833_ForLpOddTerminationTest__hla_:
		cmp	byte ptr [L807_i__hla_+0], bl	;/* i */
		jnle	L834_ForLpOddDone__hla_

L835_ForLpOddBody__hla_:
		push	dword 00h
		push	eax
		mov	al, byte ptr [L807_i__hla_+0]	; i
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8

L836_ForLpOddIncrement__hla_:
		inc	byte ptr [L807_i__hla_+0]	;/* i */
		inc	byte ptr [L807_i__hla_+0]	;/* i */
		jmp	L833_ForLpOddTerminationTest__hla_

L834_ForLpOddDone__hla_:

L837_ForLpEven__hla_:

L838_InitializeForLpEven__hla_:
		mov	byte ptr [L808_j__hla_+0], 2	;/* j */

L839_ForLpEvenTerminationTest__hla_:
		cmp	byte ptr [L808_j__hla_+0], bl	;/* j */
		jnle	L840_ForLpEvenDone__hla_

L841_ForLpEvenBody__hla_:
		push	dword 00h
		push	eax
		mov	al, byte ptr [L808_j__hla_+0]	; j
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8

L842_ForLpEvenIncrement__hla_:
		inc	byte ptr [L808_j__hla_+0]	;/* j */
		inc	byte ptr [L808_j__hla_+0]	;/* j */
		jmp	L839_ForLpEvenTerminationTest__hla_

L840_ForLpEvenDone__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



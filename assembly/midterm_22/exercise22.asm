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

		include	'exercise22.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'exercise22.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'exercise22.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'exercise22.consts.inc'

		include	'exercise22.ro.inc'

; Code begins here:
L809_foo__hla_ :
		pop	dword ptr [L811_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [L810_iTemp__hla_+0]	;/* iTemp */
		pop	word ptr [ebp+8]	;/* data */
		push	dword ptr [L811_iReturnAddress__hla_+0]	;/* iReturnAddress */
		push	L825_str__hla_
		call	STDOUT_PUTS	; puts
		push	word 00h
		push	word ptr [ebp+8]	; (type int16 data)
		call	STDOUT_PUTI16	; puti16
		call	STDOUT_NEWLN	; newln
		mov	eax, 0
		mov	ebx, 0
		mov	ecx, 0
		mov	edx, 0
		inc	eax
		add	eax, ebx
		push	eax
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln
		inc	ebx
		add	ecx, ebx
		inc	edx
		push	edx
		call	STDOUT_PUTD	; putd
		call	STDOUT_NEWLN	; newln
		ret
xL809_foo__hla___hla_:
;L809_foo__hla_  endp




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


		push	L887_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iValue1__hla_+0], ax	;/* iValue1 */
		pop	eax
		mov	bx, word ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	bx
		mov	bx, 0
		push	bx
		call	L809_foo__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



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

		include	'quad_table.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'quad_table.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'quad_table.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'quad_table.consts.inc'

		include	'quad_table.ro.inc'

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


		push	L821_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_iDataValue__hla_+0], eax	;/* iDataValue */
		pop	eax
		push	dword ptr [L806_iDataValue__hla_+0]	; (type int32 iDataValue)
		call	STDOUT_PUTI32	; puti32
		mov	eax, dword ptr [L806_iDataValue__hla_+0]	;/* iDataValue */
		mov	ebx, eax
		mov	ecx, eax
		push	L858_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L876_str__hla_
		call	STDOUT_PUTS	; puts
		rol	eax, 2
		push	eax
		call	STDOUT_PUTI32	; puti32
		push	L890_str__hla_
		call	STDOUT_PUTS	; puts
		rol	eax, 2
		push	eax
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		add	ebx, 1
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L917_str__hla_
		call	STDOUT_PUTS	; puts
		rol	ebx, 2
		push	ebx
		call	STDOUT_PUTI32	; puti32
		push	L931_str__hla_
		call	STDOUT_PUTS	; puts
		rol	ebx, 2
		push	ebx
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		add	ecx, 2
		push	ecx
		call	STDOUT_PUTI32	; puti32
		push	L958_str__hla_
		call	STDOUT_PUTS	; puts
		rol	ecx, 2
		push	ecx
		call	STDOUT_PUTI32	; puti32
		push	L972_str__hla_
		call	STDOUT_PUTS	; puts
		rol	ecx, 2
		push	ecx
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



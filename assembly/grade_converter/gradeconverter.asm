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

		include	'gradeconverter.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'gradeconverter.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'gradeconverter.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'gradeconverter.consts.inc'

		include	'gradeconverter.ro.inc'

; Code begins here:
L807_grader__hla_:
		pop	dword ptr [L808_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	dword ptr [ebp+8]	;/* percentage */
		push	dword ptr [L808_iReturnAddress__hla_+0]	;/* iReturnAddress */
		finit
		fld	dword ptr [ebp+8]	;/* percentage */
		fld	[L810_fpconst__hla_]
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L811_MoreThan90__hla_
		jmp	L812_LessThan90__hla_

L811_MoreThan90__hla_:
		mov	byte ptr [L809_result1__hla_+0], 65	;/* result1 */
		mov	al, byte ptr [L809_result1__hla_+0]	;/* result1 */
		push	L826_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTC	; putc
		call	STDOUT_NEWLN	; newln
		jmp	L840_theEnd__hla_

L812_LessThan90__hla_:
		finit
		fld	dword ptr [ebp+8]	;/* percentage */
		fld	[L841_fpconst__hla_]
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L842_MoreThan80__hla_
		jmp	L843_LessThan80__hla_

L842_MoreThan80__hla_:
		mov	byte ptr [L809_result1__hla_+0], 66	;/* result1 */
		mov	al, byte ptr [L809_result1__hla_+0]	;/* result1 */
		push	L857_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTC	; putc
		call	STDOUT_NEWLN	; newln
		jmp	L840_theEnd__hla_

L843_LessThan80__hla_:
		finit
		fld	dword ptr [ebp+8]	;/* percentage */
		fld	[L871_fpconst__hla_]
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L872_MoreThan70__hla_
		jmp	L873_LessThan70__hla_

L872_MoreThan70__hla_:
		mov	byte ptr [L809_result1__hla_+0], 67	;/* result1 */
		mov	al, byte ptr [L809_result1__hla_+0]	;/* result1 */
		push	L887_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTC	; putc
		call	STDOUT_NEWLN	; newln
		jmp	L840_theEnd__hla_

L873_LessThan70__hla_:
		finit
		fld	dword ptr [ebp+8]	;/* percentage */
		fld	[L901_fpconst__hla_]
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L902_MoreThan60__hla_
		jmp	L903_LessThan60__hla_

L902_MoreThan60__hla_:
		mov	byte ptr [L809_result1__hla_+0], 68	;/* result1 */
		mov	al, byte ptr [L809_result1__hla_+0]	;/* result1 */
		push	L917_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTC	; putc
		call	STDOUT_NEWLN	; newln
		jmp	L840_theEnd__hla_

L903_LessThan60__hla_:
		mov	byte ptr [L809_result1__hla_+0], 70	;/* result1 */
		mov	al, byte ptr [L809_result1__hla_+0]	;/* result1 */
		push	L944_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTC	; putc

L840_theEnd__hla_:
		ret
xL807_grader__hla___hla_:
;L807_grader__hla_ endp




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


		push	L958_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_percent__hla_+0]	;/* percent */
		pop	eax
		push	dword ptr [L806_percent__hla_+0]	;/* percent */
		call	L807_grader__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



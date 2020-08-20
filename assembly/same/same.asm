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

		include	'same.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'same.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'same.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'same.consts.inc'

		include	'same.ro.inc'

; Code begins here:
L811_theSame__hla_:
		pop	dword ptr [L812_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [ebp+8]	;/* z */
		pop	word ptr [ebp+12]	;/* y */
		pop	word ptr [ebp+16]	;/* x */
		pop	word ptr [ebp+20]	;/* w */
		push	dword ptr [L812_iReturnAddress__hla_+0]	;/* iReturnAddress */
		mov	dx, word ptr [ebp+20]	;/* w */

L813_compareWX__hla_:
		cmp	word ptr [ebp+16], dx	;/* x */
		JE	L814_compareWY__hla_
		jmp	L815_notEqualWXYZ__hla_

L814_compareWY__hla_:
		cmp	word ptr [ebp+12], dx	;/* y */
		JE	L816_compareWZ__hla_
		jmp	L815_notEqualWXYZ__hla_

L816_compareWZ__hla_:
		cmp	word ptr [ebp+8], dx	;/* z */
		JE	L817_equalWXYZ__hla_
		jmp	L815_notEqualWXYZ__hla_

L817_equalWXYZ__hla_:
		mov	al, 1
		jmp	L818_exitTheSameFunction__hla_

L815_notEqualWXYZ__hla_:
		mov	al, 0
		jmp	L818_exitTheSameFunction__hla_

L818_exitTheSameFunction__hla_:
		ret
xL811_theSame__hla___hla_:
;L811_theSame__hla_ endp




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


		push	L832_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iDataValue1__hla_+0], ax	;/* iDataValue1 */
		pop	eax
		push	L854_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_iDataValue2__hla_+0], ax	;/* iDataValue2 */
		pop	eax
		push	L876_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_iDataValue3__hla_+0], ax	;/* iDataValue3 */
		pop	eax
		push	L898_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L809_iDataValue4__hla_+0], ax	;/* iDataValue4 */
		pop	eax
		push	word ptr [L806_iDataValue1__hla_+0]	;/* iDataValue1 */
		push	word ptr [L807_iDataValue2__hla_+0]	;/* iDataValue2 */
		push	word ptr [L808_iDataValue3__hla_+0]	;/* iDataValue3 */
		push	word ptr [L809_iDataValue4__hla_+0]	;/* iDataValue4 */
		call	L811_theSame__hla_
		mov	byte ptr [L810_resultValue__hla_+0], al	;/* resultValue */
		cmp	byte ptr [L810_resultValue__hla_+0], 0	;/* resultValue */
		JE	L907_notTheSame__hla_
		jmp	L908_allSame__hla_

L907_notTheSame__hla_:
		push	L922_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L810_resultValue__hla_+0]	; (type int8 resultValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		jmp	L933_endProgram__hla_

L908_allSame__hla_:
		push	L947_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L810_resultValue__hla_+0]	; (type int8 resultValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		jmp	L933_endProgram__hla_

L933_endProgram__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



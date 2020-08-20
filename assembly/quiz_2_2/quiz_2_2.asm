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

		include	'quiz_2_2.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'quiz_2_2.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'quiz_2_2.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'quiz_2_2.consts.inc'

		include	'quiz_2_2.ro.inc'

; Code begins here:
L811_largest__hla_:
		pop	dword ptr [L812_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+8], bl	;/* value4 */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+12], bl	;/* value3 */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+16], bl	;/* value2 */
		pop	word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	bx, word ptr [L813_iTemporary__hla_+0]	;/* iTemporary */
		mov	byte ptr [ebp+20], bl	;/* value1 */
		push	dword ptr [L812_iReturnAddress__hla_+0]	;/* iReturnAddress */
		mov	dl, byte ptr [ebp+20]	;/* value1 */

L814_compare12__hla_:
		cmp	dl, byte ptr [ebp+16]	;/* value2 */
		JL	L815_DL_is_Less_than_value2__hla_
		jmp	L816_compare3__hla_

L815_DL_is_Less_than_value2__hla_:
		mov	dl, byte ptr [ebp+16]	;/* value2 */

L816_compare3__hla_:
		cmp	dl, byte ptr [ebp+12]	;/* value3 */
		JL	L817_DL_is_Less_than_value3__hla_
		jmp	L818_compare4__hla_

L817_DL_is_Less_than_value3__hla_:
		mov	dl, byte ptr [ebp+12]	;/* value3 */

L818_compare4__hla_:
		cmp	dl, byte ptr [ebp+8]	;/* value4 */
		JL	L819_DL_is_Less_than_value4__hla_
		jmp	L820_endFunction__hla_

L819_DL_is_Less_than_value4__hla_:
		mov	dl, byte ptr [ebp+8]	;/* value4 */

L820_endFunction__hla_:
		mov	ah, dl
		ret
xL811_largest__hla___hla_:
;L811_largest__hla_ endp




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


		mov	byte ptr [L806_iDataValue1__hla_+0], 1	;/* iDataValue1 */
		mov	bl, byte ptr [L806_iDataValue1__hla_+0]	;/* iDataValue1 */
		push	bx
		mov	byte ptr [L807_iDataValue2__hla_+0], 10	;/* iDataValue2 */
		mov	bl, byte ptr [L807_iDataValue2__hla_+0]	;/* iDataValue2 */
		push	bx
		mov	byte ptr [L808_iDataValue3__hla_+0], 20	;/* iDataValue3 */
		mov	bl, byte ptr [L808_iDataValue3__hla_+0]	;/* iDataValue3 */
		push	bx
		mov	byte ptr [L809_iDataValue4__hla_+0], 0	;/* iDataValue4 */
		mov	bl, byte ptr [L809_iDataValue4__hla_+0]	;/* iDataValue4 */
		push	bx
		call	L811_largest__hla_
		mov	byte ptr [L810_resultValue__hla_+0], ah	;/* resultValue */
		push	L834_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_iDataValue1__hla_+0]	; (type int8 iDataValue1)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L845_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L807_iDataValue2__hla_+0]	; (type int8 iDataValue2)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L856_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L808_iDataValue3__hla_+0]	; (type int8 iDataValue3)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L867_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L809_iDataValue4__hla_+0]	; (type int8 iDataValue4)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L878_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L810_resultValue__hla_+0]	; (type int8 resultValue)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L889_str__hla_
		call	STDOUT_PUTS	; puts
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



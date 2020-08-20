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

		include	'surface.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'surface.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'surface.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'surface.consts.inc'

		include	'surface.ro.inc'

; Code begins here:
L811_surfaceFinder__hla_:
		pop	dword ptr [L812_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	dword ptr [L814_height__hla_+0]	;/* height */
		pop	dword ptr [L813_radius__hla_+0]	;/* radius */
		push	dword ptr [L812_iReturnAddress__hla_+0]	;/* iReturnAddress */
		finit
		fld	[L815_fpconst__hla_]
		fldpi
		fld	dword ptr [L813_radius__hla_+0]	;/* radius */
		fld	dword ptr [L813_radius__hla_+0]	;/* radius */
		fmulp
		fmulp
		fmulp
		fstp	dword ptr [L808_sphere_surface__hla_+0]	;/* sphere_surface */
		fld	[L816_fpconst__hla_]
		fld	dword ptr [L814_height__hla_+0]	;/* height */
		fld	dword ptr [L814_height__hla_+0]	;/* height */
		fmulp
		fmulp
		fstp	dword ptr [L809_cube_surface__hla_+0]	;/* cube_surface */
		fld	[L817_fpconst__hla_]
		fldpi
		fld	dword ptr [L813_radius__hla_+0]	;/* radius */
		fld	dword ptr [L813_radius__hla_+0]	;/* radius */
		fmulp
		fld	dword ptr [L813_radius__hla_+0]	;/* radius */
		fld	dword ptr [L814_height__hla_+0]	;/* height */
		fmulp
		faddp
		fmulp
		fmulp
		fstp	dword ptr [L810_cylinder_surface__hla_+0]	;/* cylinder_surface */
		ret
xL811_surfaceFinder__hla___hla_:
;L811_surfaceFinder__hla_ endp




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


		push	L831_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L849_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_r__hla_+0]	;/* r */
		pop	eax
		push	L871_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L807_h__hla_+0]	;/* h */
		pop	eax
		push	dword ptr [L806_r__hla_+0]	;/* r */
		push	dword ptr [L807_h__hla_+0]	;/* h */
		call	L811_surfaceFinder__hla_
		push	L893_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_sphere_surface__hla_+0]	; sphere_surface
		push	dword 08h
		push	dword 05h
		call	STDOUT_PUTR32	; putr32
		push	L907_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L925_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_cube_surface__hla_+0]	; cube_surface
		push	dword 08h
		push	dword 05h
		call	STDOUT_PUTR32	; putr32
		push	L939_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L957_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L810_cylinder_surface__hla_+0]	; cylinder_surface
		push	dword 08h
		push	dword 05h
		call	STDOUT_PUTR32	; putr32
		push	L971_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp



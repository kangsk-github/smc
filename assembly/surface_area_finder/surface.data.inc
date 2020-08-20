		label	L806_r__hla_ dword
		rb	4
		label	L807_h__hla_ dword
		rb	4
		label	L808_sphere_surface__hla_ dword
		rb	4
		label	L809_cube_surface__hla_ dword
		rb	4
		label	L810_cylinder_surface__hla_ dword
		rb	4
		label	L812_iReturnAddress__hla_ dword
		rb	4
		label	L813_radius__hla_ dword
		rb	4
		label	L814_height__hla_ dword
		rb	4
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_

		label	L806_semester__hla_ byte
		db	00h
		label	L807_enrolled_units__hla_ byte
		db	00h
		label	L808_bool_resident__hla_ byte
		db	00h
		label	L809_bool_parking__hla_ byte
		db	00h
		label	L810_i__hla_ byte
		db	00h
		label	L811_tuition__hla_ word
		dw 	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_

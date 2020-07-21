		label	L806_start__hla_ byte
		db	00h
		label	L807_value__hla_ byte
		db	00h
		label	L808_amount__hla_ byte
		db	00h
		label	L809_bool_positive__hla_ byte
		db	00h
		label	L810_i__hla_ byte
		db	00h
		label	L811_j__hla_ byte
		db	00h
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_

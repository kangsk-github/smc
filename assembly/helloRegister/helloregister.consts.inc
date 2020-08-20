
		align	4
		label	L820_len__hla_ word
		dd	017h
		dd	017h
		label	L820_str__hla_ byte
		db	"Hello, World Procedure!"
		db	0


		align	4
		label	L838_len__hla_ word
		dd	05h
		dd	05h
		label	L838_str__hla_ byte
		db	"AX : "
		db	0

		db	0
		db	0

		align	4
		label	L862_len__hla_ word
		dd	0eh
		dd	0eh
		label	L862_str__hla_ byte
		db	"value of AX = "
		db	0

		db	0

		align	4
		label	L886_len__hla_ word
		dd	016h
		dd	016h
		label	L886_str__hla_ byte
		db	"Calling Hello Register"
		db	0

		db	0

		align	4
		label	L904_len__hla_ word
		dd	01ch
		dd	01ch
		label	L904_str__hla_ byte
		db	"Returned from Hello Register"
		db	0

		db	0
		db	0
		db	0

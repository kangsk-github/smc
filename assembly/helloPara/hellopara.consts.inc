
		align	4
		label	L822_len__hla_ word
		dd	05h
		dd	05h
		label	L822_str__hla_ byte
		db	" i : "
		db	0

		db	0
		db	0

		align	4
		label	L846_len__hla_ word
		dd	017h
		dd	017h
		label	L846_str__hla_ byte
		db	"Hello, World Procedure!"
		db	0


		align	4
		label	L864_len__hla_ word
		dd	0eh
		dd	0eh
		label	L864_str__hla_ byte
		db	"value of AX = "
		db	0

		db	0

		align	4
		label	L888_len__hla_ word
		dd	012h
		dd	012h
		label	L888_str__hla_ byte
		db	"value of iValue = "
		db	0

		db	0

		align	4
		label	L912_len__hla_ word
		dd	018h
		dd	018h
		label	L912_str__hla_ byte
		db	"Calling Hello Parameters"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L930_len__hla_ word
		dd	01eh
		dd	01eh
		label	L930_str__hla_ byte
		db	"Returned from Hello Parameters"
		db	0

		db	0

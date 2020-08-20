
		align	4
		label	L842_len__hla_ word
		dd	020h
		dd	020h
		label	L842_str__hla_ byte
		db	"Please enter a string to process"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L860_len__hla_ word
		dd	026h
		dd	026h
		label	L860_str__hla_ byte
		db	"----> here is the string you entered: "
		db	0

		db	0

		align	4
		label	L874_len__hla_ word
		dd	07h
		dd	07h
		label	L874_str__hla_ byte
		db	"result="
		db	0


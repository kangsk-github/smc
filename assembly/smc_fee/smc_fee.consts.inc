
		align	4
		label	L825_len__hla_ word
		dd	02bh
		dd	02bh
		label	L825_str__hla_ byte
		db	"Fee me (2 hex digits with bits prsseeee) : "
		db	0


		align	4
		label	L851_len__hla_ word
		dd	0dh
		dd	0dh
		label	L851_str__hla_ byte
		db	"Fall Semester"
		db	0

		db	0
		db	0

		align	4
		label	L870_len__hla_ word
		dd	0fh
		dd	0fh
		label	L870_str__hla_ byte
		db	"Winter Semester"
		db	0


		align	4
		label	L888_len__hla_ word
		dd	0fh
		dd	0fh
		label	L888_str__hla_ byte
		db	"Spring Semester"
		db	0


		align	4
		label	L906_len__hla_ word
		dd	0fh
		dd	0fh
		label	L906_str__hla_ byte
		db	"Summer Semester"
		db	0


		align	4
		label	L930_len__hla_ word
		dd	06h
		dd	06h
		label	L930_str__hla_ byte
		db	" units"
		db	0

		db	0

		align	4
		label	L950_len__hla_ word
		dd	0bh
		dd	0bh
		label	L950_str__hla_ byte
		db	"CA Resident"
		db	0


		align	4
		label	L969_len__hla_ word
		dd	0ch
		dd	0ch
		label	L969_str__hla_ byte
		db	"Non-Resident"
		db	0

		db	0
		db	0
		db	0

		align	4
		label	L989_len__hla_ word
		dd	07h
		dd	07h
		label	L989_str__hla_ byte
		db	"Parking"
		db	0


		align	4
		label	L1008_len__hla_ word
		dd	0ah
		dd	0ah
		label	L1008_str__hla_ byte
		db	"No Parking"
		db	0

		db	0

		align	4
		label	L1041_len__hla_ word
		dd	0fh
		dd	0fh
		label	L1041_str__hla_ byte
		db	"Total Fees = $ "
		db	0


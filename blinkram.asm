;; Count demo for Episode 0B
;; This program tests that the RAM is working


;; There is a 74HCT574 mapped at $8000
OPORT EQU $8000


;; Count variable in RAM
count_var EQU $1000


;; Program code
	;; Addresses from $8000 to $8FFF are reserved for I/O devices.
	ORG $8000
	FILL $FF, 4096

	;; Addresses from $9000 to $FFFF are ROM, so that's where
	;; code and read-only data are located.
	ORG $9000


;; Entry point for count program
count_entry
	;; put system stack at top of RAM
	lds #$7FFE

	;; clear count variable
	lda #0
	sta count_var


main_loop
	lda count_var                 ; load count variable
	sta OPORT                     ; store to output port

	inca                          ; increment count
	sta count_var                 ; store updated value to count

	jsr delay                     ; delay
	jmp main_loop                 ; repeat main loop


;; Delay routine: clobbers A and X.
delay
	ldx #0
1
	leax 1,X
	cmpx #$ffff
	blo 1B
	rts


;; reset vector
	ORG $FFFE
	FDB count_entry


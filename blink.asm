;; There is a 74HCT574 mapped at $8000.  Its outputs are sent to
;; a common-anode 7 segment LED display.  Bits 0-6 control segments
;; A-F, and bit 7 controls the decimal point.  Set a bit to 0
;; to light the corresponding LED.  Set a bit to 1 to turn off the
;; corresponding LED.


;; Address of the output port
OPORT EQU $8000


;; Bits controlling LED display segments.
SEG_A EQU (1<<0)
SEG_B EQU (1<<1)
SEG_C EQU (1<<2)
SEG_D EQU (1<<3)
SEG_E EQU (1<<4)
SEG_F EQU (1<<5)
SEG_G EQU (1<<6)


;; Common 7 segment characters
_A EQU (SEG_A|SEG_B|SEG_C|SEG_E|SEG_F|SEG_G) ;; A
_B EQU (SEG_C|SEG_D|SEG_E|SEG_F|SEG_G) ;; B
_C EQU (SEG_D|SEG_E|SEG_G) ;; C
_D EQU (SEG_B|SEG_C|SEG_D|SEG_E|SEG_G) ;; D
_E EQU (SEG_A|SEG_D|SEG_E|SEG_F|SEG_G) ;; E
_F EQU (SEG_A|SEG_E|SEG_F|SEG_G) ;; F
_G EQU (SEG_A|SEG_B|SEG_F|SEG_G|SEG_C|SEG_D) ;; G
_H EQU (SEG_B|SEG_F|SEG_G|SEG_C|SEG_E) ;; H
_I EQU (SEG_B|SEG_C) ;; I
_J EQU (SEG_B|SEG_C|SEG_D) ;; J
_L EQU (SEG_F|SEG_E|SEG_D) ;; L
_N EQU (SEG_G|SEG_E|SEG_C) ;; N
_O EQU (SEG_G|SEG_E|SEG_C|SEG_D) ;; O
_P EQU (SEG_A|SEG_B|SEG_F|SEG_G|SEG_E) ;; P
_Q EQU (SEG_A|SEG_B|SEG_F|SEG_G|SEG_C) ;; Q
_R EQU (SEG_F|SEG_G|SEG_E) ;; R
_S EQU (SEG_A|SEG_C|SEG_D|SEG_F|SEG_G) ;; S
_T EQU (SEG_F|SEG_G|SEG_E|SEG_D) ;; T
_U EQU (SEG_E|SEG_C|SEG_D) ;; U
_Y EQU (SEG_B|SEG_F|SEG_G|SEG_C|SEG_D) ;; y
_0 EQU (SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F) ;; 0
_1 EQU (SEG_B|SEG_C) ;; 1
_2 EQU (SEG_A|SEG_B|SEG_D|SEG_E|SEG_G) ;; 2
_3 EQU (SEG_A|SEG_B|SEG_C|SEG_D|SEG_G) ;; 3
_4 EQU (SEG_B|SEG_C|SEG_F|SEG_G) ;; 4
_5 EQU (SEG_A|SEG_C|SEG_D|SEG_F|SEG_G) ;; 5
_6 EQU (SEG_A|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G) ;; 6
_7 EQU (SEG_A|SEG_B|SEG_C) ;; 7
_8 EQU (SEG_A|SEG_B|SEG_C|SEG_D|SEG_E|SEG_F|SEG_G) ;; 8
_9 EQU (SEG_A|SEG_B|SEG_C|SEG_F|SEG_G) ;; 9
__ EQU (SEG_D) ;; _


;; Program code
        ;; Addresses from $8000 to $8FFF are reserved for I/O devices.
        ORG $8000
        FILL $FF, 4096
        ;; Addresses from $9000 to $FFFF are ROM, so that's where
        ;; code and read-only data are located.
        ORG $9000


;; Entry point for blink program
blink_entry
        ;; B is a counter selecting one of the 16 possible
        ;; hex digit values to display.
        ldb #0


;; Main loop for the blink program.
main_loop
        ldx #hexfont               ; Load base address of hex font
        lda B,X                    ; Load bit pattern for hex digit
        sta OPORT                  ; Write bit pattern to output port

        ;; Delay loop
        ldx #0
1
        leax 1,X
        cmpx #$FFFF
        blo 1B

	;; Blank the display
	lda #$FF
	sta OPORT

        ;; Delay loop`
        ldx #0
1
        leax 1,X
        cmpx #$3FFF
        blo 1B

        ;; Increment B and then mask all but low 4 bits
        incb
        andb #$1F
        jmp main_loop


;; Bit patterns for the hex digits 0-9 and A-F
hexfont
        FCB ~(_H)
        FCB ~(_I)
        FCB ~(0)
        FCB ~(_N)
        FCB ~(_O)
        FCB ~(_T)
        FCB ~(_T)
        FCB ~(_I)
        FCB ~(_N)
        FCB ~(_G)
        FCB ~(_H)
        FCB ~(_A)
        FCB ~(_C)
        FCB ~(0)
        FCB ~(0)
        FCB ~(0)
        FCB ~(_H)
        FCB ~(_I)
        FCB ~(0)
        FCB ~(_N)
        FCB ~(_O)
        FCB ~(_T)
        FCB ~(_T)
        FCB ~(_I)
        FCB ~(_N)
        FCB ~(_G)
        FCB ~(_H)
        FCB ~(_A)
        FCB ~(_C)
        FCB ~(0)
        FCB ~(0)
        FCB ~(0)


;; Vectors
        ;; Reset vector: jump to blink_entry
        ORG $FFFE
        FDB blink_entry
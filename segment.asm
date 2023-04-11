
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
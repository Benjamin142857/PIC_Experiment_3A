opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6738"

opt pagewidth 120

	opt pm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_init
	FNCALL	_main,___lwdiv
	FNCALL	_main,_delay
	FNCALL	_main,___lwmod
	FNROOT	_main
	global	_RH
	global	_RL
	global	_temp
	global	_ADCON0
psect	text96,local,class=CODE,delta=2
global __ptext96
__ptext96:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_INTCON
_INTCON	set	11
	global	_RCSTA
_RCSTA	set	24
	global	_TXREG
_TXREG	set	25
	global	_ADGO
_ADGO	set	250
	global	_ADIF
_ADIF	set	102
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_SPBRG
_SPBRG	set	153
	global	_TXSTA
_TXSTA	set	152
	global	_TRISA0
_TRISA0	set	1064
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TRMT
_TRMT	set	1217
	file	"project.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_temp:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_RH:
       ds      2

_RL:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	??_init
??_init:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	delay@t
delay@t:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	delay@i
delay@i:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	delay@j
delay@j:	; 2 bytes @ 0x4
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x4
	ds	2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x6
	ds	1
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x7
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x7
	ds	2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x9
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xB
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xB
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xC
;;Data sizes: Strings 0, constant 0, data 0, bss 6, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      14
;; BANK0           80      0       4
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___lwmod
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     435
;;                               _init
;;                            ___lwdiv
;;                              _delay
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (1) ___lwmod                                              5     1      4     159
;;                                              7 COMMON     5     1      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___lwdiv                                              7     3      4     162
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                6     4      2     114
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   ___lwdiv
;;   _delay
;;   ___lwmod
;;     ___lwdiv (ARG)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      C       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0      12       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       4       5        5.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      13      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 8 in file "D:\expt7\task4.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_init
;;		___lwdiv
;;		_delay
;;		___lwmod
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\expt7\task4.c"
	line	8
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	9
	
l1239:	
;task4.c: 9: init();
	fcall	_init
	line	12
	
l1241:	
;task4.c: 12: ADGO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	13
;task4.c: 13: while(!ADIF);
	
l570:	
	btfss	(102/8),(102)&7
	goto	u271
	goto	u270
u271:
	goto	l570
u270:
	line	14
	
l1243:	
;task4.c: 14: RH=ADRESH;
	movf	(30),w	;volatile
	movwf	(_RH)
	clrf	(_RH+1)
	line	15
;task4.c: 15: RL=ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_RL)
	clrf	(_RL+1)
	line	17
;task4.c: 17: temp = RH*256 + RL;
	movf	(_RH+1),w
	movwf	(_temp+1)
	movf	(_RH),w
	movwf	(_temp)
	movf	(_temp),w
	movwf	(_temp+1)
	clrf	(_temp)
	movf	(_RL),w
	addwf	(_temp),f
	skipnc
	incf	(_temp+1),f
	movf	(_RL+1),w
	addwf	(_temp+1),f
	line	20
	
l1245:	
;task4.c: 20: TXREG=(temp/1000) + 0x30;
	movlw	low(03E8h)
	movwf	(?___lwdiv)
	movlw	high(03E8h)
	movwf	((?___lwdiv))+1
	movf	(_temp+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(_temp),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	030h
	movwf	(25)	;volatile
	line	21
;task4.c: 21: while(!TRMT);
	
l573:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u281
	goto	u280
u281:
	goto	l573
u280:
	line	22
	
l1247:	
;task4.c: 22: delay(5);
	movlw	05h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	25
	
l1249:	
;task4.c: 25: TXREG=(temp/100)%10 + 0x30;
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movlw	064h
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(_temp+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(_temp),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	26
;task4.c: 26: while(!TRMT);
	
l576:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u291
	goto	u290
u291:
	goto	l576
u290:
	line	27
	
l1251:	
;task4.c: 27: delay(5);
	movlw	05h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	30
	
l1253:	
;task4.c: 30: TXREG=(temp/10)%10 + 0x30;
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movlw	0Ah
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	movf	(_temp+1),w
	movwf	1+(?___lwdiv)+02h
	movf	(_temp),w
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	31
;task4.c: 31: while(!TRMT);
	
l579:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u301
	goto	u300
u301:
	goto	l579
u300:
	line	32
	
l1255:	
;task4.c: 32: delay(5);
	movlw	05h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	35
	
l1257:	
;task4.c: 35: TXREG=temp%10 + 0x30;
	movlw	0Ah
	movwf	(?___lwmod)
	clrf	(?___lwmod+1)
	movf	(_temp+1),w
	movwf	1+(?___lwmod)+02h
	movf	(_temp),w
	movwf	0+(?___lwmod)+02h
	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	36
;task4.c: 36: while(!TRMT);
	
l582:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u311
	goto	u310
u311:
	goto	l582
u310:
	line	37
	
l1259:	
;task4.c: 37: delay(5);
	movlw	05h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	40
	
l1261:	
;task4.c: 40: TXREG=0x0A;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	41
;task4.c: 41: while(!TRMT);
	
l585:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u321
	goto	u320
u321:
	goto	l585
u320:
	line	42
	
l1263:	
;task4.c: 42: delay(5);
	movlw	05h
	movwf	(?_delay)
	clrf	(?_delay+1)
	fcall	_delay
	line	44
;task4.c: 44: delay(400);
	movlw	low(0190h)
	movwf	(?_delay)
	movlw	high(0190h)
	movwf	((?_delay))+1
	fcall	_delay
	goto	l1241
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	46
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	___lwmod
psect	text97,local,class=CODE,delta=2
global __ptext97
__ptext97:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.80\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    7[COMMON] unsigned int 
;;  dividend        2    9[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    7[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/20
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text97
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 7
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l1219:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u231
	goto	u230
u231:
	goto	l1235
u230:
	line	9
	
l1221:	
	clrf	(___lwmod@counter)
	incf	(___lwmod@counter),f
	line	10
	goto	l1225
	line	11
	
l1223:	
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	line	12
	incf	(___lwmod@counter),f
	line	10
	
l1225:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u241
	goto	u240
u241:
	goto	l1223
u240:
	line	15
	
l1227:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u255
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u255:
	skipc
	goto	u251
	goto	u250
u251:
	goto	l1231
u250:
	line	16
	
l1229:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	line	17
	
l1231:	
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	line	18
	
l1233:	
	decfsz	(___lwmod@counter),f
	goto	u261
	goto	u260
u261:
	goto	l1227
u260:
	line	20
	
l1235:	
	movf	(___lwmod@dividend+1),w
	movwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	movwf	(?___lwmod)
	line	21
	
l632:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text98,local,class=CODE,delta=2
global __ptext98
__ptext98:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.80\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    4[COMMON] unsigned int 
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text98
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 7
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l1193:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l1195:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u191
	goto	u190
u191:
	goto	l1215
u190:
	line	11
	
l1197:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l1201
	line	13
	
l1199:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l1201:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u201
	goto	u200
u201:
	goto	l1199
u200:
	line	17
	
l1203:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l1205:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u215
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u215:
	skipc
	goto	u211
	goto	u210
u211:
	goto	l1211
u210:
	line	19
	
l1207:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l1209:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l1211:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l1213:	
	decfsz	(___lwdiv@counter),f
	goto	u221
	goto	u220
u221:
	goto	l1203
u220:
	line	25
	
l1215:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l622:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_delay
psect	text99,local,class=CODE,delta=2
global __ptext99
__ptext99:

;; *************** function _delay *****************
;; Defined at:
;;		line 67 in file "D:\expt7\task4.c"
;; Parameters:    Size  Location     Type
;;  t               2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  j               2    4[COMMON] int 
;;  i               2    2[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text99
	file	"D:\expt7\task4.c"
	line	67
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg+status,2+status,0+btemp+1]
	line	69
	
l1173:	
;task4.c: 68: int i, j;
;task4.c: 69: for(i=t; i>0; i--) {
	movf	(delay@t+1),w
	movwf	(delay@i+1)
	movf	(delay@t),w
	movwf	(delay@i)
	
l1175:	
	movf	(delay@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u175
	movlw	low(01h)
	subwf	(delay@i),w
u175:

	skipnc
	goto	u171
	goto	u170
u171:
	goto	l1179
u170:
	goto	l600
	line	70
	
l1179:	
;task4.c: 70: for(j=0; j<100; j++);
	clrf	(delay@j)
	clrf	(delay@j+1)
	
l1185:	
	incf	(delay@j),f
	skipnz
	incf	(delay@j+1),f
	
l1187:	
	movf	(delay@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u185
	movlw	low(064h)
	subwf	(delay@j),w
u185:

	skipc
	goto	u181
	goto	u180
u181:
	goto	l1185
u180:
	line	69
	
l1189:	
	movlw	-1
	addwf	(delay@i),f
	skipc
	decf	(delay@i+1),f
	goto	l1175
	line	72
	
l600:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_init
psect	text100,local,class=CODE,delta=2
global __ptext100
__ptext100:

;; *************** function _init *****************
;; Defined at:
;;		line 48 in file "D:\expt7\task4.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text100
	file	"D:\expt7\task4.c"
	line	48
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 7
; Regs used in _init: [wreg+status,2]
	line	50
	
l1159:	
;task4.c: 50: TRISC6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1086/8)^080h,(1086)&7
	line	51
;task4.c: 51: TRISC7 = 1;
	bsf	(1087/8)^080h,(1087)&7
	line	54
	
l1161:	
;task4.c: 54: TXSTA = 0b00100100;
	movlw	(024h)
	movwf	(152)^080h	;volatile
	line	55
;task4.c: 55: RCSTA = 0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	56
;task4.c: 56: SPBRG = 25;
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(153)^080h	;volatile
	line	57
	
l1163:	
;task4.c: 57: INTCON = 0x00;
	clrf	(11)	;volatile
	line	60
	
l1165:	
;task4.c: 60: TRISA0=1;
	bsf	(1064/8)^080h,(1064)&7
	line	61
	
l1167:	
;task4.c: 61: ADCON1=0x8E;
	movlw	(08Eh)
	movwf	(159)^080h	;volatile
	line	62
	
l1169:	
;task4.c: 62: ADCON0=0x41;
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	63
	
l1171:	
;task4.c: 63: ADIF=0;
	bcf	(102/8),(102)&7
	line	64
	
l593:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
psect	text101,local,class=CODE,delta=2
global __ptext101
__ptext101:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

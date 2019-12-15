opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

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
	FNCALL	_main,_Delay
	FNROOT	_main
	FNCALL	_PIC_Int,_Delay1
	FNCALL	intlevel1,_PIC_Int
	global	intlevel1
	FNROOT	intlevel1
	global	_LED
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"E:\#Programming\Electronics\MPLAB\PIC_Experiment_3A\expt3\think.c"
	line	6
_LED:
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	06Fh
	global	_LED
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_RA1
_RA1	set	41
	global	_RA5
_RA5	set	45
	global	_RB5
_RB5	set	53
	global	_RBIE
_RBIE	set	91
	global	_RBIF
_RBIF	set	88
	global	_ADCON1
_ADCON1	set	159
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_INTEDG
_INTEDG	set	1038
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"expt3.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Delay1
?_Delay1:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_PIC_Int
?_PIC_Int:	; 0 bytes @ 0x0
	global	Delay1@delay
Delay1@delay:	; 2 bytes @ 0x0
	ds	2
	global	??_Delay1
??_Delay1:	; 0 bytes @ 0x2
	global	Delay1@i
Delay1@i:	; 2 bytes @ 0x2
	ds	2
	global	??_PIC_Int
??_PIC_Int:	; 0 bytes @ 0x4
	ds	4
	global	PIC_Int@i
PIC_Int@i:	; 2 bytes @ 0x8
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_Delay
?_Delay:	; 0 bytes @ 0x0
	global	Delay@delay
Delay@delay:	; 2 bytes @ 0x0
	ds	2
	global	??_Delay
??_Delay:	; 0 bytes @ 0x2
	global	Delay@i
Delay@i:	; 2 bytes @ 0x2
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	1
	global	main@i
main@i:	; 2 bytes @ 0x5
	ds	2
;;Data sizes: Strings 0, constant 10, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      10
;; BANK0           80      7       7
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _PIC_Int in COMMON
;;
;;   _PIC_Int->_Delay1
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_Delay
;;
;; Critical Paths under _PIC_Int in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _PIC_Int in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _PIC_Int in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _PIC_Int in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0     159
;;                                              4 BANK0      3     3      0
;;                              _Delay
;; ---------------------------------------------------------------------------------
;; (1) _Delay                                                4     2      2      91
;;                                              0 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _PIC_Int                                              6     6      0     135
;;                                              4 COMMON     6     6      0
;;                             _Delay1
;; ---------------------------------------------------------------------------------
;; (3) _Delay1                                               4     2      2      60
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Delay
;;
;; _PIC_Int (ROOT)
;;   _Delay1
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       5       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      7       7       5        8.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 20 in file "E:\#Programming\Electronics\MPLAB\PIC_Experiment_3A\expt3\think.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    5[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\#Programming\Electronics\MPLAB\PIC_Experiment_3A\expt3\think.c"
	line	20
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	21
	
l2751:	
;think.c: 21: ADCON1 = (ADCON1&0b11110000)|0b00000111;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(159)^080h,w
	andlw	0F0h
	iorlw	07h
	movwf	(159)^080h	;volatile
	line	22
;think.c: 22: TRISB = (TRISB&0b11011110)|0b00100001;
	movf	(134)^080h,w
	andlw	0DEh
	iorlw	021h
	movwf	(134)^080h	;volatile
	line	23
	
l2753:	
;think.c: 23: TRISD = 0x00;
	clrf	(136)^080h	;volatile
	line	24
	
l2755:	
;think.c: 24: TRISA = TRISA&0b11011101;
	movf	(133)^080h,w
	andlw	0DDh
	movwf	(133)^080h	;volatile
	line	27
	
l2757:	
;think.c: 27: INTEDG = 1;
	bsf	(1038/8)^080h,(1038)&7
	line	28
	
l2759:	
;think.c: 28: RBIE = 1;
	bsf	(91/8),(91)&7
	line	29
	
l2761:	
;think.c: 29: RBIF = 0;
	bcf	(88/8),(88)&7
	line	30
	
l2763:	
;think.c: 30: INTE = 1;
	bsf	(92/8),(92)&7
	line	31
	
l2765:	
;think.c: 31: INTF = 0;
	bcf	(89/8),(89)&7
	line	32
	
l2767:	
;think.c: 32: GIE = 1;
	bsf	(95/8),(95)&7
	line	33
	
l2769:	
;think.c: 33: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	line	34
	
l2771:	
;think.c: 34: RA5 = 0;
	bcf	(45/8),(45)&7
	line	36
;think.c: 36: while(1){
	
l691:	
	line	38
;think.c: 37: unsigned int i;
;think.c: 38: for(i=0; i<8; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2773:	
	movlw	high(08h)
	subwf	(main@i+1),w
	movlw	low(08h)
	skipnz
	subwf	(main@i),w
	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l2777
u2440:
	goto	l691
	
l2775:	
	goto	l691
	line	39
	
l692:	
	line	40
	
l2777:	
;think.c: 39: {
;think.c: 40: PORTD=(0x01<<i);
	movlw	(01h)
	movwf	(??_main+0)+0
	incf	(main@i),w
	goto	u2454
u2455:
	clrc
	rlf	(??_main+0)+0,f
u2454:
	addlw	-1
	skipz
	goto	u2455
	movf	0+(??_main+0)+0,w
	movwf	(8)	;volatile
	line	41
	
l2779:	
;think.c: 41: Delay(1000);
	movlw	low(03E8h)
	movwf	(?_Delay)
	movlw	high(03E8h)
	movwf	((?_Delay))+1
	fcall	_Delay
	line	38
	
l2781:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2783:	
	movlw	high(08h)
	subwf	(main@i+1),w
	movlw	low(08h)
	skipnz
	subwf	(main@i),w
	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l2777
u2460:
	goto	l691
	
l693:	
	goto	l691
	line	43
	
l694:	
	line	36
	goto	l691
	
l695:	
	line	44
	
l696:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Delay
psect	text134,local,class=CODE,delta=2
global __ptext134
__ptext134:

;; *************** function _Delay *****************
;; Defined at:
;;		line 83 in file "E:\#Programming\Electronics\MPLAB\PIC_Experiment_3A\expt3\think.c"
;; Parameters:    Size  Location     Type
;;  delay           2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text134
	file	"E:\#Programming\Electronics\MPLAB\PIC_Experiment_3A\expt3\think.c"
	line	83
	global	__size_of_Delay
	__size_of_Delay	equ	__end_of_Delay-_Delay
	
_Delay:	
	opt	stack 5
; Regs used in _Delay: [wreg+status,2+status,0]
	line	85
	
l2735:	
;think.c: 84: unsigned int i;
;think.c: 85: for (;delay>0; delay--)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((Delay@delay+1)),w
	iorwf	((Delay@delay)),w
	skipz
	goto	u2401
	goto	u2400
u2401:
	goto	l2739
u2400:
	goto	l713
	
l2737:	
	goto	l713
	line	86
	
l709:	
	
l2739:	
;think.c: 86: for (i=0; i<45; i++);
	clrf	(Delay@i)
	clrf	(Delay@i+1)
	
l2741:	
	movlw	high(02Dh)
	subwf	(Delay@i+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(Delay@i),w
	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l2745
u2410:
	goto	l2747
	
l2743:	
	goto	l2747
	
l711:	
	
l2745:	
	movlw	low(01h)
	addwf	(Delay@i),f
	skipnc
	incf	(Delay@i+1),f
	movlw	high(01h)
	addwf	(Delay@i+1),f
	movlw	high(02Dh)
	subwf	(Delay@i+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(Delay@i),w
	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l2745
u2420:
	goto	l2747
	
l712:	
	line	85
	
l2747:	
	movlw	low(01h)
	subwf	(Delay@delay),f
	movlw	high(01h)
	skipc
	decf	(Delay@delay+1),f
	subwf	(Delay@delay+1),f
	
l2749:	
	movf	((Delay@delay+1)),w
	iorwf	((Delay@delay)),w
	skipz
	goto	u2431
	goto	u2430
u2431:
	goto	l2739
u2430:
	goto	l713
	
l710:	
	line	88
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_Delay
	__end_of_Delay:
;; =============== function _Delay ends ============

	signat	_Delay,4216
	global	_PIC_Int
psect	text135,local,class=CODE,delta=2
global __ptext135
__ptext135:

;; *************** function _PIC_Int *****************
;; Defined at:
;;		line 47 in file "E:\#Programming\Electronics\MPLAB\PIC_Experiment_3A\expt3\think.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    8[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Delay1
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text135
	file	"E:\#Programming\Electronics\MPLAB\PIC_Experiment_3A\expt3\think.c"
	line	47
	global	__size_of_PIC_Int
	__size_of_PIC_Int	equ	__end_of_PIC_Int-_PIC_Int
	
_PIC_Int:	
	opt	stack 5
; Regs used in _PIC_Int: [allreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_PIC_Int+0)
	movf	fsr0,w
	movwf	(??_PIC_Int+1)
	movf	pclath,w
	movwf	(??_PIC_Int+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_PIC_Int+3)
	ljmp	_PIC_Int
psect	text135
	line	51
	
i1l1783:	
;think.c: 48: unsigned int i;
;think.c: 51: if(INTF) {
	btfss	(89/8),(89)&7
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l699
u5_20:
	line	52
	
i1l1785:	
;think.c: 52: PORTD=0x00;
	clrf	(8)	;volatile
	line	54
;think.c: 54: for(i=0; i<10; i++)
	clrf	(PIC_Int@i)
	clrf	(PIC_Int@i+1)
	
i1l1787:	
	movlw	high(0Ah)
	subwf	(PIC_Int@i+1),w
	movlw	low(0Ah)
	skipnz
	subwf	(PIC_Int@i),w
	skipc
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l700
u6_20:
	goto	i1l1823
	
i1l1789:	
	goto	i1l1823
	line	55
	
i1l700:	
	line	56
;think.c: 55: {
;think.c: 56: PORTD=~PORTD;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(8),f	;volatile
	line	57
	
i1l1791:	
;think.c: 57: Delay1(150);
	movlw	low(096h)
	movwf	(?_Delay1)
	movlw	high(096h)
	movwf	((?_Delay1))+1
	fcall	_Delay1
	line	54
	
i1l1793:	
	movlw	low(01h)
	addwf	(PIC_Int@i),f
	skipnc
	incf	(PIC_Int@i+1),f
	movlw	high(01h)
	addwf	(PIC_Int@i+1),f
	
i1l1795:	
	movlw	high(0Ah)
	subwf	(PIC_Int@i+1),w
	movlw	low(0Ah)
	skipnz
	subwf	(PIC_Int@i),w
	skipc
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l700
u7_20:
	goto	i1l1823
	
i1l701:	
	line	60
;think.c: 58: }
;think.c: 60: }
	goto	i1l1823
	line	62
	
i1l699:	
;think.c: 62: else if(RBIF && !RB5) {
	btfss	(88/8),(88)&7
	goto	u8_21
	goto	u8_20
u8_21:
	goto	i1l1823
u8_20:
	
i1l1797:	
	btfsc	(53/8),(53)&7
	goto	u9_21
	goto	u9_20
u9_21:
	goto	i1l1823
u9_20:
	line	63
	
i1l1799:	
;think.c: 63: PORTD=0x00;
	clrf	(8)	;volatile
	line	64
	
i1l1801:	
;think.c: 64: RA1 = 0;
	bcf	(41/8),(41)&7
	line	65
	
i1l1803:	
;think.c: 65: RA5 = 1;
	bsf	(45/8),(45)&7
	line	67
;think.c: 67: for(i=0; i<6; i++) {
	clrf	(PIC_Int@i)
	clrf	(PIC_Int@i+1)
	
i1l1805:	
	movlw	high(06h)
	subwf	(PIC_Int@i+1),w
	movlw	low(06h)
	skipnz
	subwf	(PIC_Int@i),w
	skipc
	goto	u10_21
	goto	u10_20
u10_21:
	goto	i1l1809
u10_20:
	goto	i1l1817
	
i1l1807:	
	goto	i1l1817
	
i1l704:	
	line	68
	
i1l1809:	
;think.c: 68: PORTD = LED[5-i];
	decf	(PIC_Int@i),w
	xorlw	0ffh
	addlw	05h
	addlw	low((_LED-__stringbase))
	movwf	fsr0
	fcall	stringdir
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	69
	
i1l1811:	
;think.c: 69: Delay1(300);
	movlw	low(012Ch)
	movwf	(?_Delay1)
	movlw	high(012Ch)
	movwf	((?_Delay1))+1
	fcall	_Delay1
	line	67
	
i1l1813:	
	movlw	low(01h)
	addwf	(PIC_Int@i),f
	skipnc
	incf	(PIC_Int@i+1),f
	movlw	high(01h)
	addwf	(PIC_Int@i+1),f
	
i1l1815:	
	movlw	high(06h)
	subwf	(PIC_Int@i+1),w
	movlw	low(06h)
	skipnz
	subwf	(PIC_Int@i),w
	skipc
	goto	u11_21
	goto	u11_20
u11_21:
	goto	i1l1809
u11_20:
	goto	i1l1817
	
i1l705:	
	line	71
	
i1l1817:	
;think.c: 70: }
;think.c: 71: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	72
	
i1l1819:	
;think.c: 72: RA1 = 1;
	bsf	(41/8),(41)&7
	line	73
	
i1l1821:	
;think.c: 73: RA5 = 0;
	bcf	(45/8),(45)&7
	goto	i1l1823
	line	76
	
i1l703:	
	goto	i1l1823
	line	77
	
i1l702:	
	
i1l1823:	
;think.c: 76: }
;think.c: 77: INTF = 0;
	bcf	(89/8),(89)&7
	line	78
	
i1l1825:	
;think.c: 78: RBIF = 0;
	bcf	(88/8),(88)&7
	line	79
	
i1l706:	
	movf	(??_PIC_Int+3),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_PIC_Int+2),w
	movwf	pclath
	movf	(??_PIC_Int+1),w
	movwf	fsr0
	swapf	(??_PIC_Int+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_PIC_Int
	__end_of_PIC_Int:
;; =============== function _PIC_Int ends ============

	signat	_PIC_Int,88
	global	_Delay1
psect	text136,local,class=CODE,delta=2
global __ptext136
__ptext136:

;; *************** function _Delay1 *****************
;; Defined at:
;;		line 90 in file "E:\#Programming\Electronics\MPLAB\PIC_Experiment_3A\expt3\think.c"
;; Parameters:    Size  Location     Type
;;  delay           2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_PIC_Int
;; This function uses a non-reentrant model
;;
psect	text136
	file	"E:\#Programming\Electronics\MPLAB\PIC_Experiment_3A\expt3\think.c"
	line	90
	global	__size_of_Delay1
	__size_of_Delay1	equ	__end_of_Delay1-_Delay1
	
_Delay1:	
	opt	stack 5
; Regs used in _Delay1: [wreg+status,2+status,0]
	line	92
	
i1l1827:	
;think.c: 91: unsigned int i;
;think.c: 92: for (;delay>0; delay--)
	movf	((Delay1@delay+1)),w
	iorwf	((Delay1@delay)),w
	skipz
	goto	u12_21
	goto	u12_20
u12_21:
	goto	i1l1831
u12_20:
	goto	i1l720
	
i1l1829:	
	goto	i1l720
	line	93
	
i1l716:	
	
i1l1831:	
;think.c: 93: for (i=0; i<45; i++);
	clrf	(Delay1@i)
	clrf	(Delay1@i+1)
	
i1l1833:	
	movlw	high(02Dh)
	subwf	(Delay1@i+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(Delay1@i),w
	skipc
	goto	u13_21
	goto	u13_20
u13_21:
	goto	i1l1837
u13_20:
	goto	i1l1839
	
i1l1835:	
	goto	i1l1839
	
i1l718:	
	
i1l1837:	
	movlw	low(01h)
	addwf	(Delay1@i),f
	skipnc
	incf	(Delay1@i+1),f
	movlw	high(01h)
	addwf	(Delay1@i+1),f
	movlw	high(02Dh)
	subwf	(Delay1@i+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(Delay1@i),w
	skipc
	goto	u14_21
	goto	u14_20
u14_21:
	goto	i1l1837
u14_20:
	goto	i1l1839
	
i1l719:	
	line	92
	
i1l1839:	
	movlw	low(01h)
	subwf	(Delay1@delay),f
	movlw	high(01h)
	skipc
	decf	(Delay1@delay+1),f
	subwf	(Delay1@delay+1),f
	
i1l1841:	
	movf	((Delay1@delay+1)),w
	iorwf	((Delay1@delay)),w
	skipz
	goto	u15_21
	goto	u15_20
u15_21:
	goto	i1l1831
u15_20:
	goto	i1l720
	
i1l717:	
	line	94
	
i1l720:	
	return
	opt stack 0
GLOBAL	__end_of_Delay1
	__end_of_Delay1:
;; =============== function _Delay1 ends ============

	signat	_Delay1,4216
psect	text137,local,class=CODE,delta=2
global __ptext137
__ptext137:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

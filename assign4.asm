**************************************
*
* Name: Avery Wald
* ID: ajw3p8
* Date: 4/3/19
* Lab4
*
* Program description: Calculates factorial for every value in N, and outputs factorials to NFAC array
*
* Pseudocode of Main Program:
*
* Pseudocode of Subroutine:
*
**************************************


* start of data section

	ORG $B000
N	FCB	0, 1, 2, 3, 6, 7, 8, 9, 10, $FF
SENTIN EQU	$FF

	ORG $B010
NFAC	RMB	18
I	RMB	1		INDEX OFFSET OF N
YO	RMB	1		INDEX OFFSET OF NFAC



* define any variables that your MAIN program might need here
* REMEMBER: Your subroutine must not access any of the main
* program variables including N and NFAC.



	ORG $C000
	LDS	#$01FF		initialize stack pointer
* start of your main program
	CLR	I
	CLR	YO
WHILE	LDX	#N
	LDAB	I
	ABX	I		GET CORRECT INDEX OF N
	CLRB
	LDY	#NFAC
	LDAB	YO
	ABY	YO		GET CORRECT INDEX OF NFAC
	CLRB
	LDAA	0,X		LOAD VALUE OF N AT INDEX INTO A
	CMPA	#SENTIN
	BEQ	ENDWHILE	WHILE N[I] < $FF
	JSR	SUB		JUMP TO SUBROUTINE
	PULA
	PULB			PULL VAL OFF STACK IN BIG ENDIAN	
	STD	0,Y		STORE VAL INTO NFAC[YO]
	INC	I		I++
	INC	YO
	INC	YO		YO += 2
	BRA	WHILE
ENDWHILE
DONE	BRA	DONE



* define any variables that your SUBROUTINE might need here
J	RMB	1
K	RMB	1
PS	RMB	2
SUM	RMB	2
VAL	RMB	1

	ORG $D000
* start of your subroutine
SUB	PULX			STORE RETURN ADDR FROM JSR
	CLR	VAL		INIT VAL = 0
	STAA	VAL		PASS N TO VAL
	CLRA
	ADDB	#1		B = 1
	CLR	J		INIT J = 0
	STAB	J		J = 1
	CLR	SUM
	CLR	SUM+1		INIT SUM = 0
	STD	SUM		SUM = 1
	CLR	K		INIT K = 0
WHL	LDAA	J
	CMPA	VAL	
	BHS	NDWHL		WHILE J < VAL
	CLR	K		K = 0
	LDD	SUM		
	STD	PS		PS = SUM
WHL2	LDAA	K
	CMPA	J
	BHS	NDWL2		WHILE K < J
	LDD	SUM
	ADDD	PS
	STD	SUM		SUM += PS	
	INC	K		K++
	BRA	WHL2
NDWL2
	INC	J		J++
	BRA	WHL
NDWHL 
	LDD	SUM
	PSHB
	PSHA			PUSH 2BYTE VALUE TO RETURN ONTO STACK
	PSHX			PUSH RETURN ADDR ON TOP OF STACK
	RTS

	
	
	



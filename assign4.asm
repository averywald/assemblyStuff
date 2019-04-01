**************************************
*
* Name: Avery Wald
* ID: ajw3p8
* Date: 4/3/19
* Lab4
*
* Program description:
*
* Pseudocode of Main Program:
*
* Pseudocode of Subroutine:
*
**************************************


* start of data section

	ORG $B000
N	FCB	0, 1, 2, 3, 6, 7, 8, 9, 10, $FF
SENTIN	EQU	$FF

	ORG $B010
NFAC	RMB	18



* define any variables that your MAIN program might need here
* REMEMBER: Your subroutine must not access any of the main
* program variables including N and NFAC.



	ORG $C000
	LDS	#$01FF		initialize stack pointer
* start of your main program



* define any variables that your SUBROUTINE might need here



	ORG $D000
* start of your subroutine


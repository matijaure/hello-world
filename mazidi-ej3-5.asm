; Ejemplo 3.5 Mazidi
; Sumar los valores 0x79, 0xF5 y 0xE2.
; Guardar la suma en R20 (parte baja) y R21 (parte alta).
 
.include "M328PDEF.INC"

.CSEG
.ORG 0

JMP MAIN
.ORG 0x36 ; salta el vector de interrupciones

MAIN:	LDI R16,LOW(RAMEND)
		OUT SPL,R16
		LDI R16,HIGH(RAMEND)
		OUT SPH,R16
		CLR R20 ; limpiar registro
		CLR R21
		LDI R16,0x79
		ADD R20,R16
		LDI R17,0xF5
		; 0x79 + 0xF5 = 0x6E , C = 1
		INC R21
		ADD R20,R17
		LDI R18,0xE2
		; 0x6E + 0xE2 = 0x50 , C = 1
		INC R21
		ADD R20,R18
HERE:	JMP HERE ; loop infinito 

;-------------------------------
;   MACRO HIEN MOT XAU KY TU	|
; KET THUC BANG '$' RA MAN HINH	|
;-------------------------------
HienString MACRO xau
	push AX 
	push DX
	mov  DX,offset xau	; DX tro den dau xau
	mov  AH,9		; Chuc nang hien 1 xau ky tu 
	int  21h		; (ket thuc bang '$') len man hinh
	pop  DX 
	pop AX
	ENDM
;--------------------
; MACRO XOA MAN HINH |
;--------------------
CLRSCR MACRO
	push AX
	mov  AH,0fh		; Chuc nang lay mode man hinh hien thoi
	int  10h		; va so mode nam o AL
	mov  AH,0		; Chuc nang dat mode cho man hinh
	int  10h		; so mode can dat nam o AL
	pop  AX
	ENDM
;-----------------------------
; MACRO HIEN XAU CO MAU SAC   |
; (KET THUC '\0' LEN MAN HINH |
;-----------------------------
BLINK	MACRO x,y,tt
	LOCAL B1,Exit_B
	push AX 
	push BX 
	push CX 
	push DX
	mov  DL,x		; Toa do x (cot)
	mov  DH,y		; Toa do y (so dong)
	mov  AH,2		; Chuc nang dua co tro den toa do x,y
	int  10h
   B1:
	mov  AL,[SI]		; Dua ky tu tro boi SI vao AL
	and  AL,AL		; Lieu ky tu do la '\0'
	jz   Exit_B		; Neu ky tu la '\0' thi nhay den ket thuc hien xau
	mov  CX,1		; Hien ky tu 1 lan
	mov  BL,tt		; Thuoc tinh (mau sac can hien)
	mov  AH,9		; Chuc nang hien cac ky tu co mau sac len man hinh
	int  10h
	inc  DL			; Tang so cot len 1
	mov  AH,2		; Dua con tro sang phai 
	int  10h
	inc  SI			; SI tro den ky tu tiep theo cua xau
	jmp  B1
  Exit_B:
	pop DX 
	pop CX 
	pop BX 
	pop AX
	ENDM
 
NHAPXAU MACRO XAU, lenstr
	LOCAL @INPUT_LOOP, @INPUT_ERROR, @END_INPUT, @NOT_BACKSPACE
	push AX 
	push BX 
	push CX 
	push DX 
		CLD
		LEA DI, XAU
		XOR BX,BX
		@INPUT_LOOP:
		MOV AH,1 ; dua ky tu vua nhap tu ban phim vao AL
		INT 21H

		CMP AL, 0DH
		JE @END_INPUT

		CMP AL,08H
		JNE @NOT_BACKSPACE

		CMP BX,0
		JE @INPUT_ERROR

		MOV AH,2
		MOV DL, 20H
		INT 21H

		MOV DL,08H ; NEU LA KY TUC BACKSPACE THI GIAM BX, DI
		INT 21H

		DEC BX
		DEC DI
		JMP @INPUT_LOOP

		@INPUT_ERROR:
		MOV AH,2
		MOV DL,07H
		INT 21H

		MOV DL,20H
		INT 21H
		JMP @INPUT_LOOP

		@NOT_BACKSPACE:
		;STOSB
		MOV al,[di]
		INC BX	; LUU SO KY TU NHAP VAO
		JMP @INPUT_LOOP

		@END_INPUT:
		;mov [bx],0
		mov lenstr,bx
	pop DX 
	pop CX 
	pop BX 
	pop AX
ENDM

HIENXAU MACRO XAU, lenstr
	local @SHOW_CHR
	push AX 
	push BX 
	push CX 
	push DX 
	
	LEA SI,[XAU]
	MOV CX, lenstr
	CLD
	MOV AH,2

	@SHOW_CHR:
		LODSB
		MOV DL,AL
		INT 21H
	LOOP @SHOW_CHR
	
	pop DX 
	pop CX 
	pop BX 
	pop AX
ENDM

DOSRET MACRO
	mov ah,4ch
	int 21h
ENDM

NewLine MACRO
	push ax 
	push dx
    mov ah,2 
    mov dl,0Dh ; Enter
    int 21h 
    mov dl,0Ah ; LINE FEED
    int 21h
    pop dx 
    pop ax 
ENDM
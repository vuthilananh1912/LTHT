GET_FILENAME proc
	push ax
	push bx
	push cx
	push dx
	CLD
	;lea di,FILE_NAME
	;mov DI,dx
	XOR BX,BX
	@INPUT_LOOP:
	MOV AH,1 ; dua ky tu vua nhap tu ban phim vao AL
	INT 21H

	CMP AL, 0DH ; neu la phim enter thi ket thuc
	JE @END_INPUT

	CMP AL,08H ; neu khong phai phim BACKSPACE
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
	mov byte ptr[di],al ; xem lai ong nay
	INC DI
	INC BX	; LUU SO KY TU NHAP VAO
	JMP @INPUT_LOOP

	@END_INPUT:
	xor ch,ch
	mov byte ptr[di],ch
	
	pop dx
	pop cx
	pop bx
	pop ax
	
	RET
GET_FILENAME endp
;END
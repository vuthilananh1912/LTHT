include lib1.asm
.model small
.stack 100h
.data
    msg1             db 13,10, 'Hay nhap nam sinh: $' 
    msg2            db 13,10, 'Nhap sai, yeu cau nhap lai: $'
    msg3            db 13,10, 'Tuoi cua ban la: $'
    tieptuc         db 13,10, 'Co tiep tuc CT (c/k)? $' 
    buff            db 30
                    db ?
    file_name       db 30 dup(?)
.code
PUBLIC @CN4$qv
@CN4$qv proc
    L_CT0:
    mov  ax, @data
    mov  ds, ax

    CLRSCR
    HienString msg1	; Hiện thông báo tm

    L1:
    call VAO_SO_N

        ; mov ah, 1                    ; Chò 1 ký tự từ bàn phím
        ; int 21h                          
        cmp ax, 2023                 ; Ký tự vào có phải 'c'
        ; js HIEN_SO
        js TINH_TOAN
        loop L2
    
    L2: 
    HIENSTRING msg2
        call VAO_SO_N
        cmp ax, 2023                 ; Ký tự vào có phải 'c'
        js TINH_TOAN
        loop L2

        ; js HIEN_SO =================================================================


    TINH_TOAN:
        sub  ax, 2023
        call HIEN_SO_N

    HIEN_SO: 
    call HIEN_SO_N
        
    Exit_CT:
        HienString tieptuc       ; Hiện thông báo tieptuc
        mov ah, 1                    ; Chò 1 ký tự từ bàn phím
        int 21h                          
        cmp al, 'c'                 ; Ký tự vào có phải 'c'
        jne Thoat_CT        ; Không phải 'c' thì nhảy đế Thoat_TM,
        jmp L_CT0	 ; còn đúng là 'c' thì nhảy về L_TM0

    Thoat_CT:                     
		mov ah, 4ch		; Về DOS
		int 21h

 @CN4$qv endp             
include lib3.asm
include lib2.asm
END 

;Chú ý: Xóa thư mục và chuyển thư mục giống bài tập trên chỉ cần thay chức năng 39h bằng chức năng 3ah (xóa thư mục) hoăc 3bh (chuyển thư muc).
; CMP: So sánh hai giá trị
; CMP operand1, operand2
; JMP: Nhảy đến một địa chỉ cụ thể
; JMP destination
; JE, JNE, JL, JG,… nhảy nếu điều kiện thỏa mãn
; JE destination: Nhảy nếu bằng nhau
; JNE destination: Nhảy nếu không bằng nhau
; JL destination: Nhảy nếu ít hơn
; JG destination: Nhảy nếu lớn hơn

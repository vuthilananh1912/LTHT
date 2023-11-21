include lib1.asm
.model small
.stack 100h
.data
    ct1             db 13,10, 'Hay nhap ten thu muc can tao: $' 
    Err_MD          db 13,10, 'Khong tao duoc thu muc! $'
    Suc_MD          db 13,10, 'Thu muc da duoc tao! $' 
    tieptuc         db 13,10, 'Co tiep tuc CT (c/k)? $' 
    buff            db 30
                    db ?
    file_name       db 30 dup(?)
.code
PUBLIC @CN1$qv
@CN1$qv proc
    L_CT0:
    mov  ax, @data
    mov  ds, ax

    CLRSCR
    HienString ct1	; Hiện thông báo tm
    lea dx, buff            ; Vào tên thư mục cần tạo
    call GET_FILE_NAME              
    lea dx, file_name    ; Chức năng tạo thư mục
    
    mov ah, 39H
    int 21h
    jnc L_CT1                ; Nếu bit cờ CF=0 thì nhảy đến L_TM1,
    HienString Err_MD  ; còn CF=1 thì hiện thông báo lỗi
    jmp Exit_CT

    L_CT1:
        HienString Suc_MD   ; Hiện thông báo thành công

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

 @CN1$qv endp             
include lib3.asm		; lib3.asm chứa CT con GET_DIR_NAME
END 

;Chú ý: Xóa thư mục và chuyển thư mục giống bài tập trên chỉ cần thay chức năng 39h bằng chức năng 3ah (xóa thư mục) hoăc 3bh (chuyển thư muc).
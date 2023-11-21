include lib1.asm
.model small
.stack 100h
.data
    ct1             db 13,10, 'Hay nhap ten thu muc: $' 
    Err_MD          db 13,10, 'Khong thanh cong! $'
    Suc_MD          db 13,10, 'Thu muc da duoc tao! $' 
    newmg           db 13,10, 'Nhap ten moi cho thu muc: $'
    Del_MD          db 13,10, 'Thu muc da duoc xoa! $' 
    Chuyen_MD       db 13,10, 'Thu muc da duoc chuyen! $' 
    Rename_MD       db 13,10, 'Thu muc da duoc doi ten! $' 
    tieptuc         db 13,10, 'Co tiep tuc CT (c/k)? $' 
    buff            db 30
                    db ?
    file_name       db 30 dup(?)
    new_dir         db 30 dup(?)
.code
PUBLIC @CN1$qv
@CN1$qv proc
    L_CT0:
    mov  ax, @data
    mov  ds, ax

    ; CLRSCR
    ; HienString ct1	; Hiện thông báo tm
    ; lea dx, buff            ; Vào tên thư mục cần tạo
    ; call GET_FILE_NAME              
    ; lea dx, file_name    ; Chức năng tạo thư mục
    
    ; mov ah, 39H
    ; int 21h
    ; jnc L_CT1                ; Nếu bit cờ CF=0 thì nhảy đến L_TM1,
    ; HienString Err_MD  ; còn CF=1 thì hiện thông báo lỗi
    ; jmp Exit_CT

    ; L_CT1:
    ;     HienString Suc_MD   ; Hiện thông báo thành công
    ;     jmp Common_Exit

    ; Thêm chức năng xóa thư mục
    ; L_XoaTM:
    ;     HienString ct1
    ;     lea dx, buff            ; Vào tên thư mục cần xóa
    ;     call GET_FILE_NAME              
    ;     lea dx, file_name    ; Chức năng xóa thư mục
        
    ;     mov ah, 3Ah
    ;     int 21h
    ;     jnc L_XoaTM1
    ;     HienString Err_MD
    ;     jmp Common_Exit

    ; L_XoaTM1:
    ;     HienString Del_MD
    ;     jmp Common_Exit

    ; Thêm chức năng chuyển thư mục
    ; L_ChuyenTM:
    ;     HienString ct1
    ;     lea dx, buff            ; Vào tên thư mục cần chuyển
    ;     call GET_FILE_NAME              
    ;     lea dx, file_name    ; Chức năng chuyển thư mục
        
    ;     mov ah, 3Bh
    ;     int 21h
    ;     jnc L_ChuyenTM1
    ;     HienString Err_MD
    ;     jmp Common_Exit

    ; L_ChuyenTM1:
    ;     HienString Chuyen_MD
    ;     jmp Common_Exit

    ; Thêm chức năng đổi tên thư mục
    L_DoiTenTM:
        HienString ct1
        lea dx, buff            ; Vào tên thư mục cần đổi
        call GET_FILE_NAME              
        lea dx, file_name    ; Chức năng đổi tên thư mục

        HienString newmg
        lea dx, new_dir       ; Nhập tên mới
        call GET_FILE_NAME
        lea dx, new_dir       ; Chức năng đổi tên thư mục

        mov ah, 56h
        int 21h
        jnc L_DoiTenTM1
        HienString Err_MD
        jmp Common_Exit

    L_DoiTenTM1:
        HienString Rename_MD
        jmp Common_Exit

    Common_Exit:
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

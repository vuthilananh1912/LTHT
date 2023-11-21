; viết chương trình xem máy tính có cổng com hay không 
INCLUDE LIB1.ASM ; Chứa 2 MACRO xóa màn hình và hiện xấu
.MODEL small
.STACK 100h
.data
    m1 db 13,10,'May Tinh dang dung co G4A(DMA) khong : $'
    m2 db 13,10,'MT dang dung co cong COM khong :$'
    co db 'Co $'
    ko db 'Khong $'
    m3 db 13,10, 'So luong cong COM: $'
    m4 db 13,10,'Dia chi cac cong COM la:$'
    space db ' $'
.CODE
public @CN3$qv
@CN3$qv PROC
PS:
    mov AX, @data ; Đưa phần địa chỉ segment của vùng nhớ chứa dữ
    mov DS,AX ; liệu vào DS
    CLRSCR ; Xóa màn hình

    ;kiem tra may tinh co cong DMA khong
        HienString m1 ; Hiện thông báo m1
        int 11h ;Nội dung byte có địa chỉ 0-411h→ AH
        mov AL,AH ; AL chứa nội dung byte 0:411h
        shr AL,1 ; Dịch các bit của AL sang phải 1 lần
        jc L1 ; Nếu CF=1 (có DMA) thì nhảy đến L1, còn
        HienString ko ; CF=0 (không có DMA) hiện thông báo Khong"
        jmp L2
        L1:
            HienString co ; Hiện thông bảo 'Co
            
    ;kiem tra xem may tinh co cong COM khong
    L2:
        HienString m2 ; Hiện thông báo m2
        and AL, 0000011b ; Tách 3 bit chửa số lượng cổng COM jnz L3 ; Nếu có cổng COM thì nhảy đến L3,
        jnz L3
        HienString ko ; còn nếu không có thể hiện thông báo ‘Khong
        jmp Exit ; Nhảy đến kết thúc
    L3:
        HienString co ; Hiện thông báo 'Co
        mov CL,AL ; CX chứa số lượng cổng COM (phục vụ cho vòng
        xor CH, CH ; lặp lấy và hiện địa chỉ các cổng COM)
        HienString m3 ; Hiện thông báo m3 
        add AL,30h ; Chuyển số (số lượng cổng COM) sang dạng ASCII
        mov AH,0Eh ;Hiện số lượng cổng COM
        int 10h
        HienString m4 ;Hiện thông bảo m4
        xor AX,AX ;AX=0
        mov ES,AX ; ES=0
        mov BX,400h ; ES [BX] 0:400h trỏ đến vùng nhớ chứa đ/c COM1
    L4:
        mov AX,ES:[BX] ; Lấy địa chỉ các cổng COM đưa vào AX
        call HIEN_HEXA ; Hiện địa chỉ lên màn hình dạng HEXA
        HienString space ; Hiện dấu cách
        add BX,2        ; BX trò đến vùng nhớ chứa địa chi tiếp theo
        loop L4
    Exit:
        mov AH, 1   ; Chở 1 ký tự từ bản phím
        int 21h
    
        mov AH, 4Ch ;VÈ DOS
        int 21h
 ; Chứa CT con HIEN_HEXA
INCLUDE LIB2.ASM
@CN3$qv endp
    END PS
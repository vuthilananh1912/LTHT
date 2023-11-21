INCLUDE lib1.asm
.MODEL small
.DATA
M1 db 10,13,'Hay nhap so luong thanh phan : $'
M2 db 10,13,'a[$'
M3 db ']= $'
M4 db 10,13,'Day so vua vao la : $'
M5 db '  $'
M6 db 10,13,'Tong le cua day so nguyen la : $'
M7 db 13,10,'Co tiep tuc CT (c/k) ? $'
sltp dw ?
i     dw ?
a    dw 100 dup(?)
.CODE
public @CN2$qv
@CN2$qv proc
PS:
	mov  ax,@data
	mov  ds,ax
	CLRSCR
	HienString M1	; Hiện thông báo M1 (‘Hay vao so luong thanh phan :’)
	call   VAO_SO_N	; Nhận số lượng thành phần
	mov  sltp,ax		; Cất giá trị số lượng thành phần vào biến sltp
; Vòng lặp nhận các số đưa vào mảng
	mov  cx,ax		; cx=số lượng thành phần (chỉ số vòng lặp LOOP)
	lea     bx,a		; bx là con trỏ offset của a[0]
	mov   i,0		; Gán giá trị biến nhớ i=0
    L1:
	HienString M2	; Hiện thông báo M2 (‘a[‘)
	mov  ax,i		; Hiện giá trị i
	call   HIEN_SO_N
	HienString M3	; Hiện thông báo M3 (‘] =’)
	call   VAO_SO_N	; Nhận các thành phần a[i]
	mov  [bx],ax		; Đưa giá trị a[i] vào mảng a do bx trỏ đến
	inc    i			; Tăng giá trị i lên 1
	add   bx,2		; bx trỏ đến thành phần tiếp theo của mảng a
	loop  L1
; Vòng lặp đưa các số của mảng lên màn hình
	HienString M4	; Hiện thông báo M4 (‘Day so vua vao la : ‘)
	mov  cx,sltp		; cx=số lượng thành phần (chỉ số vòng lặp)
	lea    bx,a		; bx trỏ đến a[0]
   L2:
	mov  ax,[bx]		; ax=a[i]
	call   HIEN_SO_N	; Hiện giá trị a[i] lên màn hình
	HienString M5	; Hiện 2 dấu cách (space)
	add    bx,2		; bx trỏ đến thành phần tiếp theo của mảng
	loop   L2
; Vòng lặp tính tổng
	HienString M6	; Hiện thông báo M6 (‘Tong day so nguyen la : ‘)
	mov  cx,sltp		; cx=số lượng thành phần của mảng (chỉ số vòng lặp)
	lea     bx,a		; bx trỏ đến a[0] (con trỏ offset)
	xor    ax,ax		; ax chứa tổng (lúc đầu bằng 0)

   ;--------------------------------------------------------------------------------------
;b) Tổng các thành phần dương của mảng
   L3:
	mov  dx,[bx]		; dx = a[i]
	and   dx,dx		; Dựng cờ dấu (S=1 thì dx chứa số âm, S=0 thì dx chứa số dương)
	js      L4		; Nếu giá trị a[i] âm thì nhảy
	add   ax,[bx]		; còn giá trị a[i] dương thì cộng vào tổng nằm ở ax
   L4:
	add   bx,2		; bx trỏ đến thành phần tiếp theo của mảng a
	loop  L3
   ;--------------------------------------------------------------------------------------

        call    HIEN_SO_N	; Hiện giá trị tổng
        HienString M7	; Hiện thông báo M7 (Co tiep tuc CT (c/k) ?’)
        mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
        int     21h
        cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
        jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
    Exit:
        mov  ah,4ch		; Về DOS
        int     21h
    INCLUDE lib2.asm
	@CN2$qv endp
        END PS


; Chú ý : 

;tổng mảng
;    L3:	
;         add    ax,[bx]	; ax=ax+a[i]	|
;    	    add    bx,2	; bx trỏ đến thành phần tiếp theo của mảng a	|
;    	    loop   L3


; a) Tổng các thành phần âm của mảng
;    L3:
; 	mov  dx,[bx]		; dx = a[i]
; 	and    dx,dx		; Dựng cờ dấu (S=1 thì dx chứa số âm, S=0 thì dx chứa số dương)
; 	jns     L4		; Nếu giá trị a[i] dương thì nhảy đến L4
; 	add    ax,[bx]		; còn giá trị a[i] âm thì cộng vào tổng nằm ở ax
;    L4:
; 	add    bx,2		; bx trỏ đến thành phần tiếp theo của mảng a
; 	loop   L3


; b) Tổng các thành phần dương của mảng
;    L3:
; 	mov  dx,[bx]		; dx = a[i]
; 	and   dx,dx		; Dựng cờ dấu (S=1 thì dx chứa số âm, S=0 thì dx chứa số dương)
; 	js      L4		; Nếu giá trị a[i] âm thì nhảy
; 	add   ax,[bx]		; còn giá trị a[i] dương thì cộng vào tổng nằm ở ax
;    L4:
; 	add   bx,2		; bx trỏ đến thành phần tiếp theo của mảng a
; 	loop  L3


; c) Tổng các thành phần chẵn của mảng
;    L3:
; 	mov  dx,[bx]		; dx = a[i]
; 	shr    dx,1		; Bit thấp nhất vào cờ Carry (C=1-> a[i] là lẻ, C=0 -> a[i] là chẵn)
; 	jc       L4		; Nếu giá trị a[i] là lẻ thì nhảy đến l4
; 	add    ax,[bx]		; còn giá trị a[i] là chẵn thì thì cộng vào tổng nằm ở ax
;    L4:
; 	add    bx,2		; bx trỏ đến thành phần tiếp theo của mảng a


; d) Tổng các thành phần lẻ của mảng
;    L3:
; 	mov  dx,[bx]		; dx = a[i]
; 	shr    dx,1		; Bit thấp nhất vào cờ Carry (C=1-> a[i] là lẻ, C=0 -> a[i] là chẵn)
; 	jnc       L4		; Nếu giá trị a[i] là chẵn thì nhảy đến nhãn L4
; 	add    ax,[bx]		; còn giá trị a[i] là lẻ thì cộng vào tổng nằm ở ax
;    L4:
; 	add    bx,2		; bx trỏ đến thành phần tiếp theo của mảng a

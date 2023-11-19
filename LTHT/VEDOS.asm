.MODEL small
.CODE
PUBLIC _VeDOS
_VeDOS PROC
        mov ah,4ch
        int 21h
        ret
_VeDOS ENDP
END

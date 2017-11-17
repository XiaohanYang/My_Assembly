INCLUDE Irvine32.inc

.data
value BYTE 12
.code
Main PROC

    mov al,value          ; al = 12        
    call displayDecimal   ; call the procedure
    call Crlf

    exit
    
Main ENDP

displayDecimal PROC
    aam                   ; adjust after multiplication
    or ax,3030h           ; convert both digits to ascii. (0X30 is "0" in hexadecimal)
    mov bl,al
    mov al,ah
    call WriteChar
    mov al,bl
    call WriteChar
    ret
displayDecimal ENDP

END main 
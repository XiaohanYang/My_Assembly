INCLUDE Irvine32.inc

.data
sample BYTE 'Y'
.code
main PROC
    mov ecx, 16        ; Loop 16 times.
    mov ebx, 0         ; Black = 0.
L1:
    push ecx           ; Save loop counter
    mov ecx, 16        ; 16 possible background colors.
L2:
    mov eax, ebx       ; Start at black.
    call SetTextColor  ; Set the color.
    mov  al, sample    ; Character to be displayed.
    call WriteChar     ; Write to the console.
    inc  ebx           ; Next color.

    loop L2            
    call Crlf          
    pop  ecx           ; Restore loop counter
    loop L1            ;
    mov  eax, 15+0*16  ; black = 0, white = 15
    call SetTextColor  ; background*16 + foreground
    
    invoke ExitProcess, 0
main ENDP
end main

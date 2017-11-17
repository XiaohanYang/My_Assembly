; Summing all the byte values in the original message (smartest.asm)
; Storing the result as a number on 4 bytes stored in the last four bytes of the message
; Xiaohan Yang (xiaohan2014@my.fit.edu)

INCLUDE Irvine32.inc

.data
message db 'smartest'           ; String stores message
messageSize = ($ - message)     ; Variable stores the length of message

.code
main PROC

    mov ECX,messageSize         ; Set counter for loop
    mov ESI,OFFSET message      ; Set pointer at message variable
    mov EAX,0                   ; Clear the EAX register
    mov EBX,0                   ; Clear the EBX register

Sum: 

    mov bl,[ESI + ECX - 1]      ; Point characters in the message
    add EAX,EBX                 ; Add one by one

    loop Sum                    ; Get the sum of all the byte values

                                ; The Sum is s+m+a+r+t+e+s+t=373 in ascII. 

    add esi, 4 ; esi pointing to middle of message
    mov [esi], eax ; move 00 00 03 73 into memory
    
    call DumpRegs               ; Display results

    exit

main endp
end main

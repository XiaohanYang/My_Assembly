INCLUDE Irvine32.inc

.data
byteArray BYTE 81h,20h,33h

.code
main PROC
shr byteArray+2,1               ; Shift 1 bit to the right in byteArray+2 (third memory)
rcr byteArray+1,1               ; Rotate 1 bit to the right in byteArray+1 (second memory) with carry
rcr byteArray,1                 ; Rotate 1 bit to the right in byteArray (first memory) with carry

    call DumpRegs               ; Display results

    exit

main endp
end main

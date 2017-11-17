INCLUDE Irvine32.inc

.data

bigEndian BYTE 12h,34h,56h,78h
littleEndian DWORD ?

.code
main PROC
mov al, [bigEndian+3]; al = 78
mov ah, [bigEndian]; ah = 12    
mov [bigEndian], al; [bigEndian] = 78
mov [bigEndian+3], ah; [bigEndian+3] = 12
mov al, [bigEndian+2]; al = 56       ;swap 56h and 34h
mov ah, [bigEndian+1]; ah = 34
mov [bigEndian+1], al; [bigEndian+1] = 56
mov [bigEndian+2], ah; [bigEndian+2] = 34

 

mov eax, DWORD PTR bigEndian;
mov littleEndian, eax; littleEndian = 12345678h

    call DumpRegs               ; Display results

    exit

main endp
end main
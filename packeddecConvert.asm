INCLUDE Irvine32.inc

.data
integers DWORD ?
buffer BYTE 9 DUP (0)

.code
main PROC
	mov eax, 11112222                 ; pack decimal
	mov edi, OFFSET buffer            ; point to buffer
	call PackedToAsc                  ; call the procedure
    call WriteChar
	
	mov eax, 22223333                 ; pack decimal
	mov edi, OFFSET buffer            ; point to buffer
	call PackedToAsc                  ; call the procedure
    call WriteChar
	
	mov eax, 33334444                 ; pack decimal
	mov edi, OFFSET buffer            ; point to buffer
	call PackedToAsc                  ; call the procedure
    call WriteChar

	mov eax, 44445555                 ; pack decimal
	mov edi, OFFSET buffer            ; point to buffer
	call PackedToAsc                  ; call the procedure
    call WriteChar

	mov eax, 55556666                 ; pack decimal
	mov edi, OFFSET buffer            ; point to buffer
	call PackedToAsc                  ; call the procedure
    call WriteChar
	
	exit
main ENDP

PackedToAsc PROC
	mov esi,0                         ;
	mov integers, eax                 ; save packed decimal in integers
	mov ecx, LENGTHOF integers        ; run the loop for each digit
	
	L1:
	add BYTE ptr[edi], 0              ; convert the unpacked decimal to ascii decimal
	
	aaa                               ; adjust after addition
	or BYTE ptr[edi], 30h             ; start from 0 in ascii decimal
	inc esi                           ; increase esi
	inc edi                           ; increase edi
	loop L1
	ret
	
PackedToAsc ENDP

; Display the integer as a string.

	mov	edx,OFFSET integers
	call	WriteString
	call	Crlf

END main
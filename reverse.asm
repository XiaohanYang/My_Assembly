INCLUDE Irvine32.inc
.data
msg    BYTE   "This Assembly",0
ecxbkp DWORD  ?

.code
main PROC
mov	edx,OFFSET msg
	call WriteString
	call Crlf
mov ecx, LENGTHOF msg                                             
mov esi, OFFSET msg          
mov edi, OFFSET msg                                                
dec edi                           

END_STRING:
inc edi
mov al,[edi]
cmp al,0
jnz END_STRING
dec edi
shr ecx, 1 

L1: 
mov bl, [esi]
mov al, [edi]
mov [esi], al
mov [edi], bl
inc esi
dec edi
loop L1 
mov	 edx,OFFSET msg
call WriteString
call Crlf 

mov ecx, LENGTHOF msg
mov esi, OFFSET msg
mov edi, OFFSET msg
dec edi
mov ecxbkp, ecx

L2:
inc edi
mov al, [edi]
cmp al, ' ' 
loop L2
mov ecx, 16
dec edi

exit
main ENDP
END main

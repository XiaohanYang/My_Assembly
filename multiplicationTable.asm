; Multiplication Table for kids :)
; by Xiaohan Yang
include Irvine32.inc
.data
msg db "Multiplication Table for kids :)",0

.code
main proc

;Part I: Display the title
mov	edx, OFFSET msg        ; edx holds the address of the string
	call WriteString       ; write a string to standard output
	call crlf              ; start a new line

;Part II: Display the table
     mov edx,0             ; initialize edx 
L1:  
	 call crlf             ; start a new line	
	 mov ebx,1             ; print target (1=stdout)
     inc edx               ; edx++

L2:  
	 push edx              ; push edx on the stack
     mov eax,edx           ; copy the value in edx into eax
	 mul ebx               ; eax * ebx
     mov esi,eax           ; move the content of eax to esi
     pop edx               ; pop the top element of the stack into edx
	      
     mov eax,ebx           ; copy the value in ebx into eax
     call WriteDec         ; write the decimal
	 push edx              ; push edx on the stack
     mov al,'*'            ; put the symbol * in al and display it
     call WriteChar        ; write this character to standard output
	 pop edx               ; pop the top element of the stack into edx
     mov eax,edx           ; copy the value in edx into eax
     call WriteDec         ; write this character to standard output 
     push edx              ; push edx on the stack
     mov al,'='            ; put the symbol = in al and display it
     call WriteChar        ; write this character to standard output
     pop edx               ; pop the top element of the stack into edx
     mov eax,esi           ; copy the value in esi into eax
     call WriteDec         ; write this character to standard output
	 push edx              ; push edx on the stack
     mov al,' '            ; put the space in al and display it
     call WriteChar        ; write this character to standard output
     pop edx               ; pop the top element of the stack into edx
	 
     cmp ebx,9             ; compare the value in ebx with 9
     jz L4                 ; jump to loop4 if ebx is 9

     cmp ebx,edx           ; compare the value in ebx with the value in edx
     jz L1                 ; jump to loop1 if ebx = edx
     jb L3                 ; jump to loop3 if ebx < edx
L3: 
	 inc ebx               ; ebx++
     jmp L2                ; jump to loop2
L4:
	 call crlf             ; start a new line
     exit                  ; end the loop

main endp
end main

INCLUDE Irvine32.inc

.data
X DWORD ?

.code
main PROC
cmp ebx,ecx      ; Compare whether ebx > ecx.
jna L1           ; If not, then ebx < ecx, now need to check OR condition.
cmp ebx,edx      ; If so, compare whether ebx > edx.

    jna L1       ; If not, then ebx < edx. Now we know ecx < ebx < edx. Then need to check OR condition.
    jmp L2       ; If so, now we know ebx > ecx, and ebx > edx, set X to 1

L1: cmp edx,eax  ; Check OR condition. Compare whether edx > eax
jna L3           ; If not, set X to 2
L2: mov X,1      ; If so, set X to 1

jmp next         ; Jump to next
L3: mov X,2      ; Set X to 2
next:            ; Loop till ecx = 0
    
    call DumpRegs               ; Display results

    exit

main endp
end main

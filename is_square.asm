%include "../include/io.mac"

section .data
    i DD 0

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    sub eax, 1
parcurgere:
    mov dword[i], 0
    xor edx, edx
    mov esi, dword[ebx + eax * 4]
while:
    imul edx, edx
    cmp edx, esi
    je square
    inc dword[i]
    mov edx, dword[i]
    cmp dword[i], esi
    jle while
    jmp not_square
square:
    mov dword[ecx + eax * 4], 1
    jmp continue
not_square:
    mov dword[ecx + eax * 4], 0
continue:
    ;PRINTF32 `%d \x0`, esi
    dec eax
    jge parcurgere



    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
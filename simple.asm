%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
code:
    cmp edx, 26
    jl parcurgere
    sub edx, 26
    jmp code
parcurgere:
    xor eax, eax
    mov al, byte[esi + ecx - 1]
    add al, dl
if:
    cmp al, 'Z'
    jle continue
    sub al, 26
continue:
    mov byte[edi + ecx - 1], al
    dec ecx
    jge parcurgere
    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY

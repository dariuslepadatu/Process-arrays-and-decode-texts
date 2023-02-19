%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here
sub ecx, 1

parcurgere:
    xor edx, edx
    mov dx,  word[eax + point_size * ecx + point.x]
    mov si,  word[eax + point_size * ecx + point.y]
    cmp dx, word[eax + point_size * (ecx - 1) + point.x]
    je continuare_y
    sub dx, word[eax + point_size * (ecx - 1) + point.x]
    cmp dx, 0
    jge pozitive_x
    mov dx, word[eax + point_size * (ecx - 1) + point.x]
    sub dx, word[eax + point_size * ecx + point.x]

pozitive_x:
    mov dword [ebx + (ecx - 1) * 4], edx
    ;PRINTF32 `a %d\n\x0`, [ebx + (ecx - 1) * 4]
    jmp continuare

continuare_y:
    sub si, word[eax + point_size * (ecx-1) + point.y]
    cmp si, 0
    jge pozitive_y
    mov si, word[eax + point_size * (ecx - 1) + point.y]
    sub si, word[eax + point_size * ecx + point.y]

pozitive_y:
    mov dword [ebx + (ecx - 1) * 4], esi
    ;PRINTF32 `b %d\n\x0`, [ebx + (ecx - 1) * 4]

continuare:
    dec ecx
    jg parcurgere
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
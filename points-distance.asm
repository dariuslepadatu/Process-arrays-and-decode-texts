%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    
    mov cx, word[ebx + point.x]
    mov dx, word[ebx + point.y]
    sub cx, word[ebx + point_size + point.x]
    sub dx, word[ebx + point_size + point.y]
    neg cx
    neg dx
verificare_x:
    cmp cx, 0
    je verificare_y
    mov [eax], cx
    jmp continuare
verificare_y:
    mov [eax], dx
continuare:
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY
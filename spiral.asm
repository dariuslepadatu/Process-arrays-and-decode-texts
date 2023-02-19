%include "../include/io.mac"


section .data
    cont_produs DD 0
    cont DD 0
    i DD 0
    j DD 0
    col1 DD 0
    col2 DD 0
    row1 DD 0
    row2 DD 0

section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY

    mov dword[cont_produs], 0
    mov dword[col1], 0
    mov dword[row1], 0
    mov dword[row2], eax
    sub dword[row2], 1
    mov dword[col2], eax
    sub dword[col2], 1
    mov edx, eax ; eax == n
    imul edx, edx
    mov dword[cont], edx
    sub dword[cont], 1
    mov edx, [ebp + 20]
parcurgere_matrice:
    mov edi, dword[col1] ; edi == col1
    mov esi, dword[col2] ; esi == col2
for:
    cmp dword[i], esi
    jg continue
    add esi, dword[i]
    mov eax, [ecx + edi]
    add [ebx + edi], eax
    mov eax, [ebx + edi]
    mov [edx + edi], eax
    PRINTF32 `%c\x0`, [ebx + edi]
    mov dword[i], edi ; i == col1
    inc dword[i]
    ;PRINTF32 `%d \x0`, [i]
continue:
    mov eax, [ebp + 8]
    add dword[row1], 1
    sub dword[row2], 1
    add dword[col1], 1  
    sub dword[col2], 1  
    sub dword[cont], 1
    cmp dword[cont], 0
    jge parcurgere_matrice
    PRINTF32 `\n \x0`, [i]
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

%include "../include/io.mac"

section .data
    i DD 0
    j DD 0
    
section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY

    sub eax, 1
    mov dword[i], ecx
construire_key:
    add edx, dword[i]
    sub edx, ecx
    mov esi, dword[edx]
    add edx, ecx
    mov dword[edx], esi
    sub edx, dword[i]
    inc dword[i]
    cmp dword[i], eax
    jle construire_key


    mov esi, [ebp + 28]
    mov dword[i], 0
    mov dword[j], 0

parcurgere_sir:
    mov cl, byte[edx + eax]
    sub cl, byte[ebx + eax]
    add cl, 65
    cmp cl, 65
    jge continua
    add cl, 26
continua:
    mov byte[esi + eax], cl
    ;PRINTF32 `%c\x0`, ecx

    dec eax
    jge parcurgere_sir

    PRINTF32 `\n\x0`
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

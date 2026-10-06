section .bss
    buffer resb 10                  ; 10-byte buffer to store ascii digits

section .text
global _start

_start:
    mov rax, 12345                  ; number to convert
    mov r8, 0                       ; track string length
    mov rsi, buffer + 9             ; point to end of buffer to fill backwards
    mov rbx, 10                     ; base 10 divisor

convert_loop:
    xor rdx, rdx                    ; clear rdx before div (rdx:rax / rbx)
    div rbx                         ; rax = quotient, rdx = remainder
    add dl, 48                      ; convert remainder (0-9) to ascii character
    mov byte [rsi], dl
    dec rsi                         ; move pointer back one byte
    inc r8                          ; length++
    cmp rax, 0                      ; loop until quotient is 0
    jnz convert_loop

    inc rsi                         ; point to the first character of our string

    ; print converted string to stdout
    mov rax, 1
    mov rdi, 1
    mov rdx, r8
    syscall

    ; exit with status 0
    mov rax, 60
    xor rdi, rdi
    syscall
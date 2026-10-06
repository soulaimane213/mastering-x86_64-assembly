section .data
    msg1 db "hello user , what is your name", 0xA
    len  equ $ - msg1
    msg2 db "your name is: "
    len2 equ $ - msg2

section .bss
    buffer resb 20              ; 20-byte buffer for user input

section .text
global _start

_start:
    ; prompt user for their name
    mov rax, 1                  ; sys_write
    mov rdi, 1                  ; stdout
    mov rsi, msg1
    mov rdx, len
    syscall

    ; read name from stdin
    mov rax, 0                  ; sys_read
    mov rdi, 0                  ; stdin
    mov rsi, buffer
    mov rdx, 20                 ; max bytes to read
    syscall

    ; print "your name is: "
    mov rax, 1                  ; sys_write
    mov rdi, 1                  ; stdout
    mov rsi, msg2
    mov rdx, len2
    syscall

    ; print the user's name from buffer
    mov rax, 1                  ; sys_write
    mov rdi, 1                  ; stdout
    mov rsi, buffer
    mov rdx, 20
    syscall

    ; exit cleanly
    mov rax, 60                 ; sys_exit
    xor rdi, rdi                ; exit code 0
    syscall
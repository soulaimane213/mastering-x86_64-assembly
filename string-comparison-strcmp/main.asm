section .data
    first_str db "first string => ", 0
    first_str_len equ $ - first_str 
    
    second_str db "second string => ", 0
    second_str_len equ $ - second_str

    equal_msg db "strings are equal", 10
    equal_msg_len equ $ - equal_msg

    not_equal_msg db "strings are NOT equal", 10
    not_equal_msg_len equ $ - not_equal_msg

section .bss
    str_1 resb 256
    str_2 resb 256

section .text
global _start

_start:
    ; prompt and read first string
    mov rax, 1                          ; sys_write
    mov rdi, 1                          ; stdout
    mov rsi, first_str
    mov rdx, first_str_len
    syscall

    mov rax, 0                          ; sys_read
    mov rdi, 0                          ; stdin
    mov rsi, str_1
    mov rdx, 255
    syscall

    mov byte [str_1 + rax], 0           ; null-terminate input buffer

    ; prompt and read second string
    mov rax, 1                          ; sys_write
    mov rdi, 1                          ; stdout
    mov rsi, second_str
    mov rdx, second_str_len
    syscall    

    mov rax, 0                          ; sys_read
    mov rdi, 0                          ; stdin
    mov rsi, str_2
    mov rdx, 255
    syscall
    
    mov byte [str_2 + rax], 0           ; null-terminate input buffer

    ; load buffer pointers into registers
    mov r12, str_1
    mov r13, str_2

compare_loop:    
    mov al, [r12]                       ; load byte from first string
    mov bl, [r13]                       ; load byte from second string
    
    cmp al, bl                          ; compare characters
    jne not_equal                       ; mismatch found (or one string ended early)

    cmp al, 0                           ; both characters matched; are they at the end?
    je equal

    inc r12                             ; move to next character
    inc r13
    jmp compare_loop

not_equal:
    mov rax, 1                          ; sys_write
    mov rdi, 1                          ; stdout
    mov rsi, not_equal_msg
    mov rdx, not_equal_msg_len
    syscall    
    jmp program_end

equal:
    mov rax, 1                          ; sys_write
    mov rdi, 1                          ; stdout
    mov rsi, equal_msg
    mov rdx, equal_msg_len
    syscall

program_end:
    ; exit cleanly
    mov rax, 60                         ; sys_exit
    xor rdi, rdi
    syscall
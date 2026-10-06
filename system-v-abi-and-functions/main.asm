section .text
global _start

_start:
    ; pass arguments according to System V AMD64 ABI
    mov rdi, 5                          ; 1st argument (rdi) = 5
    mov rsi, 6                          ; 2nd argument (rsi) = 6
    
    call add                            ; push return address & jump to add
    mov rbx, rax                        ; save return value in rbx

done:
    ; exit cleanly using the sum as the exit code
    mov rax, 60                         ; sys_exit
    mov rdi, rbx                        ; exit code = 11
    syscall

add:
    ; function prologue
    push rbp                            ; save caller's base pointer
    mov rbp, rsp                        ; set up current stack frame

    ; perform addition
    mov rax, rdi                        ; rax = 1st argument
    add rax, rsi                        ; rax = rax + 2nd argument

    ; function epilogue
    pop rbp                             ; restore caller's base pointer
    ret                                 ; pop return address into RIP and return
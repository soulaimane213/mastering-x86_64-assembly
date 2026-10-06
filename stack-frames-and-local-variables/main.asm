section .text
global _start

_start:
    call main
    mov rdi, rax                        ; use main's return value as exit code

    ; exit cleanly
    mov rax, 60                         ; sys_exit
    syscall

main:
    ; function prologue
    push rbp                            ; save caller's base pointer
    mov rbp, rsp                        ; establish current stack frame
    sub rsp, 32                         ; allocate 32 bytes for local variables

    ; assign local variables on the stack
    mov qword [rbp - 8], 5              ; local var a = 5
    mov qword [rbp - 16], 6             ; local var b = 6

    ; pass arguments according to System V ABI (rdi, rsi)
    mov rdi, [rbp - 8]
    mov rsi, [rbp - 16]
    call add

    ; store result and prepare return value
    mov qword [rbp - 24], rax           ; save add() result to local var
    mov rax, [rbp - 24]                 ; return result in rax

    ; function epilogue
    add rsp, 32                         ; deallocate local stack space
    pop rbp                             ; restore caller's base pointer
    ret

add:
    ; function prologue
    push rbp
    mov rbp, rsp
    sub rsp, 16                         ; allocate space on stack

    ; store arguments in locals and calculate sum
    mov qword [rbp - 8], rdi            ; store first arg
    add qword [rbp - 8], rsi            ; add second arg
    mov rax, [rbp - 8]                  ; return sum in rax

    ; function epilogue
    add rsp, 16                         ; clean up stack
    pop rbp
    ret
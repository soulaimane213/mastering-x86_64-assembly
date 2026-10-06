section .bss
    buffer resb 10                      ; 10-byte buffer for user input

section .text
global _start

_start:
    ; read input string from stdin
    mov rax, 0                          ; sys_read
    mov rdi, 0                          ; stdin
    mov rsi, buffer
    mov rdx, 10
    syscall

    ; initialize registers
    xor r15, r15                        ; r15 = accumulator (holds final integer)
    xor r8, r8                          ; r8  = buffer index counter
    mov rsi, buffer                     ; pointer to input string
    mov rbx, 10                         ; base 10 multiplier

convert_loop:
    movzx rax, byte [rsi + r8]          ; load character and zero-extend into rax
    
    cmp al, 10                          ; check for newline (Enter key)
    je done
    cmp al, 0                           ; check for null terminator
    je done

    sub al, 48                          ; convert ASCII character ('0'-'9') to numeric digit
    imul r15, rbx                       ; accumulator = accumulator * 10
    add r15, rax                        ; accumulator = accumulator + digit
    
    inc r8                              ; move to next character
    jmp convert_loop

done:
    ; exit and pass the converted integer as the return code
    mov rax, 60                         ; sys_exit
    mov rdi, r15                        ; exit status = converted number
    syscall
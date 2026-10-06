# Functions & System V ABI — x86_64 Assembly

A breakdown of how functions are created, called, and executed in 64-bit Linux assembly following the standard **System V AMD64 ABI**.

Zero C runtime, no libc, pure assembly.

## How It Works

Under the 64-bit Linux calling convention:

1. **Passing Arguments:** Function arguments are passed via registers rather than pushed to the stack:
   * 1st Argument: `RDI`
   * 2nd Argument: `RSI`
   * (Subsequent args use `RDX`, `RCX`, `R8`, `R9`)
2. **Function Invocation:** `call` pushes the next instruction address onto the stack and jumps to the function label.
3. **Prologue & Epilogue:** The function saves the caller's base pointer (`push rbp; mov rbp, rsp`) and restores it before returning (`pop rbp`).
4. **Return Value:** The result is placed in `RAX`.
5. **Return:** `ret` pops the saved address from the stack back into `RIP`.

## Video Walkthrough

Watch the complete explanation on YouTube:

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20Video-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/watch?v=53csf3DTsSE)

## Build & Run

Using the Makefile:
```bash
make
./main
echo $?    # prints 11 (the sum of 5 + 6)
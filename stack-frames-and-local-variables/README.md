# Stack Frames & Local Variables — x86_64 Assembly

A breakdown of how function stack frames and local variables operate at the hardware level in 64-bit Linux assembly.

## How It Works

Under the x86_64 architecture, functions manage their own private scratchpad memory using the CPU stack:

1. **Prologue:**
   * `push rbp`: Saves the previous function's base pointer.
   * `mov rbp, rsp`: Establishes the current frame base.
   * `sub rsp, N`: Expands the stack downward to reserve bytes for local variables.
2. **Accessing Variables:** Local values are referenced via negative offsets from the base pointer (e.g., `[rbp - 8]`, `[rbp - 16]`).
3. **Epilogue:**
   * `add rsp, N`: Deallocates the local variable space.
   * `pop rbp`: Restores the caller's frame.
   * `ret`: Pops the return instruction address into `RIP`.

## Video Walkthrough

Watch the full in-depth video breakdown on YouTube:

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20Video-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/watch?v=AEvijYnIses)

## Build & Run

Using the Makefile:
```bash
make
./main
echo $?    # prints 11 (the sum of 5 + 6)
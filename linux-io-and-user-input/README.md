# User Input via Syscalls — x86_64 Assembly

A minimal x86_64 assembly program that prompts the user for their name, reads keyboard input from `stdin`, and echoes it back to `stdout`.

Written in NASM for 64-bit Linux using raw kernel syscalls with zero C library dependencies.

## What It Does

1. **Prompts:** Prints a question to the terminal using `sys_write` (syscall 1).
2. **Reads:** Captures keystrokes into uninitialized memory (`.bss`) using `sys_read` (syscall 0).
3. **Echoes:** Prints the greeting along with the captured input.

## Video Walkthrough

Watch the full tutorial and explanation on YouTube:

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20Video-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/watch?v=Ts1k_FnbFdk)

## Build & Run

Using the Makefile:
```bash
make
./main
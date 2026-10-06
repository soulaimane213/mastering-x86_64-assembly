# String to Integer (atoi) — x86_64 Assembly

A from-scratch implementation of the standard C `atoi` function in 64-bit Linux assembly. Reads a numeric string from `stdin`, converts each ASCII character to its decimal value, and builds the 64-bit integer using arithmetic loops.

Zero external libraries, no libc, pure syscalls.

## How It Works

1. **Read Input:** Captures user keystrokes into a buffer via `sys_read` (syscall 0).
2. **Character Parsing:** Iterates through each byte until a newline (`0x0A`) or null byte (`0x00`) is hit.
3. **Accumulator Formula:**
   * Subtract `48` (`'0'`) from the ASCII byte to obtain the raw digit (0–9).
   * Multiply current total by `10`: `imul r15, 10`.
   * Add the new digit: `add r15, digit`.
4. **Verification:** The program returns the converted integer directly as its Linux exit code.

## Video Walkthrough

Watch the full step-by-step breakdown on YouTube:

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20Video-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/watch?v=EWYdoX9uBFw)

## Build & Run

Using the Makefile:
```bash
make
./from_char_to_int
# Type a number (e.g. 42) and hit Enter:
42
echo $?    # prints 42
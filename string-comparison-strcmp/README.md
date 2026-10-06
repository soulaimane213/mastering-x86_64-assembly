# String Comparison (strcmp) — x86_64 Assembly

A from-scratch implementation of the standard C `strcmp` function in 64-bit Linux assembly. Reads two user strings from `stdin`, compares them byte by byte, and outputs whether they match.

Zero external libraries, no libc, pure syscalls.

## How It Works

1. **Input & Termination:** Reads two strings via `sys_read` (syscall 0) and places a `0` (null-terminator) at the end of each buffer.
2. **Byte-by-Byte Traversal:**
   * Loads corresponding bytes into `AL` and `BL`.
   * Checks `cmp al, bl`: if they differ, the strings are immediately flagged as **NOT equal** (this also handles length differences like `"cat"` vs `"cats"`).
   * Checks `cmp al, 0`: if both characters match and reach the null-terminator, both strings ended together and are **equal**.
   * Increments both pointers and loops.

## Video Walkthrough

Watch the full tutorial and line-by-line breakdown on YouTube:

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20Video-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/watch?v=I_15yASFPqI)

## Build & Run

Using the Makefile:
```bash
make
./main
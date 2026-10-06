# Integer to ASCII (itoa) — x86_64 Assembly

A minimal x86_64 assembly program that converts a 64-bit integer into an ASCII string and prints it to `stdout`. No libc, no `printf`, just raw Linux syscalls.

## How It Works

Because the kernel's `sys_write` only outputs raw ASCII bytes, we extract and format each digit manually:

1. **Divide by 10:** Using `div rbx` to split the number into quotient (`RAX`) and remainder (`RDX`).
2. **Convert to ASCII:** Add `48` (`'0'`) to the remainder.
3. **Store Backwards:** Write the character into a buffer from right to left.
4. **Loop:** Repeat until the quotient reaches `0`.
5. **Print:** Output the resulting buffer via `sys_write` (syscall 1) and exit cleanly.

## Video Walkthrough

Watch the full step-by-step breakdown on YouTube:

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20Video-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/watch?v=ErYJYoNRB_U)

## Build & Run

Using the Makefile:
```bash
make
./itoa
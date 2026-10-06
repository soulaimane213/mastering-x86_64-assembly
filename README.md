# Mastering x86_64 Assembly

Mastering Linux x86_64 assembly from scratch: fundamentals, raw syscalls, dynamic memory, threading, process creation, and low-level Linux internals.

Zero C standard library dependencies — pure assembly and direct Linux kernel syscalls.

[![YouTube Channel](https://img.shields.io/badge/YouTube-Zero2Segfault-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/@Zero2Segfault)

---

## Repository Roadmap

| Directory | Topic | Key Concepts |
| :--- | :--- | :--- |
| [`system-v-abi-and-functions`](./system-v-abi-and-functions) | Function Calls & System V ABI | Register arguments (`RDI`, `RSI`), `call`, `ret` |
| [`stack-frames-and-local-variables`](./stack-frames-and-local-variables) | Stack Memory & Frames | Base pointer `RBP`, stack pointer `RSP`, local vars |
| [`linux-io-and-user-input`](./linux-io-and-user-input) | Standard I/O via Syscalls | `sys_read` (0), `sys_write` (1), `.bss` section |
| [`string-to-integer-atoi`](./string-to-integer-atoi) | ASCII to Integer (`atoi`) | Accumulator loops, character math, `imul` |
| [`integer-to-string-itoa`](./integer-to-string-itoa) | Integer to ASCII (`itoa`) | 64-bit division (`div`), modulo math, string reversal |
| [`string-comparison-strcmp`](./string-comparison-strcmp) | String Comparison (`strcmp`) | Memory pointer traversal, byte matching, null checks |

---

## Prerequisites

- **OS:** Linux (x86_64)
- **Assembler:** NASM (`sudo apt install nasm`)
- **Linker:** GNU `ld` (included in `build-essential`)

## How to Build

Each folder contains its own minimal `Makefile`. Navigate to any topic directory and run:

```bash
make
./main
#! /bin/bash
set -euo pipefail

# Assembler
# The next line could also be replaced with "as hello-s.s -o hello-s.o"
gcc -c hello-s.s
ld hello-s.o -o hello-s
strace -f -o hello-s.out ./hello-s

# C
cc -o hello-c hello-c.c
strace -f -o hello-c.out ./hello-c

# Go
go build hello-go.go
strace -f -o hello-go.out ./hello-go

# Python
strace -f -o hello-py.out python3 hello-py.py

# Container
docker build . -qt strace-demo
strace -f -o hello-container.out docker run --rm strace-demo

# Line count from strace output files
wc -l hello-*.out
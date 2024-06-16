#!/bin/bash
 
lex -o mini.l.c mini.l
yacc -d -o mini.y.c mini.y
gcc -g3 mini.l.c mini.y.c tac.c   obj.c  opt.c  DFA.c      -o mini
./mini  sample/Loop_invariant.m
# ./mini  sample/test.m



lex -o asm.l.c asm.l
yacc -d -o asm.y.c asm.y
gcc -g3 asm.l.c asm.y.c -o asm
./asm  sample/Loop_invariant.m.s
#./asm  sample/test.m.s


gcc -g3 machine.c -o machine
#./machine sample/test.m.s.o
./machine sample/Loop_invariant.m.s.o


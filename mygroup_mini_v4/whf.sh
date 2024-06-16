#!/bin/bash
 
lex -o mini.l.c mini.l
yacc -d -o mini.y.c mini.y
gcc -g3 mini.l.c mini.y.c tac.c   obj.c  opt.c  DFA.c      -o mini
./mini  sample/test.m



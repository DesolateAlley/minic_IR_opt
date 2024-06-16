	# head
	LOD R2,STACK
	STO (R2),0
	LOD R4,EXIT
	STO (R2+4),R4

	# label main
main:

	# begin

	# var a

	# var b

	# var c

	# var d

	# a = 1
	LOD R5,1

	# var t0

	# t0 = (b < 100)
	LOD R6,(R2+12)
	LOD R6,(R2+12)
	LOD R7,100
	SUB R6,R7
	TST R6
	LOD R3,R1+40
	JLZ R3
	LOD R6,0
	LOD R3,R1+24
	JMP R3
	LOD R6,1

	# ifz t0 goto L2
	STO (R2+8),R5
	STO (R2+24),R6
	TST R6
	JEZ L2

	# d = 1
	LOD R8,1

	# c = 5
	LOD R9,5

	# label L1
	STO (R2+20),R8
	STO (R2+16),R9
L1:

	# var t1

	# t1 = a + d
	LOD R5,(R2+8)
	LOD R5,(R2+8)
	LOD R6,(R2+20)
	LOD R6,(R2+20)
	ADD R5,R6

	# a = t1
	STO (R2+28),R5

	# var t2

	# t2 = a * 2
	STO (R2+8),R5
	LOD R7,2
	MUL R5,R7

	# var t3

	# t3 = t2 + 2
	STO (R2+32),R5
	LOD R8,2
	ADD R5,R8

	# b = t3
	STO (R2+36),R5

	# actual c
	LOD R9,(R2+16)
	LOD R9,(R2+16)
	STO (R2+40),R9

	# actual b
	STO (R2+12),R5
	STO (R2+44),R5

	# call add
	STO (R2+48),R2
	LOD R4,R1+32
	STO (R2+52),R4
	LOD R2,R2+48
	JMP add

	# t0 = (b < 100)
	LOD R5,(R2+12)
	LOD R5,(R2+12)
	LOD R6,100
	SUB R5,R6
	TST R5
	LOD R3,R1+40
	JLZ R3
	LOD R5,0
	LOD R3,R1+24
	JMP R3
	LOD R5,1

	# if t0 goto L1
	STO (R2+24),R5
	TST R5
	JGZ L1

	# label L2
L2:

	# return 0
	LOD R4,0
	LOD R3,(R2+4)
	LOD R2,(R2)
	JMP R3

	# end
	LOD R3,(R2+4)
	LOD R2,(R2)
	JMP R3

	# label add
add:

	# begin

	# formal x

	# formal y

	# var t4

	# t4 = x + y
	LOD R5,(R2-4)
	LOD R5,(R2-4)
	LOD R6,(R2-8)
	LOD R6,(R2-8)
	ADD R5,R6

	# return t4
	LOD R4,R5
	LOD R3,(R2+4)
	LOD R2,(R2)
	JMP R3

	# end
	LOD R3,(R2+4)
	LOD R2,(R2)
	JMP R3

PRINTN:
	LOD R7,(R2-4) # 789
	LOD R15,R7 # 789 
	DIV R7,10 # 78
	TST R7
	JEZ PRINTDIGIT
	LOD R8,R7 # 78
	MUL R8,10 # 780
	SUB R15,R8 # 9
	STO (R2+8),R15 # local 9 store

	# out 78
	STO (R2+12),R7 # actual 78 push

	# call PRINTN
	STO (R2+16),R2
	LOD R4,R1+32
	STO (R2+20),R4
	LOD R2,R2+16
	JMP PRINTN

	# out 9
	LOD R15,(R2+8) # local 9 

PRINTDIGIT:
	ADD  R15,48
	OUT

	# ret
	LOD R3,(R2+4)
	LOD R2,(R2)
	JMP R3

PRINTS:
	LOD R7,(R2-4)

PRINTC:
	LOD R15,(R7)
	DIV R15,16777216
	TST R15
	JEZ PRINTSEND
	OUT
	ADD R7,1
	JMP PRINTC

PRINTSEND:
	# ret
	LOD R3,(R2+4)
	LOD R2,(R2)
	JMP R3

EXIT:
	END

STATIC:
	DBN 0,0
STACK:

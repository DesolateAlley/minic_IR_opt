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

	# a = 1
	LOD R5,1

	# var t0

	# t0 = 1
	LOD R6,1

	# label L1
	STO (R2+8),R5
	STO (R2+16),R6
L1:

	# var t1

	# t1 = a + 1
	LOD R5,(R2+8)
	LOD R5,(R2+8)
	LOD R6,1
	ADD R5,R6

	# a = t1
	STO (R2+20),R5

	# var t2

	# t2 = t1 * 2
	LOD R7,(R2+20)
	LOD R7,(R2+20)
	LOD R8,2
	MUL R7,R8

	# var t3

	# t3 = t2 + 2
	STO (R2+24),R7
	LOD R9,2
	ADD R7,R9

	# b = t3
	STO (R2+28),R7

	# actual b
	STO (R2+12),R7
	STO (R2+32),R7

	# actual a
	STO (R2+8),R5
	STO (R2+36),R5

	# call add
	STO (R2+40),R2
	LOD R4,R1+32
	STO (R2+44),R4
	LOD R2,R2+40
	JMP add

	# actual 5
	LOD R5,5
	STO (R2+32),R5

	# actual b
	LOD R6,(R2+12)
	LOD R6,(R2+12)
	STO (R2+36),R6

	# call add
	STO (R2+40),R2
	LOD R4,R1+32
	STO (R2+44),R4
	LOD R2,R2+40
	JMP add

	# if t0 goto L1
	LOD R5,(R2+16)
	LOD R5,(R2+16)
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

label add      1  ******
begin
formal x
formal y
var t0
t0 = x + y
return t0
end

label main     2 ******
begin
var a
var b
var c
var i
a = 1
var t1
t1 = (a == 1)
ifz t1 goto L1     //if else 的开始部分

var t2         3  ******   //if块的内容
t2 = a + 1
b = t2
goto L2           

label L1       4  ******  //else代码块的开始部分
var t3
t3 = a + 1
c = t3

label L2      5   ******
var t6
var t5
t5 = b + 2
var t4
t4 = a + 1
actual t5
actual t4
t6 = call add
c = t6
var t7
t7 = (c == a)
ifz t7 goto L4

label L3        6 ******
i = 0
if t7 goto L3

label L4        7 ******
i = 0
var t8
t8 = (i < 2)
ifz t8 goto L6

label L5       8  ******
a = 0
b = 0
var t9
t9 = i + 1
i = t9
if t8 goto L5

label L6       9  ******
end

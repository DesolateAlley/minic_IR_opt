label main
begin
var a
var b
var c
a = 1
var t0
t0 = (a < 10)
ifz t0 goto L2
label L1
var t1
t1 = a + 1
a = t1
var t2
t2 = a * 2
var t3
t3 = t2 + 2
b = t3
c = 5
actual b
actual a
call add
actual c
actual b
call add
if t0 goto L1
label L2
return 0
end
label add
begin
formal x
formal y
var t4
t4 = x + y
return t4
end

label main
begin
var a
var b
a = 1
var t0
t0 = 1
label L1
var t1
t1 = a + 1
a = t1
var t2
t2 = t1 * 2
var t3
t3 = t2 + 2
b = t3
actual b
actual a
call add
actual 5
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

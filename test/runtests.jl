using netgengen
using Base.Test

teststr = 
"""
solid unioni2 = not orthobrick (0.0, 0.0, 0.0; 1.0, 1.0, 1.0) or
	cylinder (0.0, 0.0, 0.0; 1.0, 1.0, 1.0; 1.0);
tlo unioni2 -col=[1,0,0];
solid laatikko = orthobrick (0.0, 0.0, 0.0; 1.0, 1.0, 1.0);
solid loota = orthobrick (0.0, 0.0, 0.0; 1.0, 0.5, 2.0);
solid unioni = laatikko or
	loota;
tlo unioni -col=[0,1,0];
"""

laatikko = brick("laatikko", [0.0,0.0,0.0],[1.0,1.0,1.0])
loota = brick("loota", [0.0,0.0,0.0],[1.0,0.5,2.0])
unioni2 = csgunion("unioni2", [not(brick([0.0,0.0,0.0],[1.0,1.0,1.0])), cylinder([0.0,0.0,0.0],[1.0,1.0,1.0], 1)])
unioni = csgunion("unioni", [laatikko, loota])

io=IOBuffer()

tlo(unioni2, io, col=[1, 0, 0])
tlo(unioni, io, col=[0, 1, 0])
outstr = takebuf_string(io)

@test outstr == teststr

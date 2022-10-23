factorial(0,1).
factorial(N,M) :-
N>0,
N1 is N-1,
factorial(N1, M1),
M is N*M1.

lcm2(A,B,M) :-
0 is A mod B ,
M is A.
lcm2(A,B,M) :-
0 =\= A mod B,
lcm2(B,A mod B, MT),
M is (MT*A)/(A mod B).

lcm([],_).
lcm([A],M) :-
length([A],N),
N is 1,
M is A.
lcm([H|T],M) :-
lcm(T,MN),
lcm2(H,MN,MT),
M is MT.

occ([],_,_,[]).
occ([H|T],A,B,[M|TR]) :-
H is A,
M is B,
occ(T,A,B,TR).
occ([H|T],A,B,[M|TR]) :-
H =\= A,
M is H,
occ(T,A,B,TR).




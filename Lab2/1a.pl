% Calculate a factorial for a natural number
factorial(0,1).
factorial(N,M) :-
N>0,
N1 is N-1,
factorial(N1, M1),
M is N*M1.


% Write a predicate to determine the 
% lowest common multiple of a list formed from integer numbers.
% lcm2(A-Value,integer, B-Value,integer, M-result,integer)
% flow model: lcm2(i,i,o)
lcm2(A,B,M) :-
0 is A mod B ,
M is A.
lcm2(A,B,M) :-
0 =\= A mod B,
lcm2(B,A mod B, MT),
M is (MT*A)/(A mod B).

% lcm(A-List, M-result,integer)
% flow model: lcm(i,o)
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




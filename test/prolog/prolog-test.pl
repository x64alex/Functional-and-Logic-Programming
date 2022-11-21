% Alexandru-Horatiu Cantor
% Group 921/2
% Number 3

gcd(_,_,1,1).
    
gcd(A,B,D,D):-
    0 is A mod D,
    0 is B mod D,!.

gcd(A,B,D,R):-
    D1 is D-1,
    gcd(A,B,D1,R).

gcd2(A,B,R):-
    gcd(A,B,A,R).

gcdlist([],[]).

gcdlist([H],H).

gcdlist([H|T],R):-
    gcdlist(T,R2),
    gcd2(H,R2,R).

/** <examples>
%gcdlist([81,27,45,18],R)
%gcdlist([81,27],R)
%gcdlist([],R)
%gcdlist([100,100,100,100],R)
%gcdlist([10,20,30,40,45],R)
*/

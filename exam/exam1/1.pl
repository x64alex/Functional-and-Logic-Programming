insertel(E,[], [E]).

insertel(E,L,[E|L]):-
    L = [H|_],
    E >= H-3,
    E-3 =< H.

insertel(E,[H|T],[H|R]):-
    insertel(E, T, R),
    R = [H1|_],
    H >= H1-3,
    H-3 =< H1.

perm([],[]).
perm([H|T],R):-
    perm(T,T2),
    insertel(H, T2, R).
    

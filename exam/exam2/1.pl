arr([_],1,0,[]).
arr([H],H,1,[H]).
arr([H|T],P,K,R):-
   	not(0 =:= P mod H),!,
    arr(T,P,K,R).
arr([H|T],P,K,R):-
    K > 0,
    P1 is P // H,
    K1 is K-1,
    arr(T,P1,K1,R1),
    R = [H|R1].
arr([_|T],P,K,R):-
    arr(T,P,K,R).

arr2(L, P, K,R2):-
    arr(L, P, K,R1),
    permutation(R1,R2).
    
arrall(L,P,K,R):-
    findall(R2, arr2(L, P, K,R2), R).

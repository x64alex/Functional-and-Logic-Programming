% Write a predicate to add a value v 
% after 1-st, 2-nd, 4-th, 8-th, ... element in a list.

addValue([],_,[]).

addValue(H,V,M) :-
    length(H,L),
	add(H,1,V,L,M).

add([],_,_,_,[]).

add([H],K,_,N,[H]) :- K > N.

add([H|T],K,V,N,[H,V|MT]) :-
    K =< N,
    0 is K /\(K-1), 
	add(T,K+1,V,N,MT).

add([H|T],K,V,N,[H|MT]) :-
    K=<N,
    0 =\= K /\(K-1),
	add(T,K+1,V,N,MT).
    
    
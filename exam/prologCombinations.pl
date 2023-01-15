% 1. Write a predicate to generate the list of all subsets 
% with all elements of a given list.
%Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]
% subset(L,k) = { [], k=0
% 				{ l1, n=1 and k=1
% 				{subset(l2..ln,k)
%				{l1 + subset(l2..ln,k-1), k>1

subset([H],1,[H]).

subset([_],0,[]).

subset([_|T],K,R):-
    subset(T,K,R).

subset([H|T],K,[H|R]):-
    K > 0,
    K1 is K-1,
    subset(T,K1,R).


subsets(L,K,R) :- findall(R1, subset(L,K,R1),R).

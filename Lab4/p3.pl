%1. Write a predicate to generate the list of all subsets with all elements of a given list.
%Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]
combinations([H|_],1,[H]).
combinations([_|T],K,R):-
    combinations(T,K,R).
combinations([H|T],K,[H|R]):-
    K > 1,
    K1 is K-1,
    combinations(T,K1,R).

% combinations([1,2,3],2,R)

%2. Are given n points in a plan (represented using its coordinates). 
% Write a predicate to determine all subsets of collinear points.


% 3. Write a predicate to determine all decomposition of n (n given, positive), 
% as sum of consecutive natural numbers.
decomposition(N,N,[N]).
decomposition(N,K,R):-
    K < N,
    K1 is K+1,
    decomposition(N,K1,R).

decomposition(N,K,[K|R]):-
    K < N,
    K1 is K+1,
    N1 is N-K,
    decomposition(N1,K1,R).

decompose(N,R) :- decomposition(N,1,R).

% decompose(100,R)

% 4. The list a1... an is given. Write a predicate 
% to determine all sublists strictly ascending of this list a.
sublist([H],K,[H]):-
    H>K.
sublist([_|T],K,R):-
    sublist(T,K,R).
sublist([H|T],K,[H|R]):-
    H>K,
    sublist(T,H,R).

subl(H,R):-
    permutation(H,R1),
    sublist(R1,-100,R).



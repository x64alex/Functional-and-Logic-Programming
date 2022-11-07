% Sort a list with removing the double values. 
% E.g.: [4 2 6 2 3 4] --> [2 3 4 6]

% perm(List, List)
% flow model: perm(i,o)
perm([],[]).
perm([H|T],S) :- perm(T,P),append(X,Y,P),append(X,[H|Y],S).

% get all permutation
% findall finds all values for nondeterministic predicate
allPerms(L,R):- findall(S,perm(L,S),R).

% naive_sort(List, List)
% flow model: naive_sort(i,o)
naive_sort(List,Sorted):-perm(List,Sorted),is_sorted(Sorted).
   
% is_sorted(List)
% flow model: is_sorted(i)
is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|T]):-X=<Y,is_sorted([Y|T]).

% remove_duplicates(List, List)
% flow model: remove_duplicates(i,o)
remove_duplicates([],[]).

remove_duplicates([A],[A]).

remove_duplicates([A,B|T],[A|L]):-
    A =\= B,
    remove_duplicates([B|T],L).

remove_duplicates([A,B|T],List):-
    A =:= B,
    remove_duplicates([B|T],List).

% remove_sort(List - list, RemoveSorted - list)
% flow model: remove_sort(i,o)
remove_sort(List,RemoveSorted):-
    naive_sort(List,Sorted),
    remove_duplicates(Sorted,RemoveSorted).

/** <examples>
%remove_sort([2,3,4,2,2,2,2,1],M)
%remove_sort([],M)
%remove_sort([1,1,1,1,2,3,4,5],M)
%remove_sort([1,1,1,1,2,3,4,5],M)
%remove_sort([6,7,1,1,2,3,4,5],M)
%remove_sort([2,1],M)
%remove_sort([1],M)
%remove_sort([1,2,3],M)
*/




% For a heterogeneous list, formed from integer numbers
% and list of numbers, write a predicate to sort every 
% sublist with removing the doubles.

% sort_sublist(List, List)
% flow model: sort_sublist(i,o)
sort_sublist([],[]).

sort_sublist([H|T],[RL|R]):-
    is_list(H),!,
    remove_sort(H,RL),
    sort_sublist(T,R).

sort_sublist([H|T],[H|R]):-
    sort_sublist(T,R).

/** <examples>
%sort_sublist([1,2,3,4,[2,3,1],5],M)
%sort_sublist([[2],[1,2],3,4,[2,3,1],5],M)
%sort_sublist([1,2,[],4,[2,3,1],5],M)
%sort_sublist([],M)
%sort_sublist([1,2,3,4],M)
%sort_sublist([[2,3,1]],M)
*/
    





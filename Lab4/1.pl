%Write a predicate to generate the list of all subsets with all elements of a given list.
%Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

% Mathematical model:
% subset(l1l2..ln,n) = {[], n=0
%					   {l1 U subset(l2...ln,n-1), n>0
%.                     {subset(l2...ln,n), n>0

%subset(List,Integer, list)
%flow model: subsets(i,i,o)
subset(_,0,[]).
subset([X|L],N,[X|S]) :-
    M is N-1,
    subset(L,M,S),
    N>0.
subset([_|L],N, S) :-
    subset(L,N,S),
    N>0.

%subset(List,Integer, List of lists)
%flow model: subsets(i,i,o)
allsubsets(L,N,RE):-
    findall(R,subset(L,N,R),RE).
  


/** <examples>
%allsubsets([2,3,4],1,M)
%allsubsets([2,3,4],2,M)
%allsubsets([2,3,4],5,M)
%allsubsets([2,3,4],0,M)
%allsubsets([2,3,4,5,6,7,8],6,M)

*/

% https://www.brainzilla.com/logic/zebra/eurotrip/
% Author of solution: Alexandru-Horatiu Cantor
% 
% Five friends are side by side planning a trip to Europe.
% Each one wants to visit cities based on their interests and spend a fixed amount of days in Europe. 
% Follow the clues to figure out their plans.
% 
% Constrains:
% 1. The guy wearing the Yellow shirt wants a 15 day trip.
% 2. Brandon is at the fourth position.
% 3. The 26-year-old friend wants to spend 1 month traveling.
% 4. The man wearing the Black shirt is somewhere between the oldest man and the man drinking Juice, in that order.
% 5. At the fifth position is the friend drinking Soft drink.
% 6. Hector is drinking Tea.
% 7. The guy wearing the White shirt wants a 25 day trip.
% 8. At the first position is the friend who wants to visit fashionable European cities.
% 9. The guy interested in Foods is somewhere between the guy interested in Fashion and the guy interested in Beaches, in that order.
% 10. Miguel is exactly to the left of the the friend drinking Tea.
% 11. The man interested to visit coastal cities wants to spend 15 days traveling.
% 12. At the fourth position is the guy who wants to travel to cities with lots of Museums.
% 13. Vincent is 25 years old.
% 14. The friend wearing the Blue shirt is exactly to the right of the youngest friend.
% 15. The man wearing the Blue shirt is drinking Juice.
% 16. The guy drinking Soft drink is exactly to the right of the guy that wants to stay only 10 days in Europe.
% 17. Vincent wants to travel for 20 days.
% 18. At one of the ends is the friend wearing the Green shirt.
% 19. The man interested in Museums is somewhere between the man interested in Foods and the man interested in Parties, in that order.
% 20. In the middle is the friend drinking Water.

% ins (i,i,o) 
ins(E, L, [E|L]).
ins(E, [H|L], [ H|T]) :-
ins(E,L,T).

% perm (i,o)
perm([], []).
perm([H|T], L):-
perm(T, P),
ins(H, P, L).

% candidate (o,o,o,o,o,o)
candidate(SH, N, IN, DU, A, DR) :-
perm([black, blue, green, white, yellow], SH),
perm(['Brandon', 'Edward', 'Hector', 'Miguel', 'Vincent'], N),
perm([beaches, fashion, foods, museums, parties], IN),
perm(['10 days', '15 days', '20 days', '25 days', '30 days'], DU),
perm(['23 years', '24 years', '25 years', '26 years', '27 years'], A),
perm([coffee, juice, 'soft drink', tea, water], DR).

% constraints (i,i,i,i,i,i)
constraints(SH, N, IN, DU, A, DR) :-
aux(SH, N, IN, DU, A, DR, yellow, _, _, '15 days', _, _, _), %1
aux(SH, N, IN, DU, A, DR, _, 'Brandon', _, _, _, _, 4), %2
aux(SH, N, IN, DU, A, DR, _, _, _, '30 days', '26 years', _, _), %3
aux(SH, N, IN, DU, A, DR, _, _, _, _, _, juice, POS1), %4
	aux(SH, N, IN, DU, A, DR, black, _, _, _, _, _, POS0),
    aux(SH, N, IN, DU, A, DR, _, _, _, _, '27 years', _, POS2),
    POS2 @< POS0,
    POS0 @< POS1,
aux(SH, N, IN, DU, A, DR, _, _, _, _, _, 'soft drink', 5), %5
aux(SH, N, IN, DU, A, DR, _, 'Hector', _, _, _, tea, _), %6
aux(SH, N, IN, DU, A, DR, white, _, _, '25 days', _, _, _), %7
aux(SH, N, IN, DU, A, DR, _, _, fashion, _, _, _, 1), %8
aux(SH, N, IN, DU, A, DR, _, _, foods, _, _, _, POS3), %9
	aux(SH, N, IN, DU, A, DR, _, _, fashion, _, _, _, POS4),
	aux(SH, N, IN, DU, A, DR, _, _, beaches, _, _, _, POS5),
    POS4 @< POS3,
    POS3 @< POS5,
aux(SH, N, IN, DU, A, DR, _, 'Miguel', _, _, _, _, PO1), %10
    LPO1 is PO1+1,
    aux(SH, N, IN, DU, A, DR, _, _, _, _, _, tea, LPO1),
aux(SH, N, IN, DU, A, DR, _, _, beaches, '15 days', _, _, _), %11
aux(SH, N, IN, DU, A, DR, _, _, museums, _, _, _, 4), %12
aux(SH, N, IN, DU, A, DR, _, 'Vincent', _, _, '25 years', _, _), %13
aux(SH, N, IN, DU, A, DR, _, _, _, _, '23 years', _, POS), %14
    RPOS is POS+1,
    aux(SH, N, IN, DU, A, DR, blue, _, _, _, _, _, RPOS),
aux(SH, N, IN, DU, A, DR, blue, _, _, _, _, juice, _), %15
aux(SH, N, IN, DU, A, DR, _, _, _, '10 days', _, _, PO2), %16
    RPO2 is PO2+1,
    aux(SH, N, IN, DU, A, DR, _, _, _, _, _, 'soft drink', RPO2),
aux(SH, N, IN, DU, A, DR, _, 'Vincent', _, '20 days', _, _, _), %17
aux(SH, N, IN, DU, A, DR, green, _, _, _, _, _, PO3), %18
	PO3 ==5,
aux(SH, N, IN, DU, A, DR, _, _, museums, _, _, _, PO4), %19
    aux(SH, N, IN, DU, A, DR, _, _, foods, _, _, _, PO5),
    aux(SH, N, IN, DU, A, DR, _, _, parties, _, _, _, PO6), 
	PO5 @< PO4,
    PO4 @< PO6,
aux(SH, N, IN, DU, A, DR, _, _, _, _, _, water, 3). %20


% aux (i,i,i,i,i,i,o,o,o,o,o,o,o)
% friends, numbered 1,2,3,4,5 from left to right
aux([SH1 ,_ ,_ ,_ ,_ ], [N1 ,_ ,_ ,_ ,_], [IN1 ,_ ,_ ,_ ,_], [DU1 ,_ ,_ ,_ ,_], [A1 ,_ ,_ ,_ ,_], [DR1 ,_ ,_ ,_ ,_], SH1, N1, IN1, DU1, A1, DR1, 1).
aux([_ ,SH2 ,_ ,_ ,_], [_ ,N2 ,_ ,_ ,_], [_ ,IN2 ,_ ,_ ,_], [_ ,DU2 ,_ ,_ ,_], [_ ,A2 ,_ ,_ ,_], [_ ,DR2 ,_ ,_ ,_], SH2, N2, IN2, DU2, A2, DR2, 2).
aux([_ ,_ ,SH3,_ ,_ ], [_ ,_ ,N3 ,_ ,_], [_ ,_ ,IN3 ,_ ,_], [_ ,_ ,DU3 ,_ ,_], [_ ,_ ,A3 ,_ ,_], [_ ,_ ,DR3 ,_ ,_], SH3, N3, IN3, DU3, A3, DR3, 3).
aux([_ ,_ ,_ ,SH4 ,_], [_ ,_ ,_ ,N4 ,_], [_ ,_ ,_ ,IN4 ,_], [_ ,_ ,_ ,DU4 ,_], [_ ,_ ,_ ,A4 ,_], [_ ,_ ,_ ,DR4 ,_ ], SH4, N4, IN4, DU4, A4, DR4, 4).
aux([_ ,_ ,_ ,_ ,SH5], [_ ,_ ,_ ,_ ,N5], [_ ,_ ,_ ,_ ,IN5], [_ ,_ ,_ ,_ ,DU5], [_ ,_ ,_ ,_ ,A5], [_ ,_ ,_ ,_ ,DR5], SH5, N5, IN5, DU5, A5, DR5, 5).

% solve (o,o,o,o,o,o)
% Solve will give all solutions for constrains
solve(SH, N, IN, DU, A, DR) :-
constraints(SH, N, IN, DU, A, DR),
candidate(SH, N, IN, DU, A, DR).

/*
Call predicate:
solve(SH, N, IN, DU, A, DR)

Answer: 
[white, Miguel, fashion, 25 days, 27 years, coffee, 1]
[black, Hector, foods, 30 days, 26 years, tea, 2]
[yellow, Edward, beaches, 15 days, 23 years, water, 3]
[blue, Brandon, museums, 10 days, 24 years, juice, 4]
[green, Vincent, parties, 20 days, 25 years, soft drink, 5]

constraints([white,black,yellow,blue,green],
['Miguel','Hector','Edward','Brandon','Vincent'],
[fashion,foods,beaches,museums,parties],
['25 days','30 days','15 days','10 days','20 days'],
['27 years','26 years','23 years','24 years','25 years'],
[coffee,tea,water,juice,'soft drink']) return True

Observations:
'20 days' @>= '20 days' will return true
*/

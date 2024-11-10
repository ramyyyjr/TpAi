element(X, [X|_]).
element(X, [_|L]) :- element(X, L).

first(E, [E|_]).

last(D, [D]).
last(D, [_|L]) :- last(D, L).

penultimate(S, [S, _]).
penultimate(S, [_|L]) :- penultimate(S, L).

del_k(X, [X|L1], 1, L1).
del_k(X, [Z|L1], N, [Z|L2]) :- N > 1, M is N - 1, del_k(X, L1, M, L2).

even(L) :- length(L, N), N mod 2 =:= 0.

concat([], L2, L2).
concat([Z|L1], L2, [Z|L3]) :- concat(L1, L2, L3).

palindrome(L) :- inverser(L, L).

inverser([], []).
inverser([H|L1], L2) :- inverser(L1, IL), concat(IL, [H], L2).

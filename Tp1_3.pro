domains
int = Integer.

Predicates
nondeterm divisible(int,int)
nondeterm diviseur(int,int)
nondeterm multiple(int,int)

Clauses

%divisible
divisible(6,2).
divisible(12,2).
divisible(6,3).
divisible(12,3).

divisible(X,6):-divisible(X,2),divisible(X,3).
multiple(X,Y):-divisible(X,Y).
diviseur(X,Y):-multiple(Y,X).

Goal
%multiple(X,2).
diviseur(X,6).
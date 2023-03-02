Predicates
nondeterm personne(symbol)
nondeterm voleur(symbol)
nondeterm aime(symbol,symbol)
nondeterm vole(symbol,symbol)

Clauses
%personne
personne(marie).
personne(pierre).
%voleur
voleur(pierre).

aime(marie,vin).

aime(pierre,Y):-aime(Y,vin).
vole(X,Y):-voleur(X),aime(X,Y).

Goal
vole(X,Y).
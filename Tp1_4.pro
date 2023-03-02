Predicates
nondeterm entree(symbol)
nondeterm viande(symbol)
nondeterm poisson(symbol)
nondeterm dessert(symbol)
nondeterm platPrincipal(symbol)
nondeterm menu(symbol,symbol,symbol)

Clauses
%entree
entree(paella).
entree(salade).
entree(pastelle).

%viande
viande(filetDeBoeuf).
viande(tajine).
viande(poulet).

%poisson
poisson(merlan).
poisson(sardine).
poisson(anchois).
poisson(calamar).
poisson(crevette).

%dessert
dessert(flan).
dessert(tarte).
dessert(cafe).

platPrincipal(X):-viande(X);poisson(X).
menu(X,Y,Z):-entree(X),platPrincipal(Y),dessert(Z).

Goal
menu(paella,sardine,flan).
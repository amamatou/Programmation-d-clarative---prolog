predicates
nondeterm entree(symbol)
nondeterm viande(symbol)
nondeterm poisson(symbol)
nondeterm dessert(symbol)
nondeterm platprincipal(symbol)
nondeterm menu(symbol)

clauses
/* Les connaissance statique donne par la description de 
l’arbre généalogique==>Fait vrai */
%entree
entree(paella).
entree(salade).
entree(pastelle).
%viande
viande(filetdeboeuf).
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

/* Les connaissance dynamique on 
explique a la machine chaque concepts ==>les règles d'inférences */
platprincipal(X):-viande(X);poisson(X).
menu(X):-entree(X);platprincipal(X);dessert(X).

goal
%platprincipal(merlan).
menu(X).
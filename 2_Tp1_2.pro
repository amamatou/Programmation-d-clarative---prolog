predicates
nondeterm personne(symbol)
nondeterm voleur(symbol)
nondeterm aime(symbol,symbol)
nondeterm vole(symbol,symbol)
clauses
/* Les connaissance statique donne par la description de 
l’arbre généalogique==>Fait vrai */
%personne
personne(marie).
personne(pierre).
%voleur
voleur(pierre).
%aime selon l'enonce
aime(marie,vin).

/* Les connaissance dynamique on 
explique a la machine chaque concepts ==>les règles d'inférences */
aime(pierre,Y):-personne(Y),aime(Y,vin).
vole(X,Y):-voleur(X),aime(X,Y).

goal
vole(X,Y).
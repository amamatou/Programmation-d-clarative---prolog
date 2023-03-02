predicates
nondeterm homme(symbol)
nondeterm femme(symbol)
nondeterm progeniteur(symbol,symbol)
nondeterm pere(symbol,symbol)
nondeterm mere(symbol,symbol)
nondeterm grandpere(symbol,symbol)
nondeterm grandmere(symbol,symbol)
nondeterm frere(symbol,symbol)
nondeterm soeur(symbol,symbol)
nondeterm oncle(symbol,symbol)
nondeterm tante(symbol,symbol)
nondeterm cousin(symbol,symbol)
nondeterm cousine(symbol,symbol)
nondeterm fils(symbol,symbol)
nondeterm fille(symbol,symbol)
nondeterm ascendant(symbol,symbol)

clauses
/* Les connaissance statique donne par la description de 
l’arbre généalogique==>Fait vrai */
%homme
homme(abraham).
homme(clancy).
homme(herb).
homme(homer).
homme(bart).
%femme
femme(mona).
femme(jackie).
femme(marge).
femme(patty).
femme(selma).
femme(lisa).
femme(maggie).
femme(ling).
%progeniteur selon l'arbre genealogique
progeniteur(abraham,herb).
progeniteur(abraham,homer).
progeniteur(mona,herb).
progeniteur(mona,homer).
progeniteur(clancy,marge).
progeniteur(clancy,patty).
progeniteur(clancy,selma).
progeniteur(jackie,marge).
progeniteur(jackie,patty).
progeniteur(jackie,selma).
progeniteur(homer,bart).
progeniteur(homer,lisa).
progeniteur(homer,maggie).
progeniteur(marge,bart).
progeniteur(marge,lisa).
progeniteur(marge,maggie).
progeniteur(selma,ling).

/* Les connaissance dynamique on 
explique a la machine chaque concepts ==>les règles d'inférences */
pere(X,Y):-homme(X),progeniteur(X,Y).
mere(X,Y):-femme(X),progeniteur(X,Y).
grandpere(X,Y):-homme(X),pere(X,Z),pere(Z,Y);homme(X),pere(X,Z),mere(Z,Y).
grandmere(X,Y):-femme(X),mere(X,Z),pere(Z,Y);femme(X),mere(X,Z),mere(Z,Y).
frere(X,Y):-homme(X),pere(Z,X),pere(Z,Y),X<>Y.
soeur(X,Y):-femme(X),pere(Z,X),pere(Z,Y),X<>Y.
oncle(X,Y):-homme(X),pere(Z,Y),frere(X,Z);homme(X),mere(Z,Y),frere(X,Z).
tante(X,Y):-femme(X),pere(Z,Y),soeur(X,Z);femme(X),mere(Z,Y),soeur(X,Z).
cousin(X,Y):-homme(X),pere(Z,X),oncle(Z,Y);homme(X),mere(Z,X),tante(Z,Y).
cousine(X,Y):-femme(X),pere(Z,X),oncle(Z,Y);femme(X),mere(Z,X),tante(Z,Y).
fils(X,Y):-homme(X),progeniteur(Y,X).
fille(X,Y):-femme(X),progeniteur(Y,X).
ascendant(X,Y):-pere(X,Y);mere(X,Y);grandpere(X,Y);grandmere(X,Y).

goal
%progeniteur(jackie,marge).
%ascendant(X,bart).
cousin(X,ling).
Predicates
nondeterm homme(symbol)
nondeterm femme(symbol)
nondeterm progeniteur(symbol,symbol)
nondeterm pere(symbol,symbol)
nondeterm mere(symbol,symbol)
nondeterm fils(symbol,symbol)
nondeterm fille(symbol,symbol)
nondeterm grandPere(symbol,symbol)
nondeterm grandMere(symbol,symbol)
nondeterm frere(symbol,symbol)
nondeterm soeur(symbol,symbol)
nondeterm oncle(symbol,symbol)
nondeterm tante(symbol,symbol)
nondeterm cousin(symbol,symbol)
nondeterm cousine(symbol,symbol)

Clauses
%Homme
homme(bart).
homme(homer).
homme(herb).
homme(abraham).
homme(clancy).
%femme
femme(lisa).
femme(maggie).
femme(ling).
femme(selma).
femme(patty).
femme(marge).
femme(jackie).
femme(mona).
%progniteur
progeniteur(homer,bart).
progeniteur(homer,lisa).
progeniteur(homer,maggie).
progeniteur(marge,bart).
progeniteur(marge,lisa).
progeniteur(marge,maggie).
progeniteur(selma,ling).
progeniteur(clancy,marge).
progeniteur(clancy,patty).
progeniteur(clancy,selma).
progeniteur(jackie,marge).
progeniteur(jackie,patty).
progeniteur(jackie,selma).
progeniteur(mona,homer).
progeniteur(mona,herb).
progeniteur(abraham,homer).
progeniteur(abraham,herb).

%Une personne X est pere d'une personne Y si c'est un homme et progeniteur de Y
pere(X,Y):-homme(X),progeniteur(X,Y).

%Une personne X est mere d'une personne Y si c'est une femme et progeniteur de Y
mere(X,Y):-femme(X),progeniteur(X,Y).

%Une personne X est fils d'une personne Y si X est un homme et Y est progeniteur de X
fils(X,Y):-homme(X),progeniteur(Y,X).

%Une personne X est fille d'une personne Y si X est une femme et Y est progeniteur de X
fille(X,Y):-femme(X),progeniteur(Y,X).

/*Une personne X est grand-pere d'une personne Y si c'est un homme et le progenietur d'une 
personne Z avec Z progeniteur de Y */
grandPere(X,Y):-homme(X),progeniteur(Z,Y),progeniteur(X,Z).

/*Une personne X est grand-mere d'une personne Y si c'est une femme et le progenietur d'une 
personne Z avec Z progeniteur de Y */
grandMere(X,Y):-femme(X),progeniteur(Z,Y),progeniteur(X,Z).

/*Une personne X est frere d'une personne Y si c'est un homme et ils ont le meme pere
 Z et ne sont pas la meme personne */
frere(X,Y):-homme(X),pere(Z,X),pere(Z,Y),X<>Y.

/*Une personne X est frere d'une personne Y si c'est une femme et ils ont le meme pere
 Z et ne sont pas la meme personne */
soeur(X,Y):-femme(X),pere(Z,X),pere(Z,Y),X<>Y.

/*Une personne X est oncle d'une personne Y si c'est le frere d'une personne Z avec Z 
progeniteur de Y */
oncle(X,Y):-progeniteur(Z,Y),frere(Z,X).

/*Une personne X est tante d'une personne Y si c'est la soeur d'une personne Z avec Z 
progeniteur de Y */
tante(X,Y):-progeniteur(Z,Y),soeur(Z,X).

/*Une personne X est cousin d'une personne Y si c'est le fils de la personne Z et Z est l'oncle ou la tante de Y*/
cousin(X,Y):-oncle(Z,Y),fils(X,Z);tante(Z,Y),fils(X,Z).

/*Une personne X est cousine d'une personne Y si c'est la fille de l'oncle ou la tante de Y*/
cousine(X,Y):-oncle(Z,Y),fille(X,Z);tante(Z,Y),fille(X,Z).

Goal
%pere(X,bart).
%mere(X,bart).
%soeur(X,bart).
%grandPere(X,bart).
%grandMere(X,bart).
%oncle(X,bart).
%tante(X,bart).
%fille(X,marge).
cousine(X,ling).
%progeniteur(jackie,marge).
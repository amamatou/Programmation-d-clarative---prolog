domains
int = Integer
predicates
nondeterm divisible(int,int)
nondeterm multiple(int,int)
nondeterm diviseur(int,int)
clauses
/* Les connaissance statique donne par la description de 
l’arbre généalogique==>Fait vrai */
divisible(6,2).
divisible(12,2).
divisible(6,3).
divisible(12,3).

/* Les connaissance dynamique on 
explique a la machine chaque concepts ==>les règles d'inférences */
divisible(X,6):-divisible(X,3),divisible(X,2).
multiple(X,Y):-divisible(X,Y).
diviseur(X,Y):-divisible(Y,X).

goal
%multiple(X,2).
diviseur(X,6).
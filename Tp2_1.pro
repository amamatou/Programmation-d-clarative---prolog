predicates
nondeterm femme(symbol)
nondeterm travail(symbol)
nondeterm objet(symbol)
nondeterm allergique(symbol,symbol)
nondeterm partageDepartement(symbol,symbol)
nondeterm neConnaitPas(symbol,symbol)
nondeterm neConnaitPasAussi(symbol,symbol)
nondeterm incompatible(symbol,symbol)
nondeterm relation(symbol,symbol)
nondeterm aimeseulement(symbol,symbol)
nondeterm qqchencomun(symbol,symbol)
nondeterm occupe(symbol,symbol)
nondeterm occupe1(symbol,symbol)
nondeterm nepeuxoccupe2(symbol,symbol) 
nondeterm nepeuxoccupe3(symbol,symbol)
nondeterm nepeuxoccupe4(symbol,symbol)
nondeterm different(symbol,symbol,symbol,symbol)
nondeterm solution(symbol,symbol,symbol,symbol,symbol,symbol,symbol,symbol)
clauses
%Clara, Luisa, María et Nélida sont quatre femmes qui aiment leur travail
femme(clara).
femme(luisa).
femme(maria).
femme(nelida).

/* Ils travaillent comme créateur de mode, fleuriste, 
jardinier et directeur d’orchestre */
travail(createurMode).
travail(fleuriste).
travail(jardinier).
travail(directeurOrchestre).

/* Clara est violemment allergique aux plantes */
objet(plante).
allergique(clara,plante).

/* Luisa et le fleuriste partagent le département */
partageDepartement(luisa,fleuriste).

/* María et Luisa aiment seulement la musique rock */
aimeseulement(maria,musiqueRock).
aimeseulement(luisa,musiqueRock).

/* Le jardinier, le createurMode et Nélida ne se connaissent pas entre eux */
neConnaitPas(jardinier,nelida).
neConnaitPas(createurMode,nelida).

qqchencomun(jardinier,fleuriste).

%on a une relation entre le travail botanique et la plante
relation(jardinier,plante).
relation(fleuriste,plante).

%musique rock incompatible au travail de directeur d'orchestre
incompatible(rock,directeurOrchestre).

%une femme doit connaitre toutes les personnes de son departement 
%l'inverse vrai donc une femme ne connait pas toute personne hors de son departement
neConnaitPasAussi(X,Y):-neConnaitPas(Z,Y),qqchencomun(Z,X).

/* Chaque femme n'a qu'un travail et chaque travail est occupé par une seule 
femme célibataire */
different(A,B,C,D):-A<>B,A<>C,A<>D,B<>C,B<>D,C<>D.

/* chaque femme peut travailler dans les quatre travaux et Les quatre 
travaux peuvent être occuper par n’importe quelle femme. Principe du 
produit cartésien*/
occupe(X,Y):-femme(X),travail(Y).

% une femme peut occuper un poste s’il n’est pas allergique a certain objet 
%en relation avec son travail
occupe1(X,Y):-femme(X),travail(Y),objet(Z),relation(Y,Z),not(allergique(X,Z)).

%une femme ne peut pas occuper le travail de la personne qui ne connait pas 
%ou de celle qui travaille dans le département de celle qui ne connait pas 
nepeuxoccupe4(X,Y):-femme(X),travail(Y),neConnaitPas(Y,X);femme(X),travail(Y),neConnaitPasAussi(Y,X).

% une femme ne peut occuper le travail de la personne qui travaille avec elle 
%dans le département 
nepeuxoccupe2(X,Y):-femme(X),travail(Y),travail(Z),partageDepartement(X,Z),qqchencomun(Y,Z).

%une femme ne peux occuper un travail si elle dévouer a un seul style de 
%musique qui est incompatible avec ce travail
nepeuxoccupe3(X,Y):-femme(X),travail(Y),aimeseulement(X,Z),incompatible(Z,Y).

/* on rassemble tous dans un même prédicat pour donner à la machine la 
possibilité de chercher la solution en générant 
les arbre de recherche tous en basant sur les fait statique (vrai) et  dynamique
(description du raisonnement )*/ 
solution(X1,Y1,X2,Y2,X3,Y3,X4,Y4):-occupe(X1,Y1),occupe1(X1,Y1),occupe(X2,Y2),nepeuxoccupe2(X2,Y2),occupe(X3,Y3),not(nepeuxoccupe3(X3,Y3)),occupe(X4,Y4), nepeuxoccupe4(X4,Y4),different(X1,X2,X3,X4),different(Y1,Y2,Y3,Y4).

goal
%Requête :attribuer à chaque femme un travail
solution(X1,Y1,X2,Y2,X3,Y3,X4,Y4).

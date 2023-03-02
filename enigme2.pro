predicates

nondeterm professeur(symbol).
nondeterm matiere(symbol).
nondeterm jour(symbol).
nondeterm matiereprofesseur(symbol,symbol).
nondeterm matierejour(symbol,symbol).
nondeterm professeurjour(symbol,symbol).
nondeterm joursuivant(symbol,symbol).
nondeterm programme(symbol,symbol,symbol).


clauses

professeur(saiida).
professeur(mohamed).
professeur(khaled).
matiere(logique).
matiere(programmation).
matiere(mathematique).
jour(lundi).
jour(mercredi).
jour(vendredi).
joursuivant(lundi,mercredi).
joursuivant(mercredi,vendredi).
joursuivant(vendredi,lundi).
matierejour(programmation,Y):- jour(Y), matierejour(logique,Z),joursuivant(Z,Y).
matierejour(logique,Y):- jour(Y), not(Y=lundi),matiereprofesseur(_,Z),not(Z=saiida).
professeurjour(khaled,Y):- jour(Y),not(Y=lundi),matierejour(Z,Y),matiereprofesseur(Z,khaled).
matiereprofesseur(programmation,saiida).
programme(X,Y,Z):- professeur(X),jour(Z),matiere(Y), professeurjour(X,Z), matierejour(Y,Z).


goal

programme(X,Y,Z).



/*Elaborer l'arbre genealogique a partir des seuls faits, homme, femme, progeniteur*/

Predicates
nondeterm homme(symbol)
nondeterm femme(symbol)
nondeterm progeniteur(symbol,symbol)
nondeterm pere(symbol,symbol)
nondeterm mere(symbol,symbol)

Clauses
homme(odilon)./* Odilon est un homme */
homme(roger).
homme(edouard).
homme(vincent).
homme(marcel).
homme(marius).
homme(arnaud).
homme(blaise).
femme(genevieve)./* Genevieve est une femme */
femme(melanie).
femme(pauline).
femme(tatiana).
femme(roseline).
femme(prisca).
femme(agnes).
femme(martine).
progeniteur(agnes,vincent)./* Agnes est le progeniteur de Vincent */
progeniteur(agnes,roseline).
progeniteur(arnaud,vincent).
progeniteur(arnaud,roseline).
progeniteur(martine,marcel).
progeniteur(martine,paule).
progeniteur(blaise,marcel).
progeniteur(blaise,paule).
progeniteur(roseline,roger).
progeniteur(roseline,melanie).
progeniteur(marcel,roger).
progeniteur(marcel,melanie).
progeniteur(marius,edouard).
progeniteur(maruis,tatiana).
progeniteur(prisca,edouard).
progeniteur(prisca,tatiana).
progeniteur(edouard,odilon).
progeniteur(edouard,genevieve).
progeniteur(pauline,odilon).
progeniteur(pauline,genevieve).
progeniteur(melanie,odilon).
progeniteur(melanie,genevieve).

/* Une personne1 est pere d'une autre personne2 si il est homme est progeniteur de la personne2 */
pere(Pr2,Pr1):-progeniteur(Pr2,Pr1),homme(Pr1).
/* Definition du concept mere */
mere(Fils,Mere):-progeniteur(Fils,Mere),femme(Mere).

Goal
pere(edouard,X).
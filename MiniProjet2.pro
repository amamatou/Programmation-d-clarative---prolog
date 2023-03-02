predicates
nondeterm poisson(symbol)
nondeterm petiteBouche(symbol)
nondeterm dentsPointus(symbol)
nondeterm vieRiviere(symbol,symbol)
nondeterm lieu(symbol)
nondeterm ordre(symbol)
nondeterm appartientOrdre(symbol,symbol)
nondeterm famille(symbol)
nondeterm appartientFamille(symbol,symbol)
nondeterm male(symbol)
nondeterm possedeGonopode(symbol)
/*nondeterm description(symbol,symbol,symbol)
nondeterm femelle(symbol)
nondeterm taille(symbol)
nondeterm tacheCorps(symbol)
nondeterm rayureCorps(symbol)
nondeterm rase(symbol)*/



clauses
%CONNAISSANCES STATIQUE
%poisson
poisson(guppys).
poisson(maquereau).

%bouche
petiteBouche(guppys).

%dent
dentsPointus(guppys).

%sexe
male(guppys).

%possedeGonopode
possedeGonopode(guppys).

%ordre
ordre(cyprinodontiformes).

%famille
famille(pœciliens).

%rase(gambusiaAffinis).


lieu(ameriqueSud).
%lieu(asie).

vieRiviere(ameriqueSud,guppys).

/*Si le poisson a une petite bouche et les dents pointus et vie dans la rivières 
de plusieurs partie du monde alors on parle de l’ordre des Cyprinodontiformes
*/
appartientOrdre(cyprinodontiformes,X):-poisson(X),petiteBouche(X),dentsPointus(X),vieRiviere(ameriqueSud,X).


/*Si on a un individu de l’ordre des Cyprinodontiformes et qui vie dans les rivières de l’Amérique de sud et dans 
le cas d’être mâle possède un Gonopode alors le poisson est de la famille des Pœciliens et la femelle est de 3cm,
plus grande que le mâle
*/
%appartientFamille(pœciliens,X):-poisson(X),appartientOrdre(cyprinodontiformes,X),vieRiviere(ameriqueSud,X),male(X),possedeGonopode(X).
%taille(X)=

/*Si on a un individu femelle de l’ordre de Cyprinodontiformes et qui vie 
dans les rivières de l’Amérique de sud alors le poisson est de la famille des 
Pœciliens et le mâle est de 3cm petit que la femelle
*/
%appartient(maquereau,pœciliens):-appartient(maquereau,cyprinodontiformes),lieuRiviere(riviereRose,ameriqueSud),habitat(maquereau,riviereRose),femelle(maquereau),male(maquereau2).

/* Si on a un individu de la famille des Pœciliens qui a des taches le long de 
son corps alors nous sommes devant une rase du gambusia affinis
*/
%appartient(maquereau,gambusiaAffinis):-appartient(maquereau,pœciliens),tacheCorps(maquereau).

/*si on a un individu de la famille des pœciliens qui est de couleur Gris et 
rayures vertes au long de son corps Alors on a un exemple de rase de 
Gambusia Pinctada
*/

Goal
%appartientOrdre(cyprinodontiformes,guppys).
appartientFamille(pœciliens,guppys).
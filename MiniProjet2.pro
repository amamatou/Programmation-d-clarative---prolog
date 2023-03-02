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
famille(p�ciliens).

%rase(gambusiaAffinis).


lieu(ameriqueSud).
%lieu(asie).

vieRiviere(ameriqueSud,guppys).

/*Si le poisson a une petite bouche et les dents pointus et vie dans la rivi�res 
de plusieurs partie du monde alors on parle de l�ordre des Cyprinodontiformes
*/
appartientOrdre(cyprinodontiformes,X):-poisson(X),petiteBouche(X),dentsPointus(X),vieRiviere(ameriqueSud,X).


/*Si on a un individu de l�ordre des Cyprinodontiformes et qui vie dans les rivi�res de l�Am�rique de sud et dans 
le cas d��tre m�le poss�de un Gonopode alors le poisson est de la famille des P�ciliens et la femelle est de 3cm,
plus grande que le m�le
*/
%appartientFamille(p�ciliens,X):-poisson(X),appartientOrdre(cyprinodontiformes,X),vieRiviere(ameriqueSud,X),male(X),possedeGonopode(X).
%taille(X)=

/*Si on a un individu femelle de l�ordre de Cyprinodontiformes et qui vie 
dans les rivi�res de l�Am�rique de sud alors le poisson est de la famille des 
P�ciliens et le m�le est de 3cm petit que la femelle
*/
%appartient(maquereau,p�ciliens):-appartient(maquereau,cyprinodontiformes),lieuRiviere(riviereRose,ameriqueSud),habitat(maquereau,riviereRose),femelle(maquereau),male(maquereau2).

/* Si on a un individu de la famille des P�ciliens qui a des taches le long de 
son corps alors nous sommes devant une rase du gambusia affinis
*/
%appartient(maquereau,gambusiaAffinis):-appartient(maquereau,p�ciliens),tacheCorps(maquereau).

/*si on a un individu de la famille des p�ciliens qui est de couleur Gris et 
rayures vertes au long de son corps Alors on a un exemple de rase de 
Gambusia Pinctada
*/

Goal
%appartientOrdre(cyprinodontiformes,guppys).
appartientFamille(p�ciliens,guppys).
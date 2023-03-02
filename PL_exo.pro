predicates
nondeterm animal(symbol)
nondeterm herbivore(symbol)
nondeterm cruel(symbol)
nondeterm carnivore(symbol)
nondeterm mange(symbol,symbol)
nondeterm boit(symbol,symbol)
nondeterm consomme(symbol,symbol)

clauses
%base de connaissance statique
animal(chevre).
animal(loup).
herbivore(chevre).
cruel(loup).

%base de connaissance dynamique
carnivore(X):-cruel(X).
mange(X,viande):-animal(X),carnivore(X).
mange(X,herbe):-animal(X),herbivore(X).
mange(X,Y):-animal(X),animal(Y),carnivore(X),herbivore(Y).
boit(X,eau):-animal(X),carnivore(X);animal(X),herbivore(X).
consomme(X,Y):-mange(X,Y);boit(X,Y).


goal
animal(X),cruel(X),consomme(X,Y).
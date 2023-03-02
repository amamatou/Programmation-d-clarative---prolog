Predicates
nondeterm animal(symbol)
nondeterm herbivore(symbol)
nondeterm cruel(symbol)
nondeterm carnivore(symbol)
nondeterm mange(symbol,symbol)
nondeterm boit(symbol,symbol)
nondeterm consomme(symbol,symbol)

Clauses
animal(chevre).
animal(loup).
herbivore(chevre).
cruel(loup).

carnivore(X):-cruel(X);herbivore(Y),mange(X,Y).
mange(X,viande):-animal(X),carnivore(X).
mange(X,herbe):-animal(X),herbivore(X).
mange(X,Y):-animal(X),carnivore(X),animal(Y),herbivore(Y).
boit(X,eau):-animal(X),(herbivore(X);carnivore(X)).
consomme(X,Y):-mange(X,Y);boit(X,Y).

Goal
animal(X),cruel(X),consomme(X,Y).
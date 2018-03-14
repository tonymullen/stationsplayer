

:- ['tests'], ['definitions'], ['rules'].

:- playGames.

:- bagof(X, test1(X), Xs), write(Xs), nl.
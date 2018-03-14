:- write('Loading rules'), nl.

playGames :-
  write('Playing games'), nl,
  createPath(X),
  write(X).

playGame(_, _, _, 0) :- fail, !.
playGame(Path, _Color, [BoardState|_], _Counter) :-
  gameIsWon(Path, BoardState, Winner),
  write(Winner), write(" wins"), nl,
  writeBoard(BoardState).
playGame(Path, Color, [BoardState|History], Counter) :-
  makeMove(Color, BoardState, NewBoardState),
  nextTurn(Color, NextColor),
  CounterDec is Counter - 1, 
  playGame(Path, NextColor, [NewBoardState, BoardState|History], CounterDec).

gameIsWon(Path, BoardState, Winner) :-
  playerColor(Winner),
  pathFromStart(Winner, Path, 0, BoardState).

pathFromStart(Color, PathPattern, DestStation, BoardState) :-
   BoardState = _-_-Starts-_,
   member(start(StartState, Color), Starts),
   pathTo(StartState, DestStation, Color, PathPattern, BoardState).


pathTo(State, State, _Color, [], _BoardState).
% pathTo(Color, [PathColor|PathPattern], Station, BoardState) :-

createPath([X1, X2, X3, X4, X5, X6, X7, X8]) :-
  permutation(
    [P1, P2, P3, P4, P5, P6, P7, P8|_], 
    [black, white, black, white, black, white, black, white, black, white, black, white]),
  random_permutation(
    [P1, P2, P3, P4, P5, P6, P7, P8], 
    [X1, X2, X3, X4, X5, X6, X7, X8]).
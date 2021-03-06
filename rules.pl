:- write('Loading rules'), nl.

playGames :-
  write('Playing games'), nl,
  createPath(Path),
  playOrder(Turns),
  startBoardState(BoardState),
  playGame(Turns, Winner, Path, BoardState, 20).

playGame(_,_, _, _, _, 0) :- 
  write("Counter ran out. Nobody won."), !, fail.
playGame(_Turns, Winner, Path, [BoardState|_], _Counter) :-
  gameIsWon(Path, BoardState, Winner, BridgesCrossed),
  writeBoard(BoardState).
playGame([Color|Nexts], Winner, Path, [BoardState|History], Counter) :-
  makeMove(Color, BoardState, NewBoardState),
  rotateList([Color|Nexts], NewNexts),
  CounterDec is Counter - 1, 
  playGame(NewNexts, Winner, Path, [NewBoardState, BoardState|History], CounterDec).




gameIsWon(Path, BoardState, Winner, BridgesCrossed) :-
  playerColor(Winner),
  pathFromStart(Winner, Path, 0, BoardState, BridgesCrossed).

pathFromStart(Color, PathPattern, DestStation, BoardState, BridgesCrossed) :-
  BoardState = Bridges-Rings-Starts-_,
  member(start(StartState, Color), Starts),
  pathTo(StartState, DestStation, Color, PathPattern, Bridges, Rings, BridgesCrossed), !.

pathTo(State, State, _Color, [], _BoardState, _Rings, []).
pathTo(State, DestState, Color, [PathColor|RestOfPath], Bridges, Rings, [BridgeCrossed|BridgesCrossed]) :-
  (
    member(bridges(State, NextState, B), Bridges)
  ;
    member(bridges(NextState, State, B), Bridges)
  ),
  member(State-PathColor-NextState, B),
  member(rings(NextState, RingsOnTheState), Rings),
  member(Color, RingsOnTheState),
  removeRing(Color, NextState, Rings, NewRings),
  BridgeCrossed = State-PathColor-NextState,
  pathTo(NextState, DestState, Color, RestOfPath, Bridges, NewRings, BridgesCrossed).


removeRing(Color, State, [rings(State, RingsOnThisState)|RingsTail], [rings(State, RingsWithOneRemoved)|RingsTail]) :-
  removeColoredRing(Color, RingsOnThisState, RingsWithOneRemoved).
removeRing(Color, State, [rings(DifferentState, Rings)|RingsTail], [rings(DifferentState, Rings)|NewRingsTail]) :-
  State \= DifferentState,
  removeRing(Color, State, RingsTail, NewRingsTail).

removeColoredRing(Color, [Color|Rings], Rings).
removeColoredRing(Color, [Ring|Rings], [Ring|RingsRemoved]) :-
  removeColoredRing(Color, Rings, RingsRemoved).

createPath([X1, X2, X3, X4, X5, X6, X7, X8]) :-
  permutation(
    [P1, P2, P3, P4, P5, P6, P7, P8|_], 
    [black, white, black, white, black, white, black, white, black, white, black, white]),
  random_permutation(
    [P1, P2, P3, P4, P5, P6, P7, P8], 
    [X1, X2, X3, X4, X5, X6, X7, X8]).

rotateList([H|T], List) :-
  append(T, [H], List).
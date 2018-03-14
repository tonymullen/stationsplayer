:- write('Loading tests'), nl.

test1(Winner, BridgesCrossed) :-
  playerColor(Winner),
  write('Running test 1'), nl,
  Path = [black, white, black, white, black, white, black, white],
  SuccessBoardState =
  [
    bridges(0, 1, []),
    bridges(0, 2, []),
    bridges(0, 3, []),
    bridges(0, 4, [4-white-0]),
    bridges(0, 5, []),
    bridges(0, 6, []),
    bridges(1, 2, [1-black-2]),
    bridges(1, 6, []),
    bridges(1, 8, []),
    bridges(2, 3, [2-white-3]),
    bridges(2, 8, []),
    bridges(3, 4, [3-black-4]),
    bridges(4, 5, [4-white-5, 5-black-4]),
    bridges(4, 7, []),
    bridges(5, 6, [5-black-6, 6-white-5]),
    bridges(5, 7, [])
  ]-[
    rings(0, [red, green, blue, yellow]),
    rings(1, []),
    rings(2, [green]),
    rings(3, [green]),
    rings(4, [green, green]),
    rings(5, [green, green]),
    rings(6, [green]),
    rings(7, []),
    rings(8, [])
  ]-[
    start(1, green),
    start(2, blue),
    start(4, yellow),
    start(5, red)
  ]-(
    lastMove(void)
  ),
  gameIsWon(Path, SuccessBoardState, Winner, BridgesCrossed).

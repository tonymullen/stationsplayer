:- write('Loading tests'), nl.

test1(Winner) :-
  write('Running test 1'), nl,
  Path = [black, white, black, white, black, white, black, white],
  SuccessBoardState =
  [
    bridges(0, 1, [_, _, _]),
    bridges(0, 2, [_, _, _]),
    bridges(0, 3, [_, _, _]),
    bridges(0, 4, [4-white-0, _, _]),
    bridges(0, 5, [_, _, _]),
    bridges(0, 6, [_, _, _]),
    bridges(1, 2, [1-black-2, _, _]),
    bridges(1, 6, [_, _, _]),
    bridges(1, 8, [_, _, _]),
    bridges(2, 3, [2-white-3, _, _]),
    bridges(2, 8, [_, _, _]),
    bridges(3, 4, [3-black-4, _, _]),
    bridges(4, 5, [4-white-5, _, _]),
    bridges(4, 7, [_, _, _]),
    bridges(5, 6, [5-black-6, 6-white-5, 5-black-4]),
    bridges(5, 7, [_, _, _])
  ]-[
    rings(0, [red, green, blue, yellow]),
    rings(1, [_, _, _, _]),
    rings(2, [green, _, _, _]),
    rings(3, [green, _, _, _]),
    rings(4, [green, green, _, _]),
    rings(5, [green, green, _, _]),
    rings(6, [green, _, _, _]),
    rings(7, [_, _, _, _]),
    rings(8, [_, _, _, _])
  ]-[
    start(1, green),
    start(2, blue),
    start(4, yellow),
    start(5, red)
  ]-(
    lastMove(void)
  ),
  gameIsWon(Path, SuccessBoardState, Winner).

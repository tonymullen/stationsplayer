%        __
%     __/  \__
%  __/  \_3/  \__
% /  \_4/  \_2/  \
% \_7/  \_0/  \_8/
%    \_5/  \_1/ 
%       \_6/

:- write('Loading definitions'), nl.

playerColor(red).
playerColor(green).
playerColor(blue).
playerColor(yellow).

playOrder([green, red, blue, yellow]).

pathColor(black).
pathColor(white).

startBoardState(
  [ bridges(0, 1, []),
    bridges(0, 2, []),
    bridges(0, 3, []),
    bridges(0, 4, []),
    bridges(0, 5, []),
    bridges(0, 6, []),
    bridges(1, 2, []),
    bridges(1, 6, []),
    bridges(1, 8, []),
    bridges(2, 3, []),
    bridges(2, 8, []),
    bridges(3, 4, []),
    bridges(4, 5, []),
    bridges(4, 7, []),
    bridges(5, 6, []),
    bridges(5, 7, [])
  ]-[
    rings(0, [red, green, blue, yellow]),
    rings(1, []),
    rings(2, []),
    rings(3, []),
    rings(4, []),
    rings(5, []),
    rings(6, []),
    rings(7, []),
    rings(8, [])
  ]-[
    start(1, green),
    start(2, blue),
    start(4, yellow),
    start(5, red)
  ]-(
    lastMove(void)
  )).
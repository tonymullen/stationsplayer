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

pathColor(black).
pathColor(white).

startBoardState(
  [ bridges(0, 1, [_, _, _]),
    bridges(0, 2, [_, _, _]),
    bridges(0, 3, [_, _, _]),
    bridges(0, 4, [_, _, _]),
    bridges(0, 5, [_, _, _]),
    bridges(0, 6, [_, _, _]),
    bridges(1, 2, [_, _, _]),
    bridges(1, 6, [_, _, _]),
    bridges(1, 8, [_, _, _]),
    bridges(2, 3, [_, _, _]),
    bridges(2, 8, [_, _, _]),
    bridges(3, 4, [_, _, _]),
    bridges(4, 5, [_, _, _]),
    bridges(4, 7, [_, _, _]),
    bridges(5, 6, [_, _, _]),
    bridges(5, 7, [_, _, _])
  ]-[
    rings(0, [red, green, blue, yellow]),
    rings(1, [_, _, _, _]),
    rings(2, [_, _, _, _]),
    rings(3, [_, _, _, _]),
    rings(4, [_, _, _, _]),
    rings(5, [_, _, _, _]),
    rings(6, [_, _, _, _]),
    rings(7, [_, _, _, _]),
    rings(8, [_, _, _, _])
  ]-[
    start(1, green),
    start(2, blue),
    start(4, yellow),
    start(5, red)
  ]-(
    lastMove(void)
  )).
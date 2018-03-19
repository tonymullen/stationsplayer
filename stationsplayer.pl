

:- ['tests'], ['definitions'], ['rules'].

:- playGames.


test :- 
  \+test1(red, R), write("Test 1 with red fails: "), writeGround(R),nl,
  test1(green, G), write("Test 1 with green succeeds: "), writeGround(G), nl,
  \+test2(green, NG), write("Test 2 with green fails: "), writeGround(NG), nl.

writeGround(A) :-
  (
    ground(A),
    write(A), nl
    ;
    write("No result")
  ).
% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

{ sudoku(R, C, V) : V = 1..9 } = 1 :- R = 1..9, C = 1..9.
:- sudoku(R, C, V), sudoku(R, C', V), C != C'.
:- sudoku(R, C, V), sudoku(R', C, V), R != R'.

sudoku(R, C, V) :- initial(R, C, V).

subgrid(R, C, 1) :- R = 1..3, C = 1..3.
subgrid(R, C, 2) :- R = 1..3, C = 4..6.
subgrid(R, C, 3) :- R = 1..3, C = 7..9.
subgrid(R, C, 4) :- R = 4..6, C = 1..3.
subgrid(R, C, 5) :- R = 4..6, C = 4..6.
subgrid(R, C, 6) :- R = 4..6, C = 7..9.
subgrid(R, C, 7) :- R = 7..9, C = 1..3.
subgrid(R, C, 8) :- R = 7..9, C = 4..6.
subgrid(R, C, 9) :- R = 7..9, C = 7..9.

:- sudoku(R, C, V), sudoku(R', C', V), subgrid(R, C, G), subgrid(R', C', G), R != R', C != C'.

#show sudoku/3.

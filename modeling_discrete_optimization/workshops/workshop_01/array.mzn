par int: n;

% I restrict the possible values of the elements of the array to {1, ..., 9}
% instead of {0, 1, ... 9} to throw out the trivial all-zero solution
set of int: PossibleVals = 1..9;
set of int: NUMBERS = 1..n;

array[NUMBERS] of var PossibleVals: x;

constraint sum(x) = product(x);

constraint forall (i in 1..(n-1))(x[i] <= x[i+1]);

solve satisfy;

output ["Possible Solution = ", show(x)];
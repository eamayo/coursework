par int: n;


set of int: PossibleVals = 0..3;
set of int: NUMBERS = 1..n;

array[NUMBERS] of var PossibleVals: x;

% Note that constraints below will be unsatisfiable for any n such that
% (n-1) is divisible by 3 because the the 2nd and 4th constraints guarantee in this case
% that the sum of the  last 2 numbers in the array is at least 5 which in turn violates
% the  3rd constraint
constraint x[1] = 0;
constraint x[n] = 3;
constraint forall (i in 1..(n-1))(x[i] + x[i+1] <= 3);
constraint forall([x[i] >= 2 | i in NUMBERS where (i mod 3) == 0 ]);

solve maximize sum(x);

output [show(sum(x)), " = ", show(x)];
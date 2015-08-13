var 0..10: x;

%constraint x mod 4 = 0;

% alternatively express the constraint without using mod
constraint x - ((x div 4) * 4) = 0;

solve maximize pow((x - 7), 2);

output ["Optimal Solution x = ", show(x)];
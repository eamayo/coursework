set of int: PossibleVals = 1..9;

var PossibleVals: x;
var PossibleVals: y;

constraint forall([ exists([x >= 4, y <= 5]), exists([y >= x + 4, x >= y + 6]), x + y >= 8]);

solve satisfy;

output ["Possible Solution = (", show(x), ",", show(y), ") \n"];
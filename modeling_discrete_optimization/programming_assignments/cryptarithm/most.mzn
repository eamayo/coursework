var 1..9: S;
var 0..9: E;
var 0..9: N;
var 0..9: D;
var 1..9: M;
var 0..9: O;
var 0..9: T;
var 0..9: Y;

var int: obj = 10000 * M + 1000 * O + 100 * N + 10 * E + Y;

include "alldifferent.mzn";
constraint alldifferent([S,E,N,D,M,O,T,Y]);

constraint  1000 * S + 100 * E + 10 * N + D
          + 1000 * M + 100 * O + 10 * S + T
         = obj;

solve maximize obj;

%output [show(obj), " , ", show([S,E,N,D,M,O,T,Y])];

set of int: INDEX = 1..3;
% array of natives. array[i] = true (Knight), array[i] = false (Knave)
array[INDEX] of var bool: natives; 

% knights always tell the truth and knaves always lie. So the truth value
% of a statement by native A can be modeled as
%  not ( A xor statement(A) ) which is only true if A is a Knight and statement(A) is true
% or if A is a knave and statement(A) is false

% constraint arising from statement made by native D (exactly one of us is a Knight)
constraint not (natives[1] xor sum([ bool2int(natives[i]) | i in INDEX ]) = 1);

% constraint arising from statement made by native E (Exactly two of us are Knights)
constraint not (natives[2] xor sum([ bool2int(natives[i]) | i in INDEX ]) = 2);

% constraint arising from statement made by native F (All of us are Knights)
constraint not (natives[3] xor sum([ bool2int(natives[i]) | i in INDEX ]) = 3);

solve satisfy;

output["native D is a Knight: ", show(natives[1]), "\n", "native E is a Knight: ", show(natives[2]), "\n", "native F is a Knight: ", show(natives[3]), "\n"];
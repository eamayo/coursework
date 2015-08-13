float: numBushels;
int: numPeople;
int: numGroups;

set of int: NUMGROUPS = 1..numGroups;

array[NUMGROUPS] of float: distribution;

int: maxPossiblePerGroup = ceil(max([numBushels / distribution[i] | i in NUMGROUPS]));

array[NUMGROUPS] of var 1..maxPossiblePerGroup: numPersonsPerGroup;

constraint sum(numPersonsPerGroup) = numPeople;
constraint sum([ distribution[i]*numPersonsPerGroup[i] | i in NUMGROUPS]) = numBushels;
constraint numPersonsPerGroup[2] = 5*numPersonsPerGroup[1];

solve satisfy;

output[show(numPersonsPerGroup)];
udt: dt ndt -> list	//bad -> name is after type form which it is derived from it's devisor (parent) anyway
{
	add(dt element);
	math dt get(natural index);
}



list: dt ndt		//best -> type can be defined through type form on another type (e.g. declaration could be "l_list: dt list" to inherit from list and compose on dt still (sdt et cetera or a type could be substituted into dt since dt is generic))
{
	add(dt element);
	math dt get(natural index);
}



dt list: ndt	//bad -> implies the same form as functions but uses the operands in the opposite direction
{
	add(dt element);
	math dt get(natural index);
}
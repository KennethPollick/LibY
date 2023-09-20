/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-09-19
**********************************************************************/

monoid: dt
{
	associative operator monoid#0 binary_+(monoid a, monoid#0 b);
}

group: monoid
{
	operator group#0 unary_-(group a);
	operator group#0 binary_-(group a, group#0 b) { return a + (-b); }
}

ring: group
{
	associative operator ring#0 binary_*(ring a, ring#0 b);
	operator ring#0 unary_/(ring nonzero a);
	operator ring#0 binary_/(ring a, ring#0 nonzero b) { return a * (/b); }
}

field: group
{
	associative operator field#0 binary_*(field a, field#0 b);
	operator field#0 unary_/(field a);
	operator field#0 binary_/(field a, field#0 b) { return a * (/b); }
}

//algebras



well-ordered: dt
{
	operator boole binary_<(well-ordered a, well-ordered#0 b);
	operator boole binary_>(well-ordered a, well-ordered#0 b);
	operator boole binary_=(well-ordered a, well-ordered#0 b);
	operator comparison binary_<=>(well-ordered a, well-ordered#0 b);
}

ordering: well-ordered
{
	ordering#0 succ();
}

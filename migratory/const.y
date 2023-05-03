/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-05-03
**********************************************************************/

//DONE: will go in the migratory library
immutable const: dt sdt
{
	dt#0 data;

	become operator dt#0 unary_*() { return this.data; }
}

constant cconst: dt sdt
{
	dt#0 data;

	become operator dt#0 unary_*() { return this.data; }
}


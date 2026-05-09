/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023-2026 Kenneth Pollick
DATE:		2026-05-09
**********************************************************************/

//this really needs evaluation
constant recursive_list: dt sdt
{
	dt#0 value;
	dt#0 recursive_list pointer next;

	ctor() { this = {}; }

	ctor(dt#0 value) { this = {value, NULL}; }

	//I guess technically this would work as a stack that only works at compiletime
	//should it be a list or stack, or should both be here
	dt#0 recursive_list push(dt#0 value)
	{
		return {value, &this};
	}
}

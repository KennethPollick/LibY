/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-04-21
**********************************************************************/

//this really needs evaluation
constant recursive_list: dt sdt
{
	constant dt#0 value;
	constant dt#0 recursive_list pointer next;

	ctor() { this = {}; }

	ctor(dt#0 value) { this = {value, NULL}; }

	//I guess technically this would work as a stack that only works at compiletime
	dt#0 recursive_list push(dt#0 value)
	{
		return {value, this};
	}
}

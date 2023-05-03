/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-05-03
**********************************************************************/

//DONE: checked if use case still exists within new conventions
//functions the same as an immutable pointer to dt
immutable reference ref: dt sdt
{
	dt#0 pointer p;
	
	static ctor(dt#0 immutable pointer ptr) { this.p = ptr; }
	
	become operator dt#0 unary_*() { return *this.p; }
}

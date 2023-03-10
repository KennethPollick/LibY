/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

//TODO: check if use case still exists within new conventions
ref: dt sdt
{
	dt#0 pointer p;
	
	static ctor(dt#0 pointer ptr) { this.p = ptr; }
	
	become operator dt#0 unary_*() { return *p; }
}

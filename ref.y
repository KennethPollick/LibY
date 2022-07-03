/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-03
**********************************************************************/

ref: dt sdt
{
	dt#0 pointer p;
	
	math ctor(dt#0 pointer ptr) { this.p = ptr; }
	
	become operator dt#0 unary_*() { return *p; }
}
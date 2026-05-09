/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2026 Kenneth Pollick
DATE:		2026-05-09
**********************************************************************/

//could be an immutable data structure
anywhere_pointer: dt sdt
{
	dt#0 pointer p;
	boole dealloc;

	//ctor(dt#0 pointer p, boole dealloc) { this = {p, dealloc}; } //probably better ways of constructing this type

	dtor()
	{
		if (this.dealloc)
			free{this.p};
	}

	become operator dt#0 unary_*() { return *this.p; }
}

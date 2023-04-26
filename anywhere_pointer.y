/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-04-25
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

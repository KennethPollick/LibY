/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

anywhere_pointer: dt sdt
{
	dt#0 pointer p;
	boole dealloc;

	//do I enforce the deallocation?
	//ctor(dt#0 pointer p, boole dealloc) { *this = {p, dealloc}; }

	dtor()
	{
		if (this.dealloc)
			free{this.p};
	}

	become operator dt#0 unary_*() { return *this.p; }
}

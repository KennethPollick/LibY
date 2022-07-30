/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-30
**********************************************************************/

anywhere_pointer: dt sdt
{
	dt#0 pointer p;
	boole dealloc;

	//ctor(dt#0 pointer p, boole dealloc) { *this = {p, dealloc}; }

	dtor()
	{
		if (this.dealloc)
			free(this.p);
	}

	become operator dt#0 unary*() { return *this.p; }
}

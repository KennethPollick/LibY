/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2026 Kenneth Pollick
DATE:		2026-05-09
**********************************************************************/

nontrivial: dt sdt
{
	dt#0 data;
	boole destroy;
	
	//ctor(dt#0 data, boole destroy) { this = {data, destroy}; }

	dtor()
	{
		if (this.destroy)
			this.data.dtor();
	}

	//become operator dt#0 unary*() { return this.data; }
}

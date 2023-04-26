/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-04-25
**********************************************************************/

reference surrogate[n]: dt sdt
{
	memory[n] data;
	
	ctor(dt#0 immutable s)
	{
		if (SIZE{s} > n)
			err "type is too large for surrogate";
		
		this.data = memory(s);
	}
	
	static dt#0 pointer broker() { return &this.data; }

	//check if dereference operator is also necessary
}

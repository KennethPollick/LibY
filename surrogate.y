/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-08-20
**********************************************************************/

//reference
surrogate[n]: dt sdt
{
	memory[n] data;
	
	ctor(constant dt#0 s)
	{
		if (size(s) > n)
			err("type is too large for surrogate");
		
		this.data = memory(s);
	}
	
	math dt#0 pointer broker() { return &this.data; }
}

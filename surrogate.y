/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

//reference
surrogate[n]: dt sdt
{
	memory[n] data;
	
	ctor(constant dt#0 s)
	{
		if (size(s) > n)
			err "type is too large for surrogate";
		
		this.data = memory(s);
	}
	
	static dt#0 pointer broker() { return &this.data; }

	//check if dereference operator is also necessary
}

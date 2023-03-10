/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

//TODO: also on chopping block
const: dt sdt
{
	dt#0 data;
	
	ctor(dt#0 data)
	{
		this.data = data;
	}
	
	operator dt#0 const binary_=();
	//operator dt#0 const binary_=(dt#0 const) {}
		
	operator dt#0 unary_*()
	{
		return this.data;
	}	
}

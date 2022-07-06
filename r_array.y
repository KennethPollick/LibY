/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-04
**********************************************************************/

constant natural R_ARRAY_DEFAULT_LENGTH = 10;

//TODO: decide whether r_array should have a separate size and capacity
r_array: dt list
{
	dt#0 array pointer arr;
	
	ctor() { this = ctor(R_ARRAY_DEFAULT_LENGTH); }
	
	ctor(natural length)
	{
		this.arr = allocate(dt#0 array[length]);
	}
	
	natural length()
	{
		return size(this.arr);
	}
}

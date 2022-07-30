/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-30
**********************************************************************/

constant natural R_ARRAY_DEFAULT_LENGTH = 10;

r_array: dt list
{
	dt#0 array pointer arr;
	natural len;
	
	ctor() { *this = ctor(R_ARRAY_DEFAULT_LENGTH); }
	
	ctor(natural length)
	{
		*this = {allocate(dt#0 array[length]), length};
	}
	
	math natural length() { return this.len; }
	math natural capacity() { return size(*this.arr); }

	math become operator dt#0 unary[](natural i)
	{
		// TODO: finish
		return this.arr[i];
	}
}

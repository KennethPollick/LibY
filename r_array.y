/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

constant natural R_ARRAY_DEFAULT_LENGTH = 10;

r_array: dt list
{
	dt#0 array pointer arr;
	natural len;
	
	ctor() { *this = ctor(R_ARRAY_DEFAULT_LENGTH); }
	
	ctor(natural length)
	{
		*this = {allocate{dt#0 array[length]}, length};
	}
	
	static natural length() { return this.len; }
	static natural capacity() { return size{*this.arr}; }

	static become operator dt#0 unary_[](natural i)
	{
		// TODO: decide whether to bounds check on capacity or length and whether that is only in debug mode
		return this.arr[i];
	}
}

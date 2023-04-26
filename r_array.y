/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-04-25
**********************************************************************/

constant natural[] R_ARRAY_DEFAULT_LENGTH = 10;

r_array: dt list
{
	dt#0 array pointer arr;
	natural[] len;
	
	ctor() { this = ctor(R_ARRAY_DEFAULT_LENGTH); }
	
	ctor(immutable natural[] length)
	{
		this = {allocate{dt#0 array[length]}, length};
	}
	
	static natural length() { return this.len; }
	static natural capacity() { return size{*this.arr}; }

	static become operator dt#0 unary_[](immutable natural[] i)
	{
		// TODO: decide whether to bounds check on capacity or length and whether that is only in debug mode
		if (DEBUG)
		{
			if (i >= this.capacity())
				err "capacity of resizable array exceeded";
			else if (i >= this.length())
				err "length of resizable array exceeded";
		}

		return this.arr[i];
	}

	static dt#1 list map((dt<<dt#0) proc) //currently, the library does not have consistent use of the mutability properties like static
	{
		natural[] immutable l = this.len;
		dt#1 r_array ret = ctor(l);

		for (natural[] c = 0; c < l; c++)
			ret[c] = proc(this[c]);

		return ret;
	}
}

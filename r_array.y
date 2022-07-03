/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-03
**********************************************************************/

//TODO: decide whether r_array should have a separate size and capacity
r_array: dt list
{
	dt#0 array pointer arr;
	
	ctor() { this.arr = NULL; }
	
	ctor(natural size)
	{
		this.arr = allocate(dt#0 array[size]);
	}
	
	natural length()
	{
		if (this.arr == NULL)
			return 0;
		
		return size(this.arr);
	}
}
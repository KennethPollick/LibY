/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-04-25
**********************************************************************/

//maybe check if bounded and unbounded ranges are needed
//make sure to switch dt out with a type representing a well ordered set
//could also possibly be a constant type
range: dt sdt
{
	dt#0 low;
	dt#0 length;

	ctor(dt#0 low, dt#0 length)
	{
		this.low = low;
		this.length = length;
	}

	dt#0 high() { return this.low + (this.length - 1); }
}

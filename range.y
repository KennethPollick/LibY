/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-08-15
**********************************************************************/

//make sure to switch dt out with a type representing a well ordered set
immutable range: dt sdt
{
	dt#0 low;
	dt#0 length;

	ctor(dt#0 low, dt#0 length)
	{
		this.low = low;
		this.length = length;
	}

	static dt#0 high() { return this.low + (this.length - 1); }



	map_sink((<<dt#0) proc)
	{
		dt#0 h = this.high();
		for (dt#0 c = this.low; c <= h; c++) proc(c);
	}

	dt#1 array map((dt<<dt#0) proc)
	{
		dt#0 h = this.high();
		dt#1 array[this.length] arr;
		for (dt#0 c = this.low; c <= h; c++) arr[c-this.low] = proc(c);
	}
}

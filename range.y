/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-30
**********************************************************************/

range: dt sdt
{
	dt#0 low;
	dt#0 length;

	//TODO: decide whether ctor is needed or range can be a struct
	ctor(dt#0 low, dt#0 length)
	{
		this.low = low;
		this.length = length;
	}

	dt#0 high() { return this.low + (this.length - 1); }
}

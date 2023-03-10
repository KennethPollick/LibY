/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

//maybe check if bounded and unbounded ranges are neede
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

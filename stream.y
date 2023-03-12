/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-03-12
**********************************************************************/

//this should work now
//needs evaluation
constant stream: (dt, dt) sdt
{
	(dt#0 maybe << dt#1 maybe) filter;
	constant (dt#1, dt) stream pointer previous;

	ctor((dt#0 maybe << dt#1 maybe) filter) { *this = {filter, NULL}; }

	(dt#3, dt#0) stream with_filter((dt maybe << dt#0 maybe) filter) { return stream{filter, this}; }

	dt#0 maybe apply(dt maybe value)
	{
		dt#1 maybe in;
		dt#0 maybe out;

		if (this.more ~= NULL)
		{
			in = this.previous.apply(value);
			out = filter(in);
		}
		else
		{
			out = filter(value);
		}
		
		return out;
	}

	//member procedure that applies to a list
}

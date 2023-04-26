/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-04-25
**********************************************************************/

//needs evaluation
constant reference stream: (dt, dt) sdt
{
	(dt#0 maybe << dt#1 maybe) filter;
	(dt#1, dt) stream pointer previous;

	//again, maybe ctor is unneeded now
	ctor((dt#0 maybe << dt#1 maybe) filter) { this = {filter, NULL}; }

	(dt#3, dt#0) stream with_filter((dt maybe << dt#0 maybe) filter) { return stream{filter, &this}; }

	dt#0 maybe apply(dt maybe immutable value)
	{
		dt#0 maybe out;

		if (this.previous ~= NULL)
		{
			dt#1 maybe in = this.previous.apply(value);
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

/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-09-02
**********************************************************************/

//needs evaluation
constant reference stream: (dt, dt) sdt
{
	(dt#0 maybe << dt#1 maybe) filter;
	(dt#1, dt) stream pointer previous;

	//again, maybe ctor is unneeded now
	ctor((dt#0 maybe << dt#1 maybe) filter) { this = {filter, NULL}; }

	(dt#3, dt#0) stream with_filter((dt maybe << dt#0 maybe) filter) { return stream{filter, &this}; }

	//maybe make defer property to bubble up failed concrete casts to the call site outside of deferred procedures
	dt#0 maybe apply(dt maybe immutable value)
	{
		dt#0 maybe out;

		if (this.previous ~= NULL)
		{
			dt#1 maybe in = this.previous.apply(value);
			out = this.filter(in);
		}
		else
		{
			out = this.filter( concrete{cast{value, dt#1 maybe}} );
		}
		
		return out;
	}

	//member procedure that applies to a list
}

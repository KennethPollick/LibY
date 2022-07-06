/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-04
PURPOSE:	To define the Y standard library
**********************************************************************/

//TODO: deal with namespace collapsing and finalize keyword properties
library y
{
	library sys;
	
	const: dt sdt;
	ref: dt sdt;
	object: dt sdt;

	version[n]: sdt;

	ip[v]: sdt;

	hyperreal: dt sdt;
	mod[n]: dt sdt;
	range: dt sdt;
	non_zero: dt sdt;
	non_null: dt sdt;
	number: dt sdt;

	for_range(dt range r, (<<dt#0) proc)
	{
		for(dt#0 c = r.low; c < r.low + r.length; c++)
			proc(c);
	}
}

library y>sys
{
	library polyphony;
	library linux;
	library windows;
	library mac;
	
	program_args: sdt;
}

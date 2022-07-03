/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-03
PURPOSE:	To define the Y standard library
**********************************************************************/

//TODO: deal with namespace collapsing and finalize keyword properties
library y
{
	library sys;
	
	const: dt sdt;
	ref: dt sdt;
	object: dt sdt;
	
	hyperreal: dt sdt;
}

library y>sys
{
	library polyphony;
	library linux;
	library windows;
	library mac;
	
	program_args: sdt;
}
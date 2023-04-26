/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-04-25
PURPOSE:	To define the Y standard library
**********************************************************************/

//TODO: deal with namespace collapsing and finalize keyword properties

//TODO: finalize syntax and refactor the standard
library y
{	
	const: dt sdt;
	object: dt sdt;

	version[n]: sdt;

	ip_address[v]: sdt;

	hyperreal: dt sdt;
	mod[n]: dt sdt;
	range: dt sdt;
	non_zero: dt sdt;
	non_null: dt sdt;
	number: dt sdt;

	//add a few more range loop procedures probably
	for_range(dt range r, (<<dt#0) proc)
	{
		for(dt#0 c = r.low; c <= r.high(); c++)
			proc(c);
	}



	//TODO: check naming
	dt#0 future async((dt<<dt) proc, dt#1 args)
	{
		dt#0 future ret;
		dispatch ret = future(proc(args));	//needs evaluation
		return ret;
	}
}







//system library will now be part of the language
library y>sys
{
	library polyphony;
	library linux;
	library windows;
	library mac;
	
	program_args: sdt;
}

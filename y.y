/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-08-15
PURPOSE:	To define the Y standard library
**********************************************************************/

//TODO: deal with namespace collapsing and finalize keyword properties

//TODO: finalize syntax and refactor the standard
library y
{
	version[n]: sdt;

	ip_address[v]: sdt;

	hyperreal: dt sdt;
	mod[n]: dt sdt;
	range: dt sdt;
	non_zero: dt sdt;
	number: dt sdt;





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

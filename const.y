/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-03
**********************************************************************/

const: dt sdt
{
	dt#0 data;
	
	ctor(dt#0 d)
	{
		this.data = d;
	}
	
	operator dt#0 const binary_=();
	//(<<) internal = (){};
	
	operator dt#0 unary_*()
	{
		return this.data;
	}
	
	//[op_specifiers] [proc_specifiers] [return_type] [proc_name]([arg_list]);            //Procedure Declaration Grammar of Y
}
/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-04
**********************************************************************/

const: dt sdt
{
	dt#0 data;
	
	ctor(dt#0 data)
	{
		this.data = data;
	}
	
	operator dt#0 const binary_=();
	//operator dt#0 const binary=(dt#0 const) {}
	
	//(<<) internal = (){};
	
	operator dt#0 unary_*()
	{
		return this.data;
	}
	
	//[op_specifiers] [proc_specifiers] [return_type] [proc_name]([arg_list]);            //Procedure Declaration Grammar of Y
}

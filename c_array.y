/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

//needs evaluation
//TODO: check whether deprecation is needed for c_array
c_array: dt ndt
{
	memory pointer heap;
	dt#0 pointer r_array indeces;
	
	ctor()
	{
		
	}
	
	dtor()
	{
		free{heap};
		free{indeces};
	}
	
	operator dt#0 unary_[](natural index)
	{
		return cast{dt#0, (heap + indeces[index])};
	}
}

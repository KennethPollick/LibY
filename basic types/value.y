/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-08-23
**********************************************************************/

value: dt
{
	right operator value#0 unary_=(value a, value#0 b)
	{
		type t = type_of{a};

	}

	operator boole binary_=(value a, value#0 b)
	{
		
	}
}


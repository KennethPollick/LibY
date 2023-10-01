/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-09-24
**********************************************************************/

value: dt
{
	right operator value#0 unary_=(value become a, immutable(value#0) b)
	{
		type ta = type-of{a};
		type tb = type-of{b};
		constant type v = type_of{value};

		if ( ~(ta.is-basic() || (ta.mem-vars-all-inherit-from(v) /\ tb.mem-vars-all-inherit-from(v) /\ ta.mem-vars == tb.mem-vars)) )
		{
			//call assigment on each member variable
			return b;
		}
		else
		{
			//memcopy
			return cast{a, memory} = cast{b, memory};
		}
	}

	operator boole binary_=(value a, value#0 b)
	{
		
	}
}


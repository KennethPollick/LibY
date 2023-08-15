/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-08-15
**********************************************************************/

//analyze to see if failure ctor check stays after CEC
reference non_null_pointer: dt sdt
{
	dt#0 pointer p;

	ctor(dt#0 pointer ptr)
	{
		if (ptr == NULL)
			err "Non-null pointer assigned Null";

		this.p = ptr;
	}

	octor(dt#0 pointer ptr)
	{
		if (ptr == NULL)
			return dt#0 non_null_pointer maybe();
		else
			return dt#0 non_null_pointer maybe(non_null_pointer{ptr});
	}

	become operator dt#0 unary*()
	{
		return *this.p;
	}
}

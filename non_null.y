/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

//analyze to see if failure ctor check stays after CEC
non_null: dt sdt
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
			return dt#0 non_null maybe();
		else
			return dt#0 non_null maybe(non_null{ptr});
	}

	become operator dt#0 unary*()
	{
		return this.data;
	}
}

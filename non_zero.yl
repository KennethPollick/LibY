/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2026 Kenneth Pollick
DATE:		2026-05-09
**********************************************************************/

non_zero: dt sdt
{
	dt#0 data;

	ctor(dt#0 data)
	{
		if (data == 0)
			err "Non-zero value is zero";
		
		this.data = data;
	}

	octor(dt#0 data)
	{
		if (data == 0)
			return dt#0 non_zero maybe();
		else
			return dt#0 non_zero maybe(non_zero{data});
	}

	become operator dt#0 unary_*()
	{
		return this.data;
	}

	//perhaps add mapping with clamping capability
}

/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-30
**********************************************************************/

mod[n]: dt sdt
{
	dt#0 val;

	ctor(dt#0 d)
	{
		if (n < 2)
			err("Type mod must have a size abstraction greater than one");
		
		this.val = d % n;
	}

	math become operator dt#0 unary*() { return this.val; }

	math operator dt#0 mod[n] binary+(dt#0 r)
	{
		// don't need to modulo beforehand if n is a power of 2 (might remove for dynamically allocated numbers or separate implementations)
		constant dt#0 rp = ternary((popcount(n) == 1), r, (r % n));
		return ctor(this.val + rp);
	}
}

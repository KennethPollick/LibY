/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

mod[n]: dt sdt
{
	dt#0 val;

	ctor(dt#0 d)
	{
		if (n < 2)
			err "Type mod must have a size abstraction greater than one";
		
		this.val = d % n;
	}

	static become operator dt#0 unary_*() { return this.val; }

	static operator dt#0 mod[n] binary_+(dt#0 r)
	{
		// don't need to modulo beforehand if n is a power of 2 (might remove for dynamically allocated numbers or separate implementations)
		constant dt#0 rp = ternary{(popcount(n) == 1), r, (r % n)};
		return ctor(this.val + rp);
	}
}

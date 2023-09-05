/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-09-05
**********************************************************************/

perhaps: dt sdt
{
	boole exists;
	dt#0 data;

	ctor() { this.exists = F; }
	ctor(dt#0 data) { this = {T, data}; }

	boole there() { return this.exists; }

	dt#1 perhaps map((dt<<dt#0) proc)
	{
		if (this.exists)
			return dt#1 perhaps(proc(this.data));
		else
			return dt#1 perhaps();
	}

	dt#1 perhaps bind((dt perhaps<<dt#0) proc)
	{
		if (this.exists)
			return proc(this.data);
		else
			return dt#1 perhaps();
	}
	
	//convention for ensuring invariants: err when invariant is broken (can be optimized away when checked beforehand)
	become operator dt#0 unary_*()
	{
		if (~this.exists)
			err "Perhaps type did not contain a value";
		
		return this.data;
	}

	dt#1 match(dt#1 default, (dt<<dt#0) proc)
	{
		if (this.exists)
			return proc(this.data);
		else
			return default;
	}

	dt#0 pointer get_pointer()
	{
		return ternary{this.exists, &this.data, NULL};
	}
}

//even though this type will be a part of the language, not the Y standard library, it will show not only the interface for the type but also the convention for ensuring invariants in types
maybe: dt sdt
{
	boole exists;
	dt#0 data;

	ctor() { this.exists = F; }
	ctor(dt#0 data) { *this = {T, data}; }

	boole there() { return this.exists; }

	dt#1 maybe map((dt<<dt#0) proc)
	{
		if (this.exists)
			return dt#1 maybe(proc(this.data));
		else
			return dt#1 maybe();
	}

	dt#1 maybe bind((dt maybe<<dt#0) proc)
	{
		if (this.exists)
			return proc(this.data);
		else
			return dt#1 maybe();
	}
	
	//convention for ensuring invariants: err when invariant is broken (can be optimized away when checked beforehand)
	become operator dt#0 unary_*()
	{
		if (~this.exists)
			err "Maybe type did not contain a value";
		
		return this.data;
	}

	dt#1 match(dt#1 default, (dt<<dt#0) proc)
	{
		if (this.exists)
			return proc(this.data);
		else
			return default;
	}
}

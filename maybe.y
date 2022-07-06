//test, not actually in the Y standard library
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
}

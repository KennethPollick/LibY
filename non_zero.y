non_zero: dt sdt
{
	dt#0 data;

	failure ctor(dt#0 data)
	{
		if (data == 0)
			return dt#0 non_zero maybe();
		else
			return dt#0 non_zero maybe(non_zero{data});
	}

	operator dt#0 unary*()
	{
		return this.data;
	}
}

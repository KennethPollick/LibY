//analyze to see if failure ctor check stays after CEC
non_null: dt sdt
{
	dt#0 pointer p;

	failure ctor(dt#0 pointer ptr)
	{
		if (ptr == 0)
			return dt#0 non_null maybe();
		else
			return dt#0 non_null maybe(non_null{ptr});
	}

	become operator dt#0 unary*()
	{
		return this.data;
	}
}

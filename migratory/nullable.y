/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-05-17
**********************************************************************/

reference nullable: dt sdt
{
	dt#0 pointer data;

	ctor() { this.data = NULL; }
	ctor(dt#0 pointer data) { this = ; }

	boole there() { return this.data ~= NULL; }

	dt#1 nullable map((dt<<dt#0) proc)
	{
		if (this.there())
			return dt#1 nullable(proc(*this.data));
		else
			return dt#1 nullable();
	}

	dt#1 maybe bind((dt nullable<<dt#0) proc)
	{
		if (this.there())
			return proc(*this.data);
		else
			return dt#1 nullable();
	}
	
	become operator dt#0 unary_*()
	{
		if (~this.there())
			err "Maybe type did not contain a value";
		
		return *this.data;
	}

	dt#1 match(dt#1 default, (dt<<dt#0) proc)
	{
		if (this.there())
			return proc(*this.data);
		else
			return default;
	}
}

/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

//TODO: perhaps move to a standard library centered on migration from other languages
any: sdt
{
	dt pointer thing;
	
	ctor(any a) { this.thing = allocate{*a.thing}; }
	
	ctor(dt#0 v) { this.thing = allocate{v}; }
	
	dtor() { free{this.thing}; }
	
	
	
	boole exists() { return this.thing ~= NULL; }
	
	become operator any unary_=(dt v)
	{
		if (is_type{v, any})
		{
			if (this.thing ~= v.thing)
			{
				if (this.thing ~= NULL)
					this.dtor();
				
				*this = ctor(v);
			}
		}
		else
		{
			*this = ctor(v);
		}
		
		return *this;
	}
}

/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-08-21
**********************************************************************/

any: sdt
{
	dt pointer thing;
	
	ctor(any a) { this.thing = allocate(*a.thing); }
	
	ctor(dt v) { this.thing = allocate(v); }
	
	dtor() { free(this.thing); }
	
	
	
	boole exists() { return this.thing ~= NULL; }
	
	become operator any unary=(dt v)
	{
		if (is_type(v, any))
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

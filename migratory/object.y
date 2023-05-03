/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-04-21
**********************************************************************/

obj_node: dt sdt
{
	dt#0 data;
	natural obj_count;
}



constant ascii array OBJECT_COMP_ERR = "Type object can only be compared against object or its composed type";

//TODO: perhaps move object, as well, to a standard library centered on migration from other languages
object: dt sdt
{
	dt#0 obj_node pointer obj;
	
	ctor(dt#0 object o)
	{
		if ((this.obj = o.obj) ~= NULL)
			this.obj.obj_count++;
		
		//DONE: this syntax is okay
		//(this.obj = o.obj).obj_count++;
	}
	
	ctor(dt#0 data)
	{
		if (is_type{dt#0, object})
			err "Type object cannot compose itself";
		
		this.obj = allocate{dt#0 obj_node{data, 0}};
	}
	
	dtor()
	{
		if (this.obj.obj_count == 0)
			free{this.obj};
		else
			this.obj.obj_count--;
		
		/*
		if (DEBUG)
			this.obj = NULL;
		*/
	}
	
	
	
	boole exists() { return this.obj ~= NULL; }
	
	become operator dt#0 unary_*()
	{
		return this.obj.data;
	}

	operator boole binary_=(dt v)
	{
		if (is_type{v, object})
			return (this.obj == v.obj) || (this.obj.data == v.obj.data);
		else if (is_type{v, dt#0})
			return this.obj.data == v;
		else
			err OBJECT_COMP_ERR;

		//return ternary{is_type(v, object), (this.obj == v.obj), (this.obj.data == v.obj.data)};
	}
	
	become operator dt#0 object unary_=(dt v)
	{
		if (is_type{v, object})
		{
			if (this.obj ~= v.obj)
			{
				if (this.obj ~= NULL)
					this.dtor();
				
				this = ctor(v);
			}
		}
		else if (is_type{v, dt#0})
		{
			this.obj.data = v;
		}
		else
		{
			err OBJECT_COMP_ERR;
		}
		
		return this;
	}
}

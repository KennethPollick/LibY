/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-30
**********************************************************************/

obj_node: dt sdt
{
	dt#0 data;
	natural obj_count;
}



constant ascii array OBJECT_COMP_ERR = "Type object can only be compared against object or its composed type";

object: dt sdt
{
	dt#0 obj_node pointer obj;
	
	ctor(dt#0 object o)
	{
		if ((this.obj = o.obj) ~= NULL)
			this.obj.obj_count++;
		
		//TODO: determine whether this syntax is okay
		//(this.obj = o.obj).obj_count++;
	}
	
	ctor(dt#0 data)
	{
		if (is_type(dt#0, object))
			err("Type object cannot compose object");
		
		this.obj = allocate(dt#0 obj_node{data, 0});
	}
	
	dtor()
	{
		if (this.obj.obj_count == 0)
			free(this.obj);
		else
			this.obj.obj_count--;
		
		/*
		if (DEBUG)
			this.obj = NULL;
		*/
	}
	
	
	
	boole exists() { return this.obj ~= NULL; }
	
	become operator dt#0 unary*()
	{
		return this.obj.data;
	}

	operator boole binary=(dt v)
	{
		boole ret;

		if (is_type(v, object))
			ret = (this.obj == v.obj);
		else if (is_type(v, dt#0))
			ret = (this.obj.data == v.obj.data);
		else
			err(OBJECT_COMP_ERR);

		return ret;
		//return ternary(is_type(v, object), (this.obj == v.obj), (this.obj.data == v.obj.data));
	}
	
	become operator dt#0 object unary=(dt v)
	{
		if (is_type(v, object))
		{
			if (this.obj ~= v.obj)
			{
				if (this.obj ~= NULL)
					this.dtor();
				
				*this = ctor(v);
			}
		}
		else if (is_type(v, dt#0))
		{
			this.obj.data = v;
		}
		else
		{
			err(OBJECT_COMP_ERR);
		}
		
		return *this;
	}
}

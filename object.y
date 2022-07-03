/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-03
**********************************************************************/

obj_node: dt sdt
{
	natural mutex obj_count;
	dt data;
}



object: dt sdt
{
	dt obj_node pointer obj;
	
	ctor(dt data)
	{
		this.obj = allocate(dt obj_node);
		
		this.obj.data = data;
		(*this.obj.obj_count)++;
	}
	
	dtor()
	{
		(*this.obj.obj_count)--;
		
		if ((*this.obj.obj_count) == 0)
			free(this.obj);
		
		this.obj = NULL;
	}
	
	
	
	dt *(dt object var)
	{
		return this.obj.data;
	}
	
	dt object operator=(dt val)
	{
		if (is_type(val, object))
		{
			if ((this.obj ~= val.obj) && (val.obj ~= NULL))
			{
				if (this.obj ~= NULL)
				{
					//clean up
				}
				
				this.obj = val.obj;
				(*this.obj.obj_count)++;
			}
		}
		else
		{
			this.obj.data = val;
		}
		
		return *this;
	}
}
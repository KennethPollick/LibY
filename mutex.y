/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

//also now going to be part of the language to coincide with the addition of the execution model
mutex: dt sdt
{
	dt#0 data;
	natural pid;	//TODO: implementation change
	boole using;
	
	/*ctor()
	{
		data = dt();
		pid = 0;
	}*/
	
	ctor(dt initial)
	{
		*this = mutex{initial, 0, F};
	}
	
	
	
	
	
	parallel wait_lock(natural my_pid)
	{
		while (this.pid ~= my_pid)
		{
			while (this.pid ~= 0) {}
			this.pid = my_pid;
		}
	}
	
	parallel boole try_lock(natural my_pid)
	{
		if (this.pid == 0)
		{
			this.pid = my_pid;
			return (this.pid == my_pid);
		}
		return F;
	}
	
	become operator dt unary_*()
	{
		return this.data;
	}
	
	unlock(natural my_pid)
	{
		if (this.pid == my_pid)
		{
			this.pid = 0;
			this.using = F;
		}
	}
}

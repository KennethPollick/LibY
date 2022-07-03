mutex: dt sdt
{
	dt#0 data;
	natural pid;
	boole using;
	
	/*mutex()
	{
		data = dt();
		pid = 0;
	}*/
	
	mutex(dt initial)
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
		return false;
	}
	
	become operator dt unary*()
	{
		return this.data;
	}
	
	unlock(natural my_pid)
	{
		if (this.pid == my_pid)
		{
			this.pid = 0;
			this.using = false;
		}
	}
}

real vector[3] mutex position;

integer main()
{
	real vector[3] p;

	position.try_lock(1);
	/* critical section */
	p = (*position);
	(*position) = p;
	//position.data		
	position.unlock(1);

	/* ill advised to used use (*position) */
}


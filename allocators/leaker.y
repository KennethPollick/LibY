/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-05-03
**********************************************************************/

immutable leaker[n]: allocator
{
	boole dont_fail;
	boole try_freeing_past_first;
	logger pointer log;
	allocator pointer array[n] allocators;



	byte pointer allocate(natural[] immutable s)
	{
		byte pointer p = this.allocators[0].allocate(s);
		
		if (p == NULL)
		{
			for (natural[] i = 1; i < size{this.allocators}; i++)
			{
				if (this.log ~= NULL)
					this.log.warn("leaky allocator fellthrough");

				p = this.allocators[i].allocate(s);

				if (p ~= NULL)
					break;
			}

			if (this.dont_fail /\ p == NULL)
				err "leaky allocator couldn't allocate";
		}

		return p;
	}



	deallocate(byte pointer immutable p)
	{
		this.allocators[0].deallocate(p);
		
		if (this.try_freeing_past_first)
		{
			for (natural[] i = 1; i < size{this.allocators}; i++)
			{
				if (this.log ~= NULL)
					this.log.warn("tried to free from a leaky allocator past its first");

				this.allocators[i].deallocate(p);
			}
		}
	}
}


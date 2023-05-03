/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-04-29
**********************************************************************/

arena[B]: allocator
{
	natural[] next_free;
	byte array[B] store;

	ctor() { this.reset(); }
	reset() { this.next_free = 0; }

	natural[] free_space() { return B - this.next_free; }



	deallocate(byte pointer immutable p) {}

	byte pointer allocate(natural[] immutable s)
	{
		if (s > this.free_space())
			return NULL;
		
		byte pointer ret = &this.store[this.next_free];
		this.next_free += s;
		return ret;
	}
}


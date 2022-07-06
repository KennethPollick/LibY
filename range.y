range: dt sdt
{
	dt#0 low;
	dt#0 length;

	//TODO: decide whether ctor is needed or range can be a struct
	ctor(dt#0 low, dt#0 length)
	{
		this.low = low;
		this.length = length;
	}
}

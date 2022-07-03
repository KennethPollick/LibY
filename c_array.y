c_array: dt ndt
{
	dt pointer heap;
	dt pointer r_array indeces;
	
	c_array()
	{
		
	}
	
	~c_array()
	{
		free heap;
		free indeces;
	}
	
	dt operator[](natural index)
	{
		return (dt)(heap + indeces[index]);
	}
}
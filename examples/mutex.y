//example from before the addition of a threading model

real vector[3] mutex position;

main()
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


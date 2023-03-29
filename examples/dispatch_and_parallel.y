
main()
{
	dispatch
	{
		foo(a, 0);	//as if foo is wrapped in a parallel hyperexpression since there are multiple in a dispatch/parallel block
		foo(a, 5);	//perhaps warn if foo is a (<<) procedure since it wouldn't be that useful to run in parallel because arguments are allowed in dispatch/parallel block 
	}
}


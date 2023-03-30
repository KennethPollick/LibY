library the_lib
{
	a: sdt
	{
		integer[] aaa;
	}

	b: sdt a
	{
		sdt#0 bbb;
	}

	natural[] n;
}



main()
{
	the_lib>a var_a;
	var_a.aaa = -5;
	
	//the_lib>b var_b;				compilation error: type the_lib>b is a composing type but doesn't compose in var_b declaration
	natural[] the_lib>b var_b;
	//natural[] vector[3] the_lib>b var_b;		compilation error: type the_lib>b composes sdt, but in var_b declaration it composes vector which doesn't inherit from sdt
	var_b.bbb = 4;
	//var_b.bbb = -6;				compilation error: member variable var_b.bbb is of type natural because type the_lib>b composes it in var_b declaration, but -6 is an integer
	
	
	
	real[] the_lib>b var_rb;
	var_rb.bbb = 3.92;
	
	//the_lib>n = 4;				compilation error: variable the_lib>n cannot be accessed from outside library the_lib
	
	integer[4] pointer matrix[3, 2, 4] pointer vector[2] pointer pointer pointer pointer v;
}

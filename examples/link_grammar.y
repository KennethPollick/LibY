/*
	the three linkages (link defaults to being concrete)
*/
constant bibliographic basic_trig d_lk = abstract{ link{"trig"} };			//an init-time link expression makes the library dynamically linked

main()
{
	constant bibliographic basic_trig s_lk = link{"trig"};				//a compiletime link expression makes the library statically linked
	constant bibliographic basic_trig d_ld = abstract{ link{"trig"} };		//a runtime link expression makes the library dynamically loaded



	/*
		use of bibliographic variable
	*/
	real[] r = d_ld.sin(1);
	real[] b = d_ld.tan(2);
	//real[] e = d_ld.csc(4);			//compilation error: the library "trig" exports as a basic_trig which lacks a cosecant procedure
}





//separate library exported as a basic_trig (perhaps compiled to binary already)
library trig
{
	real[] sin(real[] x);
	real[] cos(real[] x);
	real[] tan(real[] x);
	
	real[] csc(real[] x);
	real[] sec(real[] x);
	real[] cot(real[] x);
	
	
	
	basic_trig: sdt
	{
		real[] sin(real[] x);
		real[] cos(real[] x);
		real[] tan(real[] x);
	}
}

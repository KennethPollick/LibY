natural[] normally_at_runtime()
{
	return parse_natural(dump_file("input.txt"));
}



main()
{
	/*
		abstract and concrete expressions in procedures
	*/
	natural[] c = concrete{ 2 * normally_at_runtime() };			//concrete expressions are evaluated at compiletime
	natural[] e = 3 * normally_at_runtime();				//(see a few lines down)
	natural[] r = abstract{ 4 * normally_at_runtime() };			//abstract expressions in procedures are evaluated at runtime
	
	/*
		expressions that aren't specified to be abstract or concrete
	*/
	//normal expressions still have one of these properties based on what the expression is and what the subexpressions are
	//the explicit use of the abstract and concrete hyperexpressions override this evaluation
	//these normal expressions will still be optimized as much as possible up to interface boundaries such as an OS open call on a file
}





/*
	at top level, expressions can only be evaluated at compiletime or init-time
*/
natural[] c = concrete{ 5 * normally_at_runtime() };			//(same as before)
natural[] e = 6 * normally_at_runtime();				//(same as before)
natural[] i = abstract{ 7 * normally_at_runtime() };			//abstract expressions at top level are evaluated at init-time


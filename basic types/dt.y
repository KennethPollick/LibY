/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-09-24
**********************************************************************/

dt : /* haha */
{
	right operator dt#0 unary_=(dt become a, dt#0 moved b);
	operator boole binary_=(immutable(dt) a, immutable(dt#0) b);

	ctor(dt#0 moved a);
	move(dt#0 moved a);

	operator dt#0 link unary_&()
	{
		/* the compiler has to implement this as the following would be an infinite loop */
		return &this;
	}
}



con-is-ass : dt { ctor(con-is-ass#0 become a){ this = a; } }
mov-is-ass : dt { move(mov-is-ass#0 become a){ this = a; } }
con-is-mov : dt { ctor(con-is-mov#0 become a){ this = move{a}; } }
ass-is-mov : dt { right operator ass-is-mov#0 unary_=(ass-is-mov become a, ass-is-mov#0 moved b) { a = move{b}; } }
mov-is-con : dt { move(mov-is-con#0 become a){ this = ctor(a); } }
ass-is-con : dt { right operator ass-is-con#0 unary_=(ass-is-con become a, ass-is-con#0 moved b) { a = ctor(b); } }
//have to think about initialization and these three: ctor, move, and assignment



ceremonial : (con-is-mov, ass-is-mov);
/*{
	ctor(ceremonial#0 moved a) { this = move{a}; }
	
	right operator ceremonial#0 unary_=(ceremonial become a, ceremonial#0 moved b) { a = move{b}; }
}*/


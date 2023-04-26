/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-04-25
**********************************************************************/

//verify interface is complete
//evaluate whether casts here can be avoided
immutable either: (dt, dt) sdt
{
	boole left;
	memory[max{SIZE{dt#0}, SIZE{dt#1}}] buf;

	ctor() { this = {T, {}}; }

	boole on_left() { return this.left; }

	dt#0 get_left() { return cast{this.buf, dt#0}; /* does this need to be a cast; can ctors understand a memory argument by default? */ }

	dt#1 get_right() { return cast{this.buf, dt#1}; }
}



//left and right will no longer be keywords, so this highlighting is wrong
(dt#0, dt#1) either left(dt l, dt r) { return {T, cast{l, memory}}; }
(dt#0, dt#1) either right(dt l, dt r) { return {F, cast{r, memory}}; }

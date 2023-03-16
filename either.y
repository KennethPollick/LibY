/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-03-16
**********************************************************************/

//verify interface is complete
either: (dt, dt) sdt
{
	boole left;
	memory[max{SIZE{dt#0}, SIZE{dt#1}}] buf;

	ctor() { *this = {T, {}}; }

	boole on_left() { return this.left; }

	dt#0 get_left() { return cast{this.buf, dt#0}; }

	dt#1 get_right() { return cast{this.buf, dt#1}; }
}



(dt#0, dt#1) either left(dt l, dt r) { return {T, cast{l, memory}}; }



(dt#0, dt#1) either right(dt l, dt r) { return {F, cast{r, memory}}; }

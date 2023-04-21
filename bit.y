/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-04-21
**********************************************************************/

bit_pointer: sdt
{
	flags pointer p;
	natural[1] place;

	ctor(dt pointer p, natural[1] place) { this = {cast(p, flags pointer), place % 8}; }

	boole exists() { return this.p ~= NULL; }

	become operator boole unary*() { return this.p[this.place]; }

	set() { this.p[this.place] = T; }

	reset() { this.p[this.place] = F; }
}



constant natural R_BIT_ARRAY_DEFAULT_LENGTH = 8;
r_bit_array: sdt
{
	flags pointer arr;	//TODO: fix ambiguity of types with default size abstraction
	natural len;

	ctor() { this = ctor(R_BIT_ARRAY_DEFAULT_LENGTH); }

	ctor(natural bytes)
	{
		this = {allocate{flags[bytes]}, bytes};
	}

	natural length() { return this.len; }
	natural capacity() { return size{*this.arr}; }

	become operator boole unary_[](natural b) { return this.arr[b]; }

	//TODO: finalize the full division hyperexpression keyword (rem) and probably make '&' for flags and boole
	bit_pointer pointer_to(natural b)
	{
		natural q;
		natural r = rem { q = b/8 };	//TODO: make list of hyperexpressions so shifts can be used here
		return bit_pointer{cast{&this.arr[q], flags pointer}, r}
	}

	//TODO: finish r_array and this
}



bit_arena[B]: sdt
{
	flags[B] store;
	natural next_free;

	ctor() { this.reset(); }
	reset() { this.next_free = 0; }

	bit_pointer alloc()
	{
		if (this.next_free < B*8)
		{
			natural q;
			natural r = rem { q = this.next_free/8 };
			bit_pointer ret = {(&this.store) + q, r};
			this.next_free++;
			return ret;
		}
		
		return bit_pointer{};
	}
}

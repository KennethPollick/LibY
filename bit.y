/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-10-16
**********************************************************************/

bit_pointer: sdt
{
	flags pointer p;
	flags mask;

	ctor(dt pointer p, natural[1] place) { *this = {cast(p, flags pointer), MASK(place)}; }

	boole is() { return boole(*this.p & mask); }

	set() { *this.p |= mask; }

	reset() { *this.p &= !mask; }
}



bit_array[B]: sdt
{
	flags[B] arr;

	boole index(natural b) { return boole(arr[b/8] & MASK(b%8)); }	//TODO: make a full division builtin (fulldiv/remdiv/eudiv) and probably '&' for flags and boole

	bit_pointer ref_index(natural b) { return bit_pointer{&arr[b/8], MASK(b%8)} }
}

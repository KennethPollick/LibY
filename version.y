/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

version[n]: sdt
{
	natural vector[n] p;
	
	static become operator natural unary_[](natural i) { return v[i]; }

	//TODO: fix inheritance of natural equality
	static become operator version[n] unary_=(version[n] v) { this.p = v.p; }
}

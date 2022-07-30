/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-07-30
**********************************************************************/

version[n]: sdt
{
	natural vector[n] p;
	
	math become operator natural unary[](natural i) { return v[i]; }

	math become operator version[n] unary=(version[n] v) { this.p = v.p; }
}

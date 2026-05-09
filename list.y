/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2026 Kenneth Pollick
DATE:		2026-05-09
**********************************************************************/

list: dt ndt
{
	append(dt element);
	static dt unary_[](natural index);
}

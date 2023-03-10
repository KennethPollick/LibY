/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

list: dt ndt
{
	append(dt element);
	static dt unary_[](natural index);
}

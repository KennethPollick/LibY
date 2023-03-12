/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-03-12
**********************************************************************/

//TODO: determine whether multicomposition is needed in the language
hash_table[n]: (dt, dt) ndt
{
	(natural << dt#1) hash_proc;
	dt#0 array[n] outputs;		//TODO:rename

	ctor((natural << dt#1) hash_proc) { this.hash_proc = hash_proc; }

	//TODO: decide collision handling method
	become operator dt#0 unary_[](dt#1 index)
	{
		return this.outputs[this.hash_proc(index) % n];
	}
}

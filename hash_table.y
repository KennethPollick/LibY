/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-04-25
**********************************************************************/

//DONE: determined whether multicomposition is needed in the language
hash_table[n]: (dt, dt) ndt
{
	constant (natural[] << dt#1) immutable pointer hash_proc;
	dt#0 array[n] outputs;		//TODO:rename

	//TODO: decide collision handling method
	//since the hash procedure is constant, this hash table might not need a ctor as a simple array or array of small list optimized linked lists wouldn't violate the definition
	ctor(constant (natural[] << dt#1) immutable pointer hash_proc) { this.hash_proc = hash_proc; }

	become operator dt#0 unary_[](dt#1 index)
	{
		return this.outputs[this.hash_proc(index) % n];
	}
}

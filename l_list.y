/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

node: dt sdt
{
	dt#0 data;
	dt#0 node pointer next;
}



//TODO: needs evaluation (syntax and capacity variable)
l_list: dt list
{
	dt#0 node pointer head;
	natural length;

	ctor()
	{
		*this = {NULL, 0};
	}

	ctor(natural starting_length)
	{
		*this = {NULL, starting_length};

		dt#0 node pointer pointer target = &this.head;
		loop (this.length - 1)
		{
			*target = allocate{dt#0 node{dt#0(), NULL}};
			target = &target.next;
		}
	}



	natural len()
	{
		return this.length;
	}



	prepend(dt#0 element)
	{
		this.head = allocate{dt#0 node{element, this.head}};
		this.length++;
	}

	append(dt#0 element)
	{
		this.length++;

		dt#0 node pointer new = allocate{dt#0 node{element, NULL}};

		dt#0 node pointer look = this.head;
		if (look ~= NULL)
		{
			while (look.next ~= NULL)
				look = look.next;
			look.next = new;
			return;
		}

		this.head = new;
	}

	insert(dt#0 element, natural index)
	{
		dt#0 node pointer look = this.head;

		loop (index - 1)
		{
			look = look.next;
		}

		look.next = allocate{dt#0 node{element, look.next}};

		this.length++;
	}



	static become operator dt#0 unary_[](natural index)
	{
		dt#0 node pointer look = this.head;

		loop (index)
		{
			look = look.next;
		}

		return look.data;
	}
}


node: dt sdt
{
	dt#0 data;
	dt#0 node pointer next;
}



l_list: dt list
{
	dt#0 node pointer head;
	natural length;

	ctor()
	{
		this.head = NULL;
		length = 0;
	}

	ctor(natural starting_length)
	{
		this.length = starting_length;
		this.head = NULL;

		dt#0 node pointer pointer target = &this.head;
		for (natural c = 0; c < this.length; c++)
		{
			*target = allocate(dt#0 node{dt#0(), NULL});
			target = &target.next;
		}
	}



	natural len()
	{
		return this.length;
	}



	prepend(dt#0 element)
	{
		this.head = allocate(dt#0 node{element, this.head});
		this.length++;
	}

	append(dt#0 element)
	{
		this.length++;

		dt#0 node pointer new = allocate(dt#0 node{element, NULL});

		dt#0 node pointer look = this.head;
		if (look)
		{
			while (look.next != NULL)
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

		look.next = allocate(dt#0 node{element, look.next});

		this.length++;
	}



	math dt#0 unary[](natural index)
	{
		dt#0 node pointer look = this.head;

		loop (index)
		{
			look = look.next;
		}

		become look.data;
	}
}


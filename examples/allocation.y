main()
{
	//runtime input
	natural[] len = parse_natural(dump_file("input.txt"));
	
	
	
	//local allocation
	constant integer pointer ptr_local = {1, 2, 3};				//raw local array
	integer array arr_local = {4, 5, 6};					//tabulated local array
	natural array[len] arr_stack = arr_of_naturals(len);			//tabulated local array of abstract size
	
	
	
	//heap allocation
	natural pointer ptr_heap = allocate[len]{natural[]};			//raw heap array
	natural array pointer arr_heap = allocate{natural[] array[len]};	//tabulated heap array
	
	for (natural c = 0; c < len; c++)
		arr_heap[c] = ptr_heap[c] = arr_stack[c];
	
	//heap deallocation
	free{ptr_heap};
	free{arr_heap};



	//custom allocator allocation (location depends on where the allocator object's memory is)
	natural array pointer arr_alloc = allocate{natural[] array[len], a};

	//custom allocator deallocation
	free{arr_alloc, a};
}

arena[512] a;


/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022-2023 Kenneth Pollick
DATE:		2023-03-10
**********************************************************************/

alias format f;

natural format_size(dt data)
{
	return size{data};
}

//TODO: perhaps split format into multiple procedures, one for smaller types that returns strings and one for bigger types that write into a given buffer

//TODO: actually swap to writing into str instead of returning strings
format(ascii array pointer str, natural start, dt data)
{
	if (is_type_of{data, natural})
	{
		ascii array[format_size(data)] ret;

		//find vector conversion or bcd instruction

		return ret;
	}
	else if (is_type_of{data, complex})
	{
		return format(data.a) + '+' + format(data.b) + 'i';
	}
	else if (is_type_of{data, split_complex})
	{
		return format(data.a) + '+' + format(data.b) + 'j';
	}
	else if (is_type_of{data, quaternion})
	{
		return format(data.a) + '+' + format(data.b) + 'i+' + format(data.c) + 'j+' + format(data.d) + 'k';
	}
	else if (is_type_of{data, octonion})
	{
		//TODO
	}
	else if (is_type_of{data, vector})
	{
		//place '<' in str
		
		natural i = 1;
		//abstract loop (the variable of abstract type gets placed top of the stack each time through the loop (stays the same address))
		for (natural c = 0; c < size{data}-1; c++)
		{
			ascii array temp = format(data[c]) + ',';
			//place temp in str
		}
		
		ascii array last = format(data[size{data}-1]);
		//place last+'>' in str
	}
}



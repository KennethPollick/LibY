/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2022 Kenneth Pollick
DATE:		2022-12-16
PURPOSE:	To define the Y standard library
**********************************************************************/

alias format f;

natural format_size(dt data);

asci array format(dt data)
{
	if (is_type_of{data, natural})
	{
		asci array[format_size(data)] ret;

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
		asci array[format_size(data)] ret;
		ret[0] = '<';
		
		natural i = 1;
		for (natural c = 0; c < sa{data}-1; c++) //abstract loop (the variable of abstract type that is within gets placed at the same location in memory each time through the loop)
		{
			asci array temp = format(data[c]) + ',';
			//place temp in ret
		}

		asci array l = format(data[sa{data}-1]);
		//place l in ret
		ret[i] = '>';
		return ret;
	}
}



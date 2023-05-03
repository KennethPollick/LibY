/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-05-03
**********************************************************************/

pigeon-holes[R]: dt ndt
{
	flags[R] there;
	dt#0 array[8*R] boxes;

	ctor(dt#0 maybe array[8*R] transform)
	{
		for (natural c = 0; c < 8*R; c++)
			if (this.there[c] = transform[c].exists)
				this.boxes[c] = *transform[c];
	}



	clear() { this.there.clear(); }

	dt#0 maybe array[8*R] transform()
	{
		dt#0 maybe array[8*R] ret;

		for (natural c = 0; c < 8*R; c++)
		{
			if (this.there[c])
				ret[c] = ctor(this.boxes[c]);
			else
				ret[c] = ctor();
		}

		return ret;
	}
}


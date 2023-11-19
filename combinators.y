/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023 Kenneth Pollick
DATE:		2023-10-25
**********************************************************************/

dt#0 X(dt x) { return x; }
dt K(dt x, dt y) { return x; }
dt Ki(dt x, dt y) { return y; }

constant(dt#2<<dt#0) S((dt<<(dt,dt)) f, (dt#1<<dt#0) g)
{
	constant capture(dt#2<<dt#0) ess = (x)
	{
		return f(x, g(x));
	};
	return ess;
}

(dt#1<<dt#2) B((dt<<dt) f, (dt#0<<dt) g) { return f<>g; }

constant(dt#2<<(dt#1, dt#0)) C((dt<<(dt,dt)) f)
{
	constant capture(dt#2<<(dt#1, dt#0)) see = (x, y)
	{
		return f(y, x);
	};
	return see;
}

constant(dt#1<<dt#0) W((dt<<(dt,dt#0)) f)
{
	constant capture(dt#1<<dt#0) dub = (x)
	{
		return f(x, x);
	};
	return dub;
}

constant(dt#2<<(dt#0, dt#3)) D((dt<<(dt,dt)) f, (dt#1<<dt) g)
{
	constant capture(dt#2<<(dt#0, dt#3)) dee = (x, y)
	{
		return f(x, g(y));
	};
	return dee;
}

constant(dt#1<<(dt#2, dt#3)) B1((dt<<dt) f, (dt#0<<(dt,dt)) g) { return f<>g; }

constant(dt#1<<(dt#2, dt#2)) PSI((dt<<(dt,dt#0)) f, (dt#0<<dt) g)
{
	constant capture(dt#1<<(dt#2, dt#2)) sea = (x, y)
	{
		return f(g(x), g(y));
	};
	return sea;
}

constant(dt#2<<dt#3) PHI((dt<<(dt,dt)) f, (dt#0<<dt) g, (dt#1<<dt#3) h)
{
	constant capture(dt#2<<dt#3) gold = (x)
	{
		return f(g(x), h(x));
	};
	return gold;
}





constant(<<boole) cond(constant procedure t, constant procedure f)
{
	constant capture(<<boole) d = (b)
	{
		ternary{b, t, f};
	};
	return d;
}


/**********************************************************************
AUTHOR:		Kenneth Pollick <me@kennethpollick.com>
COPYRIGHT:	2023-2026 Kenneth Pollick
DATE:		2026-05-09
**********************************************************************/

/**********************************************************************
dt#0 X(dt x) { return x; }
dt K(dt x, dt y) { return x; }
dt Ki(dt x, dt y) { return y; }

//NOTE, these syntaxes will be replaced once the syntaxes are solidified for these semantics (specifically procedure composition and assigning local procedures)
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





constant(<<boole) cond((<<) t, (<<) f)
{
	constant capture(<<boole) d = (b)
	{
		if (b) {t()} else {f()};
	};
	return d;
}



immutable(dt#0) convert-mutability(immutable(dt) default, (<<(dt#0 link, tuple)) proc, tuple#0 args)
{
	dt#0 ret = default;
	proc(&ret, args);
	return ret;
}
**********************************************************************/



algorithm X
[
	(type) t
	return (t)
]
(
	(t) x
)
{
	return x
}



algorithm K
[
	(type) t
	return (t)
]
(
	(t) x
	(t) y
)
{
	return x
}



algorithm Ki
[
	(type) t
	return (t)
]
(
	(t) x
	(t) y
)
{
	return y
}



algorithm ess
[
	(type) input
	(type) output
	(type) intermediary
	return (output)
]
(
	(input) x
	(output << (input, intermediary)) f
	(intermediary << input) g
)
{
	return f(x, g(x))
}

algorithm S
[
	(type) input
	(type) output
	(type) intermediary
	return (output << input)
]
(
	(output << (input, intermediary)) f
	(intermediary << input) g
)
{
	return ess(-, f, g)
}



algorithm B
[
	(type) i
	(type) m
	(type) o
	return (o << i)
]
(
	(o << m) f
	(m << i) g
)
{
	return f<>g
}



algorithm see
[
	(type) input
	(type) output
	return (output)
]
(
	(output << (input, input)) f
	(input) x
	(input) y
)
{
	return f(y, x)
}

algorithm C
[
	(type) input
	(type) output
	return (output << (input, input))
]
(
	(output << (input, input)) f
)
{
	return see(f, -, -)
}



algorithm dub
[
	(type) input
	(type) output
	return (output)
]
(
	(input) x
	(output << (input, input)) f
)
{
	return f(x, x)
}

algorithm W
[
	(type) input
	(type) output
	return (output << input)
]
(
	(output << (input, input)) f
)
{
	return dub(-, f)
}



algorithm dee
[
	(type) left-input
	(type) right-input
	(type) intermediary
	(type) output
	return (output)
]
(
	(output << (left-input, intermediary)) f
	(intermediary << right-input) g
	(left-input) x
	(right-input) y
)
{
	return f(x, g(y))
}

algorithm D
[
	(type) left-input
	(type) right-input
	(type) intermediary
	(type) output
	return (output << input)
]
(
	(output << (left-input, intermediary)) f
	(intermediary << right-input) g
)
{
	return dee(f, g, -, -)
}



algorithm B1
[
	(type) i
	(type) m
	(type) o
	return (o << (i, i))
]
(
	(o << m) f
	(m << (i, i)) g
)
{
	return f<>g
}



algorithm sea
[
	(type) input
	(type) intermediary
	(type) output
	return (output)
]
(
	(output << (intermediary, intermediary)) f
	(intermediary << input) g
	(input) x
	(input) y
)
{
	return f(g(x), g(y))
}

algorithm PSI
[
	(type) input
	(type) intermediary
	(type) output
	return (output << (input, input))
]
(
	(output << (intermediary, intermediary)) f
	(intermediary << input) g
)
{
	return sea(f, g, -, -)
}



algorithm gold
[
	(type) input
	(type) left-intermediary
	(type) right-intermediary
	(type) output
	return (output)
]
(
	(output << (left-intermediary, right-intermediary)) f
	(left-intermediary << input) g
	(right-intermediary << input) h
	(input) x
)
{
	return f(g(x), h(x))
}

algorithm PHI
[
	(type) input
	(type) left-intermediary
	(type) right-intermediary
	(type) output
	return (output << input)
]
(
	(output << (left-intermediary, right-intermediary)) f
	(left-intermediary << input) g
	(right-intermediary << input) h
)
{
	return gold(f, g, h, -)
}




algorithm d
[
	return (singular)
]
(
	(classical-logic) p
	(singular << singular) t
	(singular << singular) f
)
{
	return p.if(t, f)
}

algorithm cond
[
	return (singular << classical-logic)
]
(
	(singular << singular) t
	(singular << singular) f
)
{
	return classical-logic:if(-, t, f)
}



algorithm convert-mutability
[
	(type) input
	(type) immutable-input = immutable(input)
	(type) arguments
	return (immutable-input)
]
(
	(immutable-input) default
	(singular << (input alias, arguments)) proc
	(arguments) args
)
{
	(input) ret = default
	proc(&ret, args)
	return ret
}


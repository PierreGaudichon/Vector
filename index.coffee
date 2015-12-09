class Vector


	@parseArgs: (arr) ->
		args = Array.prototype.slice.call arr
		[x, y] = args
		if x.x? and x.y?
			[Vector.carthesian x].concat args[1..]
		else
			[Vector.carthesian {x, y}].concat args[2..]


	@polar: ({r, t}) ->
		if r is 0
			return Vector.zero()
		new Vector
			x: r * Math.cos t
			y: r * Math.sin t
			r: r
			t: t


	@carthesian: ({x, y}) ->
		if x is 0 and y is 0
			return Vector.zero()
		t = Math.atan y/x # Math.atan(Infinity) == Math.PI/2
		t += Math.PI if x < 0
		new Vector
			x: x
			y: y
			r: Math.sqrt x**2 + y**2
			t: t


	@carth: (x, y) -> Vector.carthesian {x, y}


	@json: (j) ->
		[x, y, r, t] = j[1..-2].split(", ").map (c) -> parseFloat c[3..]
		new Vector {x, y, r, t}


	@zero: -> new Vector


	@unit: (t) -> Vector.polar r: 1, t: t


	@random: -> Vector.carthesian x: Math.random(), y: Math.random()


	@randomCircle: -> Vector.polar
		r: Math.sqrt Math.random()
		t: 2*Math.PI*Math.random()


	@fromTwo: ({x, y}) -> Vector.carthesian {x, y}



	@equals: (a, b) ->
		(a.x is b.x) and (a.y is b.y)


	@add: (a, b) ->
		Vector.carthesian
			x: a.x + b.x
			y: a.y + b.y


	@mult: (k, a) ->
		Vector.carthesian
			x: k * a.x
			y: k * a.y


	@prod: (a, b) ->
		Vector.carthesian
			x: a.x * b.x
			y: a.y * b.y


	@divide: (a, b) ->
		Vector.carthesian
			x: a.x / b.x
			y: a.y / b.y


	@minus: (a) ->
		Vector.carthesian
			x: -a.x
			y: -a.y


	@soustr: (a, b) ->
		Vector.carthesian
			x: a.x - b.x
			y: a.y - b.y


	@rotate: (t, a) ->
		Vector.polar
			r: a.r
			t: t + a.t


	@toUnit: (a) -> Vector.unit a.t


	@int: (a) ->
		Vector.carthesian
			x: Math.floor a.x
			y: Math.floor a.y


	@scalar: (a, b) ->
		a.x*b.x + a.y*b.y


	# if `a` is a point and `B` a rectangle between (0, 0) and `b`
	# then a is put inside B
	@inside: (a, b) ->
		Vector.carthesian
			x: if (0 < a.x < b.x) then a.x else if a.x < 0 then 0 else b.x
			y: if (0 < a.y < b.y) then a.y else if a.y < 0 then 0 else b.y


	# The same as `inside` but returns a boolean.
	@isInside: (a, b) ->
		(a.x < b.x) and (a.y < b.y)


	@isZero: (a) ->
		a.r is 0


	# Creates a Two.js vector, for compatibility.
	@toTwo: ({x, y}) -> new Two.Vector x, y





	constructor: ({@r, @t, @x, @y} = {r: 0, t: 0, x: 0, y: 0}) ->

	equals: (b) -> Vector.equals @, b
	add: (b) -> Vector.add @, b
	mult: (k) -> Vector.mult k, @
	prod: (b) -> Vector.prod @, b
	divide: (b) -> Vector.divide @, b
	minus: -> Vector.minus @
	soustr: (b) -> Vector.soustr @, b
	rotate: (t) -> Vector.rotate t, @
	toUnit: -> Vector.toUnit @
	int: -> Vector.int @
	scalar: (b) -> Vector.scalar @, b
	inside: (b) -> Vector.inside @, b
	isInside: (b) -> Vector.isInside @, b
	isZero: -> Vector.isZero @
	toTwo: -> Vector.toTwo @

	toJSON: -> "(x= #{@x}, y= #{@y}, r= #{@r}, t= #{@t})"



if window? then window.Vector = Vector
if module? and module.exports? then module.exports = Vector

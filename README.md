Vector.coffee
=============

API
---

### Constructors

```coffee
vector = Vector.carthesian x: Number, y: Number
vector = Vector.carth Number, Number
vector = Vector.polar r: Number, t: Number
vector = Vector.zero()
vector = Vector.unit Number
vector = Vector.random()
vector = Vector.json String
vector = Vector.fromTwo Two.js#vector
```

### Attributs, read only

```coffee
{x, y, r, t} = vector
```

### Methods

```coffee
vector.equals: (Vector) -> Vector
vector.add: (Vector) -> Vector
vector.mult: (Number) -> Vector
vector.prod: (Vector) -> Vector
vector.divide: (Vector) -> Vector
vector.minus: -> Vector
vector.soustr: (Vector) -> Vector
vector.rotate: (Number) -> Vector
vector.toUnit: -> Vector
vector.int: -> Vector
vector.scalar: (Vector) -> Number
vector.inside: (Vector) -> Vector
vector.isInside: (Vector) -> Boolean
vector.isZero: -> Boolean
vector.toTwo: -> Two.js#vector
vector.toJSON: -> String
```

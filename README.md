Vector.coffee
=============

API
---

```coffee
vector = Vector.carthesian x: Number, y: Number
vector = Vector.polar r: Number, t: Number

vector = vector.equals: (Vector) -> Vector
vector = vector.add: (Vector) -> Vector
vector = vector.mult: (Number) -> Vector
vector = vector.prod: (Vector) -> Vector
vector = vector.divide: (Vector) -> Vector
vector = vector.minus: -> Vector
vector = vector.soustr: (Vector) -> Vector
vector = vector.rotate: (Number) -> Vector
vector = vector.toUnit: -> Vector
vector = vector.int: -> Vector
vector = vector.scalar: (Vector) -> Number
vector = vector.inside: (Vector) -> Vector
vector = vector.isInside: (Vector) -> Boolean
vector = vector.isZero: -> Boolean
vector = vector.toTwo: -> Two.js#vector
```

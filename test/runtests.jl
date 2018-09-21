using Test
using Polynomial

z =  Poly([0])
p = Poly([1,2,3])

@test p + z == p
@test p + (-p) == z
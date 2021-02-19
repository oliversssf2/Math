using Pkg
Pkg.add("QuadGK")
using QuadGK

f(x,y,z) = (x^2 + 2y)*z

quadgk()

##
x = ["a", "b", "c"]
for (a,b) in enumerate(x)
    println(a,b)
end
##

##
a = [1,2,3,4,5]
b = a.^2
##
# println("hi")
c = [1 2 3 4 5 6 7 8 9]
println(c)
d = [1,2,3,4,5,6,7,8,9]
println(d)
# d = [1,2,3,4,5,6,7,8,9]
##
k = reshape(1:9,3,3)
print(k[1:9])
##
mutable struct MyData2{T<:Real}
	x::T
	x2::T
	y::T
	z::Float64
	function MyData2{T}(x::T, y::T) where T<:Real
		x2=x^2
		z = sin(x2+y)
		new(x, x2, y, z)
	end
end

k = MyData2{Float64}(3.4,5.5)
##
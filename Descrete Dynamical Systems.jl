using Pkg
Pkg.add("LinearAlgebra")
Pkg.add("Plots")
using Plots

##Problem1
#two eigvectors
v1 = [1,1]
v2 = [-1,1]

x_0 = [9,1]

D = [3 0;
    0 1//3]

# diagonalization
P = [v1 v2] 

x_0_coord = P\x_0
##

##Promblem5
A = [.4 .3;
    -.325 1.2]

eig = eigvals(A)
eigv = eigvecs(A)
display(eigv[:,2])

##

##Problem9
A = [1.7 -.3;
    -1.2 .8]
eig = eigen(A)
display(eig)
##
ranvec = rand(-30:30,3,30)
A = [0 0 .33;
    .18 0 0;
    0 .71 .94]

function step!(vec,A)
    vec = A*vec
end

plt = plot3d(
    30,
    xlim = (-30,30),
    ylim = (-30,30)
)

#for i = 1:100
for j=1:100
    step!(ranvec[:,1],A)
    push!(plt, ranvec[1,1], ranvec[2,1])
    plot3d!()
end 
#end

##
using Plots
# define the Lorenz attractor
Base.@kwdef mutable struct Lorenz
    dt::Float64 = 0.02
    σ::Float64 = 10
    ρ::Float64 = 28
    β::Float64 = 8/3
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1
end

function step!(l::Lorenz)
    dx = l.σ * (l.y - l.x);         l.x += l.dt * dx
    dy = l.x * (l.ρ - l.z) - l.y;   l.y += l.dt * dy
    dz = l.x * l.y - l.β * l.z;     l.z += l.dt * dz
end

attractor = Lorenz()


# initialize a 3D plot with 1 empty series
plt = plot3d(
    1,
    xlim = (-30, 30),
    ylim = (-30, 30),
    zlim = (0, 60),
    title = "Lorenz Attractor",
    marker = 2,
)

# build an animated gif by pushing new points to the plot, saving every 10th frame
@gif for i=1:1500
    step!(attractor)
    push!(plt, attractor.x, attractor.y, attractor.z)
end every 10
##
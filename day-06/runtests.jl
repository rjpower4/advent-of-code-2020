using Test
using StaticArrays
include("day-06.jl")

@testset "Part 1" begin
    @test Day6.solve() == (p1=6686, p2=3476)
end

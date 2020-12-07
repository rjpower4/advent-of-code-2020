using Test
using StaticArrays
include("day-07.jl")

@testset "Day 7 Tests" begin
    @test Day7.solve("test-input.txt") == 4
end

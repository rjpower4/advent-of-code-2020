using Test
using StaticArrays
include("day-06.jl")

@testset "Part 1" begin
    set1 = ("abc",)
    set2 = ("a", "b", "c")
    set3 = ("ab", "ac")
    set4 = ("a", "a", "a", "a")
    set5 = ("b")

    mv = MVector{26, Int}(undef)
    mv .= 0

    mv[1] = 1; mv[2] = 1; mv[3] = 1;
    @test Day6.get_set_count(set1) == mv

    mv[1] = 1; mv[2] = 1; mv[3] = 1
    @test Day6.get_set_count(set2) == mv

    mv[1] = 2; mv[2] = 1; mv[3] = 1
    @test Day6.get_set_count(set3) == mv

    mv[1] = 4; mv[2] = 0; mv[3] = 0
    @test Day6.get_set_count(set4) == mv

    mv[1] = 0; mv[2] = 1; mv[3] = 0
    @test Day6.get_set_count(set5) == mv

    @test Day6.solve() == (p1=6686, p2=3476)
end

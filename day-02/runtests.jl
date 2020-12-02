using Test

include("day-02.jl")
using .Day2

@testset "Day 1 Tests" begin
    @testset "Part 1 Tests" begin
        @test aoc_solve(Day2.PART_1_TEST_INPUT_FILE) == (2, 1)
    end
end

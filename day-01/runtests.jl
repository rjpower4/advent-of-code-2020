using Test

include("./day-01.jl")

@testset "Day 1 Tests" begin

    @testset "Part 1 Tests" begin
        @test Day1.solve_part1(Day1.PART_1_TEST_INPUT_FILE) == 514579
    end
    
    @testset "Part 2 Tests" begin
        @test Day1.solve_part2(Day1.PART_1_TEST_INPUT_FILE) == 241861950
    end
    
end

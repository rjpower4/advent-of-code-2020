using DrWatson
@quickactivate "Advent of Code 2020"

using Test

@testset "Day 1" begin
    include(srcdir("day-01.jl"))
    @test Day1.solve_part1(datadir("test", "day-01.txt")) == 514579
    @test Day1.solve_part2(datadir("test", "day-01.txt")) == 241861950
end

@testset "Day 2" begin
    include(srcdir("day-02.jl"))
    @test Day2.solve(datadir("test", "day-02.txt")) == (2, 1)
end

@testset "Day 3" begin
    include(srcdir("day-03.jl"))
end

@testset "Day 4" begin
    include(srcdir("day-04.jl"))
end

@testset "Day 5" begin
    include(srcdir("day-05.jl"))
    @test Day5.solve(datadir("input", "day-05.txt")) == (p1=908, p2=619)
end

@testset "Day 6" begin
    include(srcdir("day-06.jl"))
    @test Day6.solve(datadir("input", "day-06.txt")) == (p1=6686, p2=3476)
end

@testset "Day 7" begin
    include(srcdir("day-07.jl"))
    @test Day7.solve(datadir("test", "day-07-a.txt")) == (p1=4, p2=32)
end

using Test

include("day-05.jl")

@testset "Part 1" begin
    @test Day5.solve() == (p1=908, p2=619)
end

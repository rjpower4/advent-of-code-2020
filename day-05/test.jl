using Test

include("day-05.jl")

@testset "Part 1" begin
    @test Day5.decode_seat("FBFBBFFRLR") == (44, 5)
    @test Day5.seat_id((44, 5)) == 357
    @test Day5.seat_id("BFFFBBFRRR") == 567
    @test Day5.seat_id("FFFBBBFRRR") == 119
    @test Day5.seat_id("BBFFBBFRLL") == 820
    @test Day5.decode_seat("BFFFBBFRRR") == (70, 7)
    @test Day5.decode_seat("FFFBBBFRRR") == (14, 7)
    @test Day5.decode_seat("BBFFBBFRLL") == (102, 4)
end

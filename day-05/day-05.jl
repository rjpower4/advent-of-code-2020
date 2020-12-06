module Day5

const c2nd = Dict('F'=>0, 'R'=>1, 'B'=>1, 'L'=>0)

char_to_num(c::Char) = c2nd[c]

function seat_id(s::String) 
    v = 0
    n = length(s)
    for (i, c) in enumerate(s)
        v += 2^(n-i) * char_to_num(c)
    end
    v
end

function solve(ifile="input.txt")
    ids = map(seat_id, readlines(ifile))
    sort!(ids)
    p2_i = findfirst(2:length(ids)) do i
        ids[i] - ids[i-1] == 2
    end + 1
    (p1=maximum(ids), p2=ids[p2_i]-1)
end

end

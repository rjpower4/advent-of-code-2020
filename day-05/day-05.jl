module Day5

function encode_string(s, lchar, hchar)
    function f(c)
        if c == lchar
            -1
        elseif c == hchar
            1
        else
            error("Unknown character: $c")
        end
    end
    [f(c) for c in s]
end


function binary_narrow(x)
    low = 0
    high = 2^(length(x)) - 1
    for i in 1:length(x) - 1
        if x[i] == -1
            high = div((high + low - 1), 2)
        else
            low = div((high + low + 1), 2)
        end
    end
    x[end] == 1 ? high : low
end

function decode_seat(s)
    row = encode_string(s[1:7], 'F', 'B') |> binary_narrow
    col = encode_string(s[8:end], 'L', 'R') |> binary_narrow
    (row, col)
end

seat_id(t::Tuple) = t[1] * 8 + t[2]
seat_id(s::String) = decode_seat(s) |> seat_id

function solve(ifile="input.txt")
    ids = map(readlines(ifile)) do l
        seat_id(l)
    end
    sort!(ids)
    p2_i = findfirst(2:length(ids)) do i
        ids[i] - ids[i-1] == 2
    end + 1
    (p1=maximum(ids), p2=ids[p2_i]-1)
end

end

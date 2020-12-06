module Day6

using StaticArrays
const INPUT_FILE="input.txt"

"""
    char_to_index(c)

Turn the character to an index from 1 to 26
"""
char_to_index(c) = Int(c) - Int('a') + 1  

"""
    get_set_count(lines)

Tally the repetitions of characters in the lines (as 26 element array)
"""
function get_set_count(lines)
    s = MVector{26, Int}(undef)
    s .= 0
    for l in lines
        for c in l
            s[char_to_index(c)] += 1
        end
    end
    s
end

function solve(ifile=INPUT_FILE)
    data = read(ifile) |> String |> x -> split(x, "\n\n")
    any_count = 0
    all_count = 0
    for group in data
        split_group = split(group, "\n")
        n = length(split_group)
        sc = get_set_count(split_group)
        any_count += count(x -> x != 0, sc)
        all_count += count(x -> x == n, sc)
    end
    (p1=any_count, p2=all_count)
end

end

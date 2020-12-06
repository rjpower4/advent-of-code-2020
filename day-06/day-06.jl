module Day6

const INPUT_FILE="input.txt"

function solve(ifile=INPUT_FILE)
    families = read(ifile, String) |> x-> split(x, "\n\n")
    part_1 = zeros(Int, length(families))
    part_2 = zeros(Int, length(families))
    for (i, f) in enumerate(families)
        k = split(f, '\n')
        part_1[i] = length(mapreduce(Set, union, k))
        part_2[i] = length(mapreduce(Set, intersect, k))
    end
    (p1=sum(part_1), p2=sum(part_2))
end

end

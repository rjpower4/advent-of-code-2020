module Day6

function solve(ifile=INPUT_FILE)
    families = read(ifile, String) |> x-> split(x, "\n\n")
    part_1 = 0
    part_2 = 0
    for (i, f) in enumerate(families)
        sets = split(f, '\n') |> x -> map(Set, x)
        part_1 += length(reduce(union, sets))
        part_2 += length(reduce(intersect, sets))
    end
    (p1=part_1, p2=part_2)
end

end

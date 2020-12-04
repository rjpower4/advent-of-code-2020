module Day3

const TEST_INPUT_FILE = "test_input.txt"
const INPUT_FILE = "input.txt"

const EMPTY_SPACE = 0
const TREE        = 1

struct PatternedMap
    m::Matrix{Int}
    nrows::Int
    ncols::Int
end

struct Slope
    di::Int
    dj::Int
end


function PatternedMap(filename)
    lines = readlines(filename)
    m = zeros(Int, length(lines), length(lines[1]))
    for (i, l) in enumerate(lines)
        for (j, c) in enumerate(l)
            m[i, j] = c == '#' ? 1 : 0
        end
    end
    PatternedMap(m, size(m, 1), size(m, 2))
end

function Base.getindex(pm::PatternedMap, i, j)
    ncols = pm.ncols
    nrows = pm.nrows

    if i > nrows
        -1
    else
        m = mod(j, ncols)
        c = m == 0 ? ncols : m
        pm.m[i, c]
    end
end

function walk(pm::PatternedMap, slope::Slope, x0=1, y0=1)
    i = x0
    j = y0
    di = slope.di
    dj = slope.dj
    count = pm[i, j]

    while true
        i += di
        j += dj
        new_val = pm[i, j]

        if new_val == -1
            break
        else
            count += new_val
        end
    end

    count
end

function solve(ifile=INPUT_FILE)
    pm = PatternedMap(ifile)
    slopes = (
        Slope(1, 1),
        Slope(1, 3),
        Slope(1, 5),
        Slope(1, 7),
        Slope(2, 1)
    )

    ntrees = map(s -> walk(pm, s), slopes)
    p1_sol = ntrees[2]
    p2_sol = reduce(*, ntrees)
    println("$ntrees")

    println("P1 Solution: $p1_sol")
    println("P2 Solution: $p2_sol")
end
end

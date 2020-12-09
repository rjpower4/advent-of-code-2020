module Day2

export PART_1_INPUT_FILE
export aoc_solve

"""
    LineData

Struct for storing the data associated with a line -- for convenience.
"""
struct LineData
    a::Int
    b::Int
    c::Char
    s::String
end

"""
    parseline(line)

Split the line up returning a `LineData`

Note, `a` and `b` are Ints, `c` is a char, and `s` a string.
"""
function parseline(line)
    a, b, c, s= split(line, (' ', '-'), keepempty=false, limit=4)
    LineData(
        parse(Int, a),
        parse(Int, b),
        c[1],
        s
    )
end

"""
    PasswordPolicy

Base type for the different password validation methods.
"""
abstract type PasswordPolicy end

"""
    CountPolicy

Policy for part 1 validation method.

Determines if the number of character occurances is between the limits, `a` and `b`.
"""
struct CountPolicy <: PasswordPolicy end

"""
    PosisitionPolicy

Policy for part 2 validation method.

Determines if only 1 of the locations `a` and `b` containst the char.
"""
struct PositionPolicy <: PasswordPolicy end

"""
    isvalid(::CountPolicy, ::LineData)

Check validity of line.
"""
function isvalid(cp::CountPolicy, ld::LineData)
    cc = count(x -> x == ld.c, ld.s)
    ld.a <= cc <= ld.b
end

"""
    isvalid(::PositionPolicy, ::LineData)

Check validity of line.
"""
function isvalid(pp::PositionPolicy, ld::LineData)
    v1 = ld.s[ld.a] == ld.c
    v2 = ld.s[ld.b] == ld.c
    xor(v1, v2)
end

"""
    solve(ifile)

Solve day 2.
"""
function solve(ifile)
    # Keep track of valid count
    cp_count = 0
    pp_count = 0

    # Iterate through lines evaluating validity for each of the different
    # validation methods
    for line in eachline(ifile)
        ld = parseline(line)

        cp = isvalid(CountPolicy(), ld)
        pp = isvalid(PositionPolicy(), ld)

        if cp
            cp_count += 1
        end
        if pp
            pp_count += 1
        end
    end

    (cp_count, pp_count)
end

end

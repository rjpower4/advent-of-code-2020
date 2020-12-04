module Day4

# 213, 147

const INPUT_FILE = "input.txt"

const REQUIRED_ITEMS = (
    :byr,
    :iyr,
    :eyr,
    :hgt,
    :hcl,
    :ecl,
    :pid,
)

abstract type HeightUnit end
struct CM <: HeightUnit end
struct IN <: HeightUnit end

ishex(c) = isdigit(c) || c in "abcdef"
function isnumber(s, min, max)
    v = tryparse(Int, s)
    !isnothing(v) && min <= v <= max
end

valid_year(s, min, max) = length(s) == 4 && isnumber(s, min, max)
valid_height(v::Int, ::CM) = 150 <= v <= 193
valid_height(v::Int, ::IN) = 59 <= v <= 76
function valid_height(hgt)
    v = tryparse(Int, SubString(hgt, 1, length(hgt)-2))
    if hgt[end-1] == 'c' && hgt[end] == 'm'
        valid_height(v, CM())
    elseif hgt[end-1] == 'i' && hgt[end] == 'n'
        valid_height(v, IN())
    else
        false
    end
end
valid_hair_color(s) = length(s) == 7 && s[1] == '#' && all(ishex, SubString(s, 2, 7))
valid_pid(s) = length(s) == 9 && all(isdigit, s)
valid_eye_color(s) = s in ("amb", "blu", "brn", "gry", "grn", "hzl", "oth")

validate_birth_year(d) = valid_year(d[:byr], 1920, 2002)
validate_issue_year(d) = valid_year(d[:iyr], 2010, 2020)
validate_expir_year(d) = valid_year(d[:eyr], 2020, 2030)
validate_height(d)     = valid_height(d[:hgt])
validate_hair_color(d) = valid_hair_color(d[:hcl])
validate_eye_color(d)  = valid_eye_color(d[:ecl])
validate_pid(d)        = valid_pid(d[:pid])
validate_has_fields(d) = all(map(k -> haskey(d, k), REQUIRED_ITEMS))

const CHECKS = (
    validate_birth_year,
    validate_issue_year,
    validate_expir_year,
    validate_height,
    validate_hair_color,
    validate_eye_color,
    validate_pid,
)

validate(d) = all(x -> x(d), CHECKS)

function read_file_into_dicts(ifile)
    dicts = map(read(ifile) |> String |> x -> split(strip(x), "\n\n")) do l
        Dict{Symbol, String}(
            map(split(l, [' ', '\n'])) do k
                v = split(k, ":")
                Symbol(v[1])=>String(v[2])
            end
        )
    end
end

solve(ifile=INCLUDE) = _solve(read_file_into_dicts(ifile))

function _solve(dicts)
    prob1_sol = 0
    prob2_sol = 0
    for d in dicts
        if validate_has_fields(d)
            prob1_sol += 1
            if validate(d)
                prob2_sol += 1
            end
        end
    end
    (p1=prob1_sol, p2=prob2_sol)
end
end

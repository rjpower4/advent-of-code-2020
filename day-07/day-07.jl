module Day7

const INPUT_FILE="input.txt"

struct BagRule
    base_color::String
    fill_colors::Vector{String}
    fill_counts::Vector{Int}
end

function Base.in(color::String, br::BagRule, rules::Dict{String, BagRule})
    if br.base_color == color
        false
    elseif color in br.fill_colors
        true
    elseif any(x -> in(color, rules[x], rules), br.fill_colors)
        true
    else
        false
    end              
end

function count_sub_bags(color::String, rules)
    r = rules[color]
    count = 0
    for (i, fc) in enumerate(r.fill_colors)
        count += r.fill_counts[i] + r.fill_counts[i] * count_sub_bags(fc, rules)
    end
    count
end


function parse_rule(s)
    sarr = split(s, " ")
    base_color = "$(sarr[1]) $(sarr[2])"
    fill_colors = Vector{String}()
    fill_counts = Vector{Int}()
    if "no" in sarr
        base_color, contents
    else
        inds = findall(x -> isdigit(x[1]), sarr)
        for i in inds
            push!(fill_counts, parse(Int, sarr[i]))
            push!(fill_colors, "$(sarr[i+1]) $(sarr[i+2])")
        end
    end
    BagRule(
        base_color,
        fill_colors,
        fill_counts
    )
end

function solve(ifile=INPUT_FILE)
    rules = Dict{String, BagRule}()
    for line in eachline(ifile)
        r = parse_rule(line)
        rules[r.base_color] = r
    end
    p1 = count(x -> in("shiny gold", x[2], rules), rules)
    p2 = count_sub_bags("shiny gold", rules)
    (p1=p1, p2=p2)
end

end

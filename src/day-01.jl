module Day1

"""
    solve_part1([ifile])

Solve part 1.

This solution is accomplished by storing the value of 2020-k for every k visited in the array.
Therefore, a simple lookup on a new number to see whether that number is in the dictionary
finds the solution. This gives the solution in O(n) time with O(n) space.
"""
function solve_part1(ifile)
    d = Dict{Int, Int}()
    for num_s in eachline(abspath(ifile))
        i = parse(Int, num_s)
        if haskey(d, i)
            return d[i]
        else
            k = 2020 - i
            d[k] = k * i
        end
    end
    return -1
end

"""
    solve_part1([ifile])

Solve part 1.

This is the solution to part 2.
It is solved by leveraging the double pointer algorithm for a sorted list as we walk up
the list. Therefore, it is O(n^2) for time and O(1) for space.
"""
function solve_part2(ifile)
    nums = map(eachline(abspath(ifile))) do num_s
        i = parse(Int, num_s)
    end
    sort!(nums)  # Quicksort O(n^2) worst case, O(n log(n)) average

    for i = 1:length(nums) # Outer loop O(n)
        left = i + 1
        right = length(nums)
        ni = nums[i]
        while left < right  # Inner loop O(n)
            nl = nums[left]
            nr = nums[right]
            s = ni + nl + nr 
            if s == 2020 
                return ni * nl * nr
            elseif s < 2020
                left += 1
            else
                right -= 1
            end
        end
    end
end

end

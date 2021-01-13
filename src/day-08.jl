module Day8

const NOP = 0
const ACC = 1
const JMP = 2

const ILOOP = 3
const SUCCESS = 4
const BADEXIT = 5

struct State
    index::Int
    acc::Int
end

struct Instruction
    type::Int
    val::Int
end

function operate(ins::Instruction, s::State)
    if ins.type == NOP
        State(s.index+1, s.acc)
    elseif ins.type == ACC
        State(s.index+1, s.acc + ins.val)
    else
        State(s.index + ins.val, s.acc)
    end
end

function parse_line(l)
    ins, v = split(l)
    if ins[1] == 'n'
        Instruction(NOP, 0)
    elseif ins[1] == 'a'
        Instruction(ACC, parse(Int, v))
    else
        Instruction(JMP, parse(Int, v))
    end
end

struct InstructionSet
    ins::Vector{Instruction}
end

function find_val_at_repeat(iset::InstructionSet)
    visited = Set{Int}(1)
    state = State(1, 0)
    while true
        state = operate(iset.ins[state.index], state)
        if state.index in visited 
            return (ILOOP, state.acc)
        elseif state.index == length(iset.ins) + 1
            return (SUCCESS, state.acc)
        elseif state.index > length(iset.ins) + 1
            return (BADEXIT, state.acc)
        else
            push!(visited, state.index)
        end
    end
end

function solve(ifile)
    iset = parse_line.(eachline(ifile)) |> InstructionSet
    find_val_at_repeat(iset)
end

end

local Markov = { }

function Markov.encode(str, precision)

    local buffer = { }
    local length = string.len(str)
    
    for i = 1, length, precision do
        table.insert(buffer, string.sub(str, i, i + precision - 1))
    end

    return buffer

end

function Markov.feed(chain, data)

    local length = #data
    local prefix = 0
    local suffix = nil

    for i = 1, length do

        suffix = data[i]

        if not chain [prefix] then
            chain [prefix] = { }
        end

        if not chain [prefix] [suffix] then
            chain [prefix] [suffix] = 0
        end
        
        chain [prefix] [suffix] = chain [prefix] [suffix] + 1
        
        prefix = suffix

    end

end

function Markov.pick(set)

    local total =  0

    for _, weight in pairs(set) do
        total = total + weight
    end

    local random = math.random(total)

    total = 0

    for item, weight in pairs(set) do

        total = total + weight

        if random <= total then
            return item
        end

    end

end

function Markov.generate(chain, max)

    local buffer = { }
    local step   =  1

    local prefix = 0
    local midman = chain[prefix]
    local suffix = midman and Markov.pick(midman) or nil

    while step <= max and suffix do

        buffer[step] = suffix
        step = step + 1

        prefix = suffix
        midman = chain[prefix]
        suffix = midman and Markov.pick(midman) or nil

    end

    return table.concat(buffer)

end

return Markov

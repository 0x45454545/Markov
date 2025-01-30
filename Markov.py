from collections import deque
from random      import choices

linear = lambda increase : \
         lambda x        : x + increase

id = lambda a : a

def ordering(string, order = 1):

    stream = [ ]
    subset = deque([ None ] * order, order)

    for character in string:

        stream.append( (tuple(subset), character) )

        subset.append( character )

    for _ in range(order):

        stream.append( (tuple(subset), None) )

        subset.append( None )

    return stream

def feed(chain, stream, f = linear(1)):

    for prefix, suffix in stream:

        if prefix not in chain:
            chain [prefix] = { }

        if suffix not in chain[prefix]:
            chain [prefix] [suffix] = 0

        chain [prefix] [suffix] = f( chain [prefix] [suffix] )

def generate(chain, max_length = 255):

    order = len(next(iter(chain.keys())))
    trace = deque([ None ] * order, order)

    first = tuple(trace)
    after = choices(list(chain[first].keys()), list(chain[first].values())) [0]

    generated = ""

    while after and (max_length := max_length - 1):
        generated += after

        trace.append(after)

        first = tuple(trace)
        after = choices(list(chain[first].keys()), list(chain[first].values())) [0]

    return generated

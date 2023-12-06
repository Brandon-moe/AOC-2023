import re
import math
from itertools import islice
def solve(file):
    with open(file,"r") as input:
        data = input.read().split("\n")[:-1]
    data = [len(set(x)&set(y)) for x,y in zip(map(lambda x:re.findall(r'(\d+) ',x.split("|")[0]),data), map(lambda x:re.findall(r'(\d+)',x.split("|")[1]),data))]
    part1 = sum([math.floor(2**(x-1)) for x in data])
    tickets = [1]*len(data)
    for idx,val in islice(enumerate(data), len(data)-1):
        tickets[idx+1:idx+1+val] = [t+tickets[idx]for t in tickets[idx+1:idx+1+val]]
    return part1,sum(tickets)

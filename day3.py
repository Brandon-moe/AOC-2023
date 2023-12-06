import re
from itertools import chain
def part1(data):
    symbols = [(x, y) for x, row in enumerate(data) for y, elem in enumerate(row) if re.compile(r'[^0-9.]').match(elem)]
    covered = [(x + dx, y + dy) for x, y in symbols for dx in [-1, 0, 1] for dy in [-1, 0, 1] if (dx, dy) != (0, 0)]
    for point in covered:
        data = [[data[i][j] + "x" if ((i, j) == point and data[i][j].isdigit()) else data[i][j] for j in range(len(data[i]))]for i in range(len(data))]
    return sum([int(re.sub(r'\D', '', x)) for x in re.sub(r'[^0-9x]',".",''.join(list(chain(*[row + ["."] for row in data])))).split(".") if "x" in x])
def encode(x):
    return "".join(["abcdefghij"[int(n)] for n in str(x)])
def part2(data):
    symbols = [(x, y) for x, row in enumerate(data) for y, elem in enumerate(row) if elem == "*"]
    covered = [(x + dx, y + dy,f"m{encode(x)}x{encode(y)}m") for x, y in symbols for dx in [-1, 0, 1] for dy in [-1, 0, 1] if (dx, dy) != (0, 0)]
    for point in covered:
        data = [[data[i][j] + point[2] if ((i, j) == (point[0],point[1]) and data[i][j][0].isdigit()) else data[i][j] for j in range(len(data[i]))]for i in range(len(data))]
    data = ''.join(list(chain(*[row + ['.'] for row in data])))
    gears,parts = set(re.compile(r'm(.*?)m').findall(data)),set(re.compile(r'(\d+[a-z0-9]*)').findall(data))
    gearscore = [int(re.sub(r'\D', '', x[0])) * int(re.sub(r'\D', '', x[1])) for x in [[x for x in parts if "m"+y+"m" in x] for y in gears] if len(x) == 2]
    return sum(gearscore)

with open("input.txt","r") as input:
    data = [list(line) for line in input.read().split("\n")[:-1]]
    print(part1(data),part2(data))

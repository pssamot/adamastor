import bisect
import random

l = []
l_not = []
for i in range(1, 20):
    r = random.randint(1, 100)
    position = bisect.bisect_left(l, r)
    l_not.append(r)
    bisect.insort(l, r)
    print(r, position,"\n", l,"\n", l_not, "\n\n")
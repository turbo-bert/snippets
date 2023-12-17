import numpy as NP
import itertools

x = NP.array([1,2,3,4,8,7,6])
print(x)
for y in itertools.permutations(x):
    print(list(y))


x = NP.array([1,1,1])
print(x)
print(NP.linalg.norm(x, ord=2))

x = NP.zeros([2,8])
x = NP.full([2,8], 2)
x = NP.fromstring('1.2, 2', dtype=float, sep=',')
x = NP.ones([8,2]) #, dtype=int)
x = NP.identity(3) #, dtype=int)
print(x)

print(NP.e)
print(NP.pi)

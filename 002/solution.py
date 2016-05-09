TARGET = 4e6
fibs = [1,1]
fib = 0
counter = 2
SUM = 0
while fib<TARGET:
    fib = fibs[counter-1]+fibs[counter-2]
    counter += 1
    fibs.append(fib)
    if fib%2==0:
        SUM += fib

print SUM

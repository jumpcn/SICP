
def average(x, y):
    return (x + y) / 2

def improve(update, isclose, guess=1):
    while not isclose(guess):
        guess = update(guess)
    return guess

def approx_eq(x, y, eps=1e-9):
    return abs(x - y) < eps

def sqrt(x):
    def sqrt_update(guess):
        return average(guess, 1.0 * x / guess)

    def sqrt_close(guess):
        return approx_eq(guess * guess, x)

    return improve(sqrt_update, sqrt_close)

print sqrt(10)


# decorators

def trace1(fn):
    def cal(x):
        print "here called fn", fn
        return fn(x)
    return cal

@trace1
def triple(x):
    return 3 * x

print triple(12)
import timeit

# All solutions in this program have been taken from the overview PDF of the
# problem on projecteuler.net


def reverse(n):
    reversed = 0
    while n > 0:
        reversed = 10*reversed + n % 10
        n = n/10
    return reversed

def isPalindrome(n):
    return n == reverse(n)

def fast():
    largestPalindrome = 0
    a = 999
    while a >= 100:
        b = 999
        while b >= a:
            if a*b <= largestPalindrome:
                break # Since a*b is always going to be too small
            if isPalindrome(a*b):
                largestPalindrome = a*b
            b = b-1
        a = a-1
    print largestPalindrome

def slow():
    largestPalindrome = 0
    a = 0
    while a <= 999:
        b = 0
        while b <= 999:
            if isPalindrome(a*b) and a*b >= largestPalindrome:
                largestPalindrome = a*b
            b = b+1
        a = a+1
    print largestPalindrome

def fastest():
    largestPalindrome = 0
    a = 999
    while a >= 100:
        if a % 11 == 0:
            b = 999
            db = 1
        else:
            b = 990 # The largest number less than or equal 999
            # and divisible by 11
            db = 11
        while b >= a:
            if a*b <= largestPalindrome:
                break
            if isPalindrome(a*b):
                largestPalindrome = a*b
            b = b-db
        a = a-1

    print largestPalindrome
    
t = timeit.Timer(slow)
print "Slow:", t.timeit(number=1)
t = timeit.Timer(fast)
print "Faster:", t.timeit(number=1)
t = timeit.Timer(fastest)
print "Fastest:", t.timeit(number=1)


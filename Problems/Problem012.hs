module Problems.Problem012 where
import Data.List.Ordered

-- Every triangle number can be calculated as n*(n+1)/2. Ultimately,
-- we want to know the number of divisors of triangle numbers. But
-- since n and n+1 are coprime we can calculate the divisors of each
-- of those numbers and then simply correct for the division by two
-- and add the number of divisors up.

-- n          1  2  3
-- n+1        2  3  4 
-- triang(n)  1  3  6

triangleNumbers :: [Integer]
triangleNumbers = fmap triang [1..]
  where triang n = n * (n+1) `div` 2

divisors 1 = [1]
divisors n = 1:[x | x <- [2..(n `div` 2)], n `rem` x == 0] ++ [n]

totalDivisors (a,b) = (length a) * (length b)

solution = ((n+1)*n)`div`2
  where n = 2*(length $ takeWhile (<=500) $ fmap totalDivisors (zip odd_divs even_divs))+1
        odd_divs = fmap divisors [1,3..]
        even_divs = fmap divisors [1..]

-- slow version uses 
-- solution = takeWhile (<100) $ fmap (length . divisors) triangleNumbers



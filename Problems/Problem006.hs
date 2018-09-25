module Problems.Problem006 where

sum_until :: Int -> Int
sum_until n = quot (n*(n+1)) 2

sum_squares :: Int -> Int
sum_squares n = quot (n * (n+1) * (2*n+1)) 6

solution :: Int
solution = s*s - sum_squares 100
	where s = sum_until 100


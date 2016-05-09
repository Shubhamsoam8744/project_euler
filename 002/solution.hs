{-stupid and straight-forward-}
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

{-http://blog.srinivasan.biz/software/fibonacci-numbers-the-slow-way-or-the-fast-and-lazy-way-}
{-fast-}
fibs = 1:1:zipWith (+) fibs (tail fibs)

every n xs = case drop (n-1) xs of
				(y:ys) -> y : every n ys
				[] -> []

main = do
		print $ sum evenfib
			where evenfib = takeWhile (<4000000) (every 3 fibs)


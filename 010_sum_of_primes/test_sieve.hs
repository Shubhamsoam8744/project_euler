sieve (x:xs) = x:(sieve $ filter (\a -> a `mod` x /= 0) xs)
main = do
	let ans = sum $ takeWhile (<200000) ([2] ++ sieve [3,5..])
	print ans

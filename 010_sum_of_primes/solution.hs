import Primes

main = do
		print $ foldl (+) 0 (takeWhile (<2000000) primes)
		{-print $ (takeWhile (<2000000) primes)!!100000-}

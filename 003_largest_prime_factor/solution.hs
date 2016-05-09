import Primes

primeFactors n = factor n primes
  where
    factor n (p:ps)
        | p*p > n        = [n]
        | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
        | otherwise      =     factor n ps

main = do
		let target = 600851475143
		let root = sqrt (fromIntegral target)
		print $ last $ primeFactors target
		{-print $ last $ filter (\x -> (target `mod` x) == 0) $ takeWhile (< ceiling(root)) primes-}

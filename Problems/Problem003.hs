module Problems.Problem003 (
  primes,
  primeFactors,
  solution
  )
where

 -- ordered lists, difference and union
minus (x:xs) (y:ys) = case (compare x y) of 
           LT -> x : minus  xs  (y:ys)
           EQ ->     minus  xs     ys 
           GT ->     minus (x:xs)  ys
minus  xs     _     = xs

union (x:xs) (y:ys) = case (compare x y) of 
           LT -> x : union  xs  (y:ys)
           EQ -> x : union  xs     ys 
           GT -> y : union (x:xs)  ys
union  xs     []    = xs
union  []     ys    = ys

foldi            :: (a -> a -> a) -> a -> [a] -> a
foldi f z []     = z
foldi f z (x:xs) = f x (foldi f z (pairs f xs))

pairs            :: (a -> a -> a) -> [a] -> [a]
pairs f (x:y:t)  = f x y : pairs f t
pairs f t        = t

{-https://wiki.haskell.org/Fold-}
{-Sieve of Eratosthenes-}
primes :: (Integral a) => [a]
primes = 2 : 3 : ([5,7..] `minus`
                     foldi (\(x:xs) -> (x:) . union xs) []
                          [[p*p, p*p+2*p..] | p <- tail primes])



primeFactors n = factor n primes
  where
    factor n (p:ps)
        | p*p > n        = [n]
        | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
        | otherwise      =     factor n ps

solution = last $ primeFactors target
  where target = 600851475143

{-|
Module      : Problems.Problem003
Description : Largest prime factor of 600851475143
Maintainer  : ahartel@gmx.de
Stability   : experimental

Original problem text:

@The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?@
-}

module Problems.Problem003 (
  foldi,
  pairs,
  primes,
  primeFactors,
  solution
  )
where
import Data.List.Ordered

-- | Tree-like fold on indefinitely defined lists. See
-- <https://wiki.haskell.org/Fold>.
foldi            :: (a -> a -> a) -> a -> [a] -> a
foldi f z []     = z
foldi f z (x:xs) = f x (foldi f z (pairs f xs))

-- | Used as helper function in 'foldi'
pairs            :: (a -> a -> a) -> [a] -> [a]
pairs f (x:y:t)  = f x y : pairs f t
pairs f t        = t

-- | Lazy Prime Sieve of Eratosthenes Taken from
-- <https://wiki.haskell.org/Prime_numbers#Sieve_of_Eratosthenes>.
-- Take the set of all odd positive integers minus the set of
-- multiples of the tail of the current list of primes. The multiples
-- only have to be calculated starting from the square of the prime
-- (because lower multiples would already have been crossed out) and
-- then in steps of 2*p (because adding p to p*p would result in an even
-- number since both are odd). Uses set 'minus' and set 'union' for
-- ordered lists from Data.List.Ordered.
primes :: (Integral a) => [a]
primes = 2 : 3 : ([5,7..] `minus`
                     foldi (\(x:xs) -> (x:) . union xs) []
                          [[p*p, p*p+2*p..] | p <- tail primes])


-- | Using 'mod' and 'div' from Prelude here.
primeFactors n = factor n primes
  where
    factor n (p:ps)
        | p*p > n        = [n]
        | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
        | otherwise      =     factor n ps

-- | Calculate the solution by picking the last element in the list of
-- prime factors of the target value 600851475143
solution = last $ primeFactors target
  where target = 600851475143

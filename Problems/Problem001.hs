{-|
Module      : Problems.Problem001
Description : Sum multiples of 3 and 5 below 1000
Maintainer  : ahartel@gmx.de
Stability   : experimental

Original problem text:

@ If we list all the natural numbers below 10 that are multiples of 3
or 5, we get 3, 5, 6 and 9.  The sum of these multiples is 23.  Find
the sum of all the multiples of 3 or 5 below 1000.@
-}
module Problems.Problem001 where

-- | 'summ' calculates the sum of all multiples of an integer n up to
-- a target value t.  It uses the Gauß'sche Summenformel. This can be
-- done because if we want for example the sum of all multiples of 3
-- up to 999, we get: \[3 + 6 + 9 + ... + 999 = 3 * (1 + 2 + 3 + \ldots + 333)
-- = 3 * (333 + 1) * 333 / 2\]
-- Where we us in the las step:
-- \[\sum_{i=1}^n i = (n+1)*n/2\]
--
-- The function 'quot' does integer division with truncation towards zero.
-- It divides the first argument by the second one discarding remainder
summ :: Int -- ^ t: target value up to which the function will sum multiples
     -> Int -- ^ n: multiples of this number will be summed 
     -> Int -- ^ return value
summ t n = n * (quot ((p+1)*p) 2)
  where p = quot t n


-- | 'solution' calculates the solution to Problem 001 using 'summ'.
-- After summing multiples of 3 and 5 we have to subtract the
-- multiples of 15 to not count those twice.
solution :: Int
solution = add_multiples target
  where target = 999
        add_multiples tgt = ((summ tgt 3) + (summ tgt 5) - (summ tgt 15))


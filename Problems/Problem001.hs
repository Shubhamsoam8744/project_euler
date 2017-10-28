module Problems.Problem001 where
-- Problem 001
-- Original problem text:
-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
-- The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.

-- The function quot :: Integral a => a -> a -> a
-- integer division, it divides the first argument by the second one discarding remainder

-- Here, we use what is called in german "Gauß'sche Summenformel"
-- Because 3 + 6 + 9 + ... + 999 = 3 * (1 + 2 + 3 + ... + 333) = 3 * (333 + 1) * 333 / 2
summ :: Int -> Int -> Int
summ t n = n * (quot ((p+1)*p) 2)
  where p = quot t n

solution :: Int
solution = add_multiples target
  where target = 999
        add_multiples tgt = ((summ tgt 3) + (summ tgt 5) - (summ tgt 15))


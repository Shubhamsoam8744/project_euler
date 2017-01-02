import Test.Hspec
import Test.QuickCheck

-- Original problem text:
-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
-- The sum of these multiples is 23.
-- Find the sum of all the multiples of 3 or 5 below 1000.

-- The function quot :: Integral a => a -> a -> a
-- integer division, it divides the first argument by the second one discarding remainder

-- Here, we use what is called in german "Gauß'sche Summenformel"
-- Because 3 + 6 + 9 + ... + 999 = 3 * (1 + 2 + 3 + ... + 333) = 3 * (333 + 1) * 333 / 2
summ t n = n * (quot ((p+1)*p) 2)
  where p = quot t n

main = hspec $ do
  let target = 999
  describe "Project Euler" $ do
    it "Solution to problem 001 should be 233168" $ do
      ((summ target 3) + (summ target 5) - (summ target 15)) `shouldBe` (233168 :: Int)

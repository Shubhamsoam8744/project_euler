import Test.Hspec
import Test.QuickCheck

-- taken from post of user dough in the thread of problem 4 on projecteuler.net
palindrome :: Integer -> Bool
palindrome n = if ((show n) == (reverse $ show n)) then True else False

-- taken from http://learnyouahaskell.com/recursion
-- see also http://wiki.c2.com/?QuickSortInHaskell
quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  

main = hspec $ do
  describe "Project Euler" $ do
    it "Solution to problem 004 should be 906609" $ do
      (last $ quicksort $ filter (palindrome) $ [a*b | a <- [100..999], b <- [100..999]]) `shouldBe` (906609 :: Integer)

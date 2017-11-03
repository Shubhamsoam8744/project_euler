{-|
Module      : Problems.Problem004
Description : Largest palindrome made from the product of 3-digit numbers
Maintainer  : ahartel@gmx.de
Stability   : experimental

Original problem text:

@A palindromic number reads the same both ways. The largest palindrome
made from the product of two 2-digit numbers is 9009 = 91 x 99.
Find the largest palindrome made from the product of two 3-digit numbers.@
-}


module Problems.Problem004 where

-- | Use 'reverse' and 'show' from prelude to determine if the number
-- n (taken as string) is equal to its reveresed string. Taken from
-- post of user /dough/ in the thread of problem 4 on projecteuler.net
palindrome :: Int -> Bool
palindrome n = if ((show n) == (reverse $ show n)) then True else False

-- | Taken from <http://learnyouahaskell.com/recursion>, see also
-- <http://wiki.c2.com/?QuickSortInHaskell>
quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  

-- | Filter the list of all products of all 3-digit numbers for
-- palindromes, then sort the resulting list and return the last
-- element.
solution :: Int
solution = (last $ quicksort $ filter (palindrome) $ [a*b | a <- [100..999], b <- [100..999]])

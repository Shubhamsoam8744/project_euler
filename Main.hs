module Main where

import Test.Hspec
import Problems.Problem001 as P001
import Problems.Problem002 as P002
import Problems.Problem003 as P003
import Problems.Problem004 as P004
import Problems.Problem012 as P012

-- | 'main' runs the main program
main :: IO ()
main = hspec $ do
  describe "Project Euler" $ do
    it "Solution to problem 001 should be 233168" $ do
      P001.solution `shouldBe` (233168 :: Int)
    it "Solution to problem 002 should be 4613732" $ do
      P002.solution `shouldBe` 4613732
    it "Solution to problem 003 should be 6857" $ do
      P003.solution `shouldBe` 6857
    it "Solution to problem 004 should be 906609" $ do
      P004.solution `shouldBe` (906609 :: Int)
    it "Solution to problem 012 should be 76576500" $ do
      P012.solution `shouldBe` (76576500 :: Int)

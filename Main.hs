module Main where

import Test.Hspec
import Problems.Problem001 as P001
import Problems.Problem002 as P002

main :: IO ()

main = hspec $ do
  describe "Project Euler" $ do
    it "Solution to problem 001 should be 233168" $ do
      P001.solution `shouldBe` (233168 :: Int)
    it "Solution to problem 002 should be 4613732" $ do
      P002.solution `shouldBe` 4613732

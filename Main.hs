module Main where

import Test.Hspec
import Problems.Problem001 as P001

main :: IO ()

main = hspec $ do
  describe "Project Euler" $ do
    it "Solution to problem 001 should be 233168" $ do
      P001.solution `shouldBe` (233168 :: Int)

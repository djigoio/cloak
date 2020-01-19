module CloakSpec
  ( spec,
  )
where

import Test.Hspec

spec :: Spec
spec =
  describe "lol"
    $ it "ha ha"
    $ (1 + 1 :: Int) `shouldBe` 2

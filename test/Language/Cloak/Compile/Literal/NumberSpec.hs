module Language.Cloak.Compile.Literal.NumberSpec (spec) where

import qualified Language.Cloak.Compile.Literal.Number as Number
import qualified Language.Cloak.Syntax.Literal.Number as Number
import qualified Language.Haskell.Exts.Syntax as Haskell
import Test.Hspec

spec :: Spec
spec =
  describe "compilation of"
    . describe "number literals"
    $ do
      it "compiles positive integers into Haskell integers" $ do
        let input = Number.IntegerNode undefined 42 "42"
        let expectedOutput = Haskell.Int () 42 "42"
        Number.compile input `shouldBe` expectedOutput
      it "compiles negative integers into Haskell integers" $ do
        let input = Number.IntegerNode undefined (-42) "-42"
        let expectedOutput = Haskell.Int () (-42) "-42"
        Number.compile input `shouldBe` expectedOutput
      it "compiles positive floats into Haskell floats" $ do
        let input = Number.FloatNode undefined 4.2 "4.2"
        let expectedOutput = Haskell.Frac () 4.2 "4.2"
        Number.compile input `shouldBe` expectedOutput
      it "compiles negative floats into Haskell floats" $ do
        let input = Number.FloatNode undefined (-4.2) "-4.2"
        let expectedOutput = Haskell.Frac () (-4.2) "-4.2"
        Number.compile input `shouldBe` expectedOutput
